#!/usr/bin/env python3

from migen import *
from migen.genlib.resetsync import AsyncResetSynchronizer

from litex.gen import *

from litex.build.io import DDROutput
from litex.build.generic_platform import IOStandard, Subsignal, Pins

from litex_boards.platforms import alpha_board

from litex.soc.cores.clock import *
from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *
from litex.soc.cores.led import LedChaser

from litedram.modules import M12L64322A
from litedram.phy import GENSDRPHY, HalfRateGENSDRPHY

from liteeth.phy.ecp5rgmii import LiteEthPHYRGMII

from module import my_screen

# IOs ----------------------------------------------------------------------------------------------

_screen = [
	("rows_data", 0,
		Subsignal("R0", Pins("G14")),
		Subsignal("G0", Pins("G13")),
		Subsignal("B0", Pins("F12")),
		Subsignal("R1", Pins("F13")),
		Subsignal("G1", Pins("F14")),
		Subsignal("B1", Pins("E14")),
		Subsignal("clk_screen", Pins("M3")),
		Subsignal("blank", Pins("M4")),
		Subsignal("latch", Pins("N1")),
		Subsignal("row", Pins("N5 N3 P3 P4 N4")),
		IOStandard("LVCMOS33")
	),
]

# CRG ----------------------------------------------------------------------------------------------

class _CRG(LiteXModule):
	def __init__(self, platform, sys_clk_freq, use_internal_osc=False, sdram_rate="1:1"):
		self.rst    = Signal()
		self.cd_sys = ClockDomain()
		if sdram_rate == "1:2":
			self.cd_sys2x    = ClockDomain()
			self.cd_sys2x_ps = ClockDomain()
		else:
			self.cd_sys_ps = ClockDomain()

		# # #

		# Clk / Rst
		if not use_internal_osc:
			clk = platform.request("clk25")
			clk_freq = 25e6
		else:
			clk = Signal()
			div = 5
			self.specials += Instance("OSCG",
								p_DIV = div,
								o_OSC = clk)
			clk_freq = 310e6/div

		rst_n = platform.request("user_btn_n", 0)

		# PLL
		self.pll = pll = ECP5PLL()
		self.comb += pll.reset.eq(~rst_n | self.rst)
		pll.register_clkin(clk, clk_freq)
		pll.create_clkout(self.cd_sys,    sys_clk_freq)
		if sdram_rate == "1:2":
			pll.create_clkout(self.cd_sys2x,    2*sys_clk_freq)
			pll.create_clkout(self.cd_sys2x_ps, 2*sys_clk_freq, phase=180) # Idealy 90° but needs to be increased.
		else:
			pll.create_clkout(self.cd_sys_ps, sys_clk_freq, phase=180) # Idealy 90° but needs to be increased.

		# SDRAM clock
		sdram_clk = ClockSignal("sys2x_ps" if sdram_rate == "1:2" else "sys_ps")
		self.specials += DDROutput(1, 0, platform.request("sdram_clock"), sdram_clk)

# BaseSoC ------------------------------------------------------------------------------------------

class BaseSoC(SoCCore):
	def __init__(self):
		platform = alpha_board.Platform()

		platform.add_extension(_screen)
		platform.add_source("../rtl/cores/screen/screen.v")

		sys_clk_freq		= int(60e6)
		with_ethernet		= True
		eth_phy				= 0
		with_led_chaser		= True
		use_internal_osc	= True
		sdram_rate			= "1:1"

		# Clock Reset Generation --------------------------------------------------------------------------------------
		self.crg = _CRG(platform, sys_clk_freq,
			use_internal_osc = use_internal_osc,
			sdram_rate       = sdram_rate
		)

		# SoCCore ----------------------------------------------------------------------------------
		SoCCore.__init__(
			self, platform, 
			int(sys_clk_freq), 
			ident="LiteX SoC on alpha_board", 
			ident_version=True,
			cpu_type="vexriscv",
			integrated_rom_size=0x8000,
			integrated_main_ram_size=0x4000
		)

		SoCCore.add_csr(self, "screen_verilog")
		self.submodules.screen_verilog = my_screen.Verilog_Screen(platform.request("rows_data", 0))

		# SDR SDRAM --------------------------------------------------------------------------------
		if not self.integrated_main_ram_size:
			sdrphy_cls = HalfRateGENSDRPHY if sdram_rate == "1:2" else GENSDRPHY
			self.sdrphy = sdrphy_cls(platform.request("sdram"), sys_clk_freq)
			sdram_cls  = M12L64322A
			self.add_sdram("sdram",
				phy                     = self.sdrphy,
				module                  = sdram_cls(sys_clk_freq, sdram_rate),
				l2_cache_size           = kwargs.get("l2_size", 8192),
				l2_cache_full_memory_we = False,

			)

		# Ethernet ---------------------------------------------------------------------
		if with_ethernet:
			self.ethphy = LiteEthPHYRGMII(
				clock_pads = self.platform.request("eth_clocks", eth_phy),
				pads       = self.platform.request("eth", eth_phy),
				tx_delay   = 0e-9)
			self.add_ethernet(phy=self.ethphy, data_width=32)

		# Leds -------------------------------------------------------------------------------------
		# Disable leds when serial is used.
		if (platform.lookup_request("serial", loose=True) is None and with_led_chaser):
			self.leds = LedChaser(
				pads         = platform.request_all("user_led_n"),
				sys_clk_freq = sys_clk_freq)


# Build --------------------------------------------------------------------------------------------

def main():

	soc = BaseSoC()
	builder = Builder(soc, output_dir='build/alpha_board_project', csr_csv='build/alpha_board_project/csr.csv')
	builder.build()

if __name__ == "__main__":
	main()
