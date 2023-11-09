from litex.build.generic_platform import *
from litex.build.lattice import LatticeECP5Platform
from litex.build.lattice.programmer import OpenOCDJTAGProgrammer

# IO ----------------------------------------------------------------------------------------------

_io = [
    # Clk
    ("clk25", 0, Pins("P6"), IOStandard("LVCMOS33")),

    # Led
    ("user_led_n", 0, Pins("T6"), IOStandard("LVCMOS33")),

    # Button
    ("user_btn_n", 0, Pins("R7"),  IOStandard("LVCMOS33")),

    # Serial
    ("serial", 0,
        Subsignal("tx", Pins("C4")), # C4 esta debajo de GND
        Subsignal("rx", Pins("D4")), # D4 esta al lado de TX
        IOStandard("LVCMOS33")
    ),

    # SPIFlash (25Q32JVSIQ)
    ("spiflash", 0,
        Subsignal("cs_n", Pins("N8")),
        #Subsignal("clk",  Pins("")), driven through USRMCLK
        Subsignal("mosi", Pins("T8")),
        Subsignal("miso", Pins("T7")),
        IOStandard("LVCMOS33"),
    ),

    # SDR SDRAM (M12L64322A-5T)
    ("sdram_clock", 0, Pins("C8"), IOStandard("LVCMOS33")),
    ("sdram", 0,
        Subsignal("a",     Pins("A9 B9 B10 C10 D9 C9 E9 D8 E8 C7 B8")),
        Subsignal("dq",    Pins(
            "D5 C5 E5 C6 D6 E6 D7 E7",
            "D10 C11 D11 C12 E10 C13 D13 E11",
            "A5 B4 A4 B3 A3 C3 A2 B2",
            "D14 B14 A14 B13 A13 B12 B11 A11")),
        Subsignal("we_n",  Pins("B5")),
        Subsignal("ras_n", Pins("B6")),
        Subsignal("cas_n", Pins("A6")),
        Subsignal("ba",    Pins("B7 A8")),
        Misc("SLEWRATE=FAST"),
        IOStandard("LVCMOS33"),
    ),

    # RGMII Ethernet (RTL8211FD)
    ("eth_clocks", 0,
        Subsignal("tx", Pins("L1")),
        Subsignal("rx", Pins("J1")),
        IOStandard("LVCMOS33")
    ),
    ("eth", 0,
        Subsignal("rst_n",   Pins("R6")),
        Subsignal("mdio",    Pins("T4")),
        Subsignal("mdc",     Pins("R5")),
        Subsignal("rx_ctl",  Pins("J2")),
        Subsignal("rx_data", Pins("K2 J3 K1 K3")),
        Subsignal("tx_ctl",  Pins("L2")),
        Subsignal("tx_data", Pins("M2 M1 P1 R1")),
        IOStandard("LVCMOS33")
    ),
    ("eth_clocks", 1,
        Subsignal("tx", Pins("J16")),
        Subsignal("rx", Pins("M16")),
        IOStandard("LVCMOS33")
    ),
    ("eth", 1,
        Subsignal("rst_n",   Pins("R6")),
        Subsignal("mdio",    Pins("T4")),
        Subsignal("mdc",     Pins("R5")),
        Subsignal("rx_ctl",  Pins("P16")),
        Subsignal("rx_data", Pins("M15 R16 L15 L16")),
        Subsignal("tx_ctl",  Pins("K14")),
        Subsignal("tx_data", Pins("K16 J15 J14 K15")),
        IOStandard("LVCMOS33")
    ),
]

# From https://github.com/q3k/chubby75/blob/master/5a-75e/hardware_V6.0.md
_connectors = [
    # ("j1",  "C4  D4  E4  - D3  E3  F4  N4 N5 N3 P3 P4 M3 N1 M4 -"),
    # ("j2",  "F3  F5  G3  - G4  H3  H4  N4 N5 N3 P3 P4 M3 N1 M4 -"),
    # ("j3",  "G5  H5  J5  - J4  B1  C2  N4 N5 N3 P3 P4 M3 N1 M4 -"),
    # ("j4",  "C1  D1  E2  - E1  F2  F1  N4 N5 N3 P3 P4 M3 N1 M4 -"),
    # ("j5",  "G2  G1  H2  - K5  K4  L3  N4 N5 N3 P3 P4 M3 N1 M4 -"),
    # ("j6",  "L4  L5  P2  - R2  T2  R3  N4 N5 N3 P3 P4 M3 N1 M4 -"),
    # ("j7",  "T3  R4  M5  - P5  N6  N7  N4 N5 N3 P3 P4 M3 N1 M4 -"),
    # ("j8",  "P7  M7  P8  - R8  M8  M9  N4 N5 N3 P3 P4 M3 N1 M4 -"),
    # ("j9",  "P11 N11 M11 - T13 R12 R13 N4 N5 N3 P3 P4 M3 N1 M4 -"),
    # ("j10", "R14 T14 D16 - C15 C16 B16 N4 N5 N3 P3 P4 M3 N1 M4 -"),
    # ("j11", "B15 C14 T15 - P15 R15 P12 N4 N5 N3 P3 P4 M3 N1 M4 -"),
    # ("j12", "P13 N12 N13 - M12 P14 N14 N4 N5 N3 P3 P4 M3 N1 M4 -"),
    # ("j13", "H15 H14 G16 - F16 G15 F15 N4 N5 N3 P3 P4 M3 N1 M4 -"),
    # ("j14", "E15 E16 L12 - L13 M14 L14 N4 N5 N3 P3 P4 M3 N1 M4 -"),
    # ("j15", "J13 K13 J12 - H13 H12 G12 N4 N5 N3 P3 P4 M3 N1 M4 -"),
    ("j16", "G14 G13 F12 - F13 F14 E14 N4 N5 N3 P3 P4 M3 N1 M4 -"),
]

# Platform -----------------------------------------------------------------------------------------

class Platform(LatticeECP5Platform):
    default_clk_name = "clk25"
    default_clk_period = 1e9/25e6

    def __init__(self, toolchain="trellis"):
        device = "LFE5U-25F-6BG256C"
        io = _io
        connectors = _connectors
        LatticeECP5Platform.__init__(self, device, io, connectors, toolchain=toolchain)

    def create_programmer(self):
        return OpenOCDJTAGProgrammer("openocd_colorlight_5a_75b.cfg")

    def do_finalize(self, fragment):
        LatticeECP5Platform.do_finalize(self, fragment)
        self.add_period_constraint(self.lookup_request("clk25",            loose=True), 1e9/25e6)
        self.add_period_constraint(self.lookup_request("eth_clocks:rx", 0, loose=True), 1e9/125e6)
        self.add_period_constraint(self.lookup_request("eth_clocks:rx", 1, loose=True), 1e9/125e6)
