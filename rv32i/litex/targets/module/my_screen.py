from migen import *
from migen.genlib.cdc import MultiReg
from litex.soc.interconnect.csr import *
from litex.soc.interconnect.csr_eventmanager import *

class Verilog_Screen(Module, AutoCSR):
	def __init__(self, data):
	# Interfaz
		self.clk		= ClockSignal()
		self.reset		= ResetSignal()
		self.R0			= data.R0
		self.G0			= data.G0
		self.B0			= data.B0
		self.R1			= data.R1
		self.G1			= data.G1
		self.B1			= data.B1
		self.clk_screen	= data.clk_screen
		self.blank		= data.blank
		self.latch		= data.latch
		self.row		= Signal(5)
		self.row		= data.row
	# Registros de escritura
		self.mat_in		= CSRStorage(32)
		self.wr_data	= CSRStorage()
		self.init		= CSRStorage()
	# Instanciacion modulo Verilog
		self.specials += Instance("screen64x64",
			i_reset			= self.reset,
			i_clk			= self.clk,
			i_mat_in		= self.mat_in.storage,
			i_wr_data		= self.wr_data.storage,
			i_init			= self.init.storage,
			o_clk_screen	= self.clk_screen,
			o_R0			= self.R0,
			o_G0			= self.G0,
			o_B0			= self.B0,
			o_R1			= self.R1,
			o_G1			= self.G1,
			o_B1			= self.B1,
			o_blank			= self.blank,
			o_latch			= self.latch,
			o_row			= self.row
			)
		self.submodules.ev = EventManager()
		self.ev.ok = EventSourceProcess()
		self.ev.finalize()