#!/usr/bin/env python3
from migen import *
from migen.genlib.io import CRG
from litex.build.generic_platform import IOStandard, Subsignal, Pins
from litex_boards.platforms import cain_test
from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *
from ios import Led
# IOs ------------------------------------------------------------------------
_serial = [
    ("serial", 0,
        Subsignal("tx", Pins("C4")),  # J1.1
        Subsignal("rx", Pins("D4")),  # J1.2
        IOStandard("LVCMOS33")
     ),
]
_leds = [
    ("user_led", 0, Pins("T6"), IOStandard("LVCMOS33")),  # LED en la placa
    ("user_led", 1, Pins("F3"), IOStandard("LVCMOS33")),  # LED externo
]
# BaseSoC --------------------------------------------------------------------
class BaseSoC(SoCCore):
    def __init__(self):
        platform = cain_test.Platform()
        sys_clk_freq = int(25e6)
        platform.add_extension(_serial)
        platform.add_extension(_leds)
        # SoC with CPU
        SoCCore.__init__(
            self, platform,
            cpu_type                 = "lm32",
            clk_freq                 = 25e6,
            ident                    = "LiteX CPU cain_test", ident_version=True,
            integrated_rom_size      = 0x8000,
            integrated_main_ram_size = 0x4000)
        # Clock Reset Generation
        self.submodules.crg = CRG( platform.request("clk25"),
            ~platform.request("user_btn_n")
        )
        # Led
        user_leds = Cat(*[platform.request("user_led", i) for i in range(1)])
        self.submodules.leds = Led(user_leds)
        self.add_csr("leds")
# Build -----------------------------------------------------------------------
soc = BaseSoC()
builder = Builder(soc, output_dir="build", csr_csv="csr.csv", csr_svd="csr.svd")
builder.build()


















