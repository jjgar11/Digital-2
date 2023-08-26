CROSS_COMPILE ?= lm32-elf-

# extra plusargs for simulation
# eg. EXTRA_PLUSARGS = "+dump=dump.vcd"
EXTRA_PLUSARGS ?= +dump=dump.vcd

# enable additional debug output
# eg. EXTRA_DEFINES = "-DTB_ENABLE_WB_TRACES"
EXTRA_DEFINES ?=

CC      = $(CROSS_COMPILE)gcc
OBJCOPY = $(CROSS_COMPILE)objcopy

# in case make does not have this already defined
RM ?= rm -f

LDFLAGS = -Tlinker.ld -fno-builtin -nostdlib -lgcc

TARGET=system
RTL ?= ../rtl
SOURCES +=  $(RTL)/lm32/lm32_adder.v  $(RTL)/lm32/lm32_addsub.v $(RTL)/lm32/lm32_cpu.v
SOURCES += $(RTL)/lm32/lm32_dcache.v $(RTL)/lm32/lm32_debug.v $(RTL)/lm32/lm32_decoder.v
SOURCES += $(RTL)/lm32/lm32_icache.v $(RTL)/lm32/lm32_dp_ram.v $(RTL)/lm32/lm32_ram.v
SOURCES += $(RTL)/lm32/lm32_instruction_unit.v $(RTL)/lm32/lm32_interrupt.v
SOURCES += $(RTL)/lm32/lm32_jtag.v $(RTL)/lm32/lm32_load_store_unit.v
SOURCES += $(RTL)/lm32/lm32_logic_op.v $(RTL)/lm32/lm32_mc_arithmetic.v
SOURCES += $(RTL)/lm32/lm32_multiplier.v $(RTL)/lm32/lm32_shifter.v
#SOURCES += $(RTL)/lm32/lm32_simtrace.v 
SOURCES += $(RTL)/lm32/lm32_top.v
SOURCES += $(RTL)/wb_uart/wb_uart.v $(RTL)/wb_uart/uart.v  
SOURCES += $(RTL)/wb_timer/wb_timer.v
SOURCES += $(RTL)/wb_gpio/wb_gpio.v
SOURCES += $(RTL)/wb_conbus/conbus.v $(RTL)/wb_conbus/conbus_arb.v
SOURCES += $(RTL)/wb_bram/wb_bram.v
SOURCES += tb_system.v $(RTL)/lm32/system_conf.v ../system.v $(RTL)/lm32/lm32_include.v

all: tb_system

sim_%: %.vh tb_lm32_system
	@vvp tb_lm32_system +prog=$< $(EXTRA_PLUSARGS)

trace_%: %.vh tb_lm32_system
	@vvp tb_lm32_system +trace=trace_$*.txt +prog=$< $(EXTRA_PLUSARGS)

%.elf:
	$(CC) $(LDFLAGS) -o $@ $^

%.vh: %.elf
	$(OBJCOPY) -O verilog $< $@

view: tb_system
	./tb_system  >> instruction_dump.txt 
	gtkwave  system_tb.vcd test_soc.gtkw &
clean:
	$(RM) tb_system *.vcd *.elf *.vh trace*.txt $(TARGET)_syn.v tb_system tb_systm_syn *.blif

tb_system:
	iverilog -I. -I$(RTL) -I$(RTL)/lm32/ -o $@ $(SOURCES) $(EXTRA_DEFINES)

unittest:
	$(MAKE) -C unittests check
	
$(TARGET)_syn.v:
		yosys -p "verilog_defaults -push; verilog_defaults -add -defer; read_verilog $(SOURCES); verilog_defaults -pop; attrmap -tocase keep -imap keep="true" keep=1 -imap keep="false" keep=0 -remove keep=0; synth_ecp5 -top $(TARGET) -blif ${TARGET}.blif ; write_verilog $@"
		yosys -o $(TARGET)_syn.v $(TARGET).blif

tb_system_syn: $(TARGET)_syn.v
		iverilog -g2005 -o tb_systm_syn -D POST_SYNTHESIS tb_$(TARGET).v $(TARGET)_syn.v  `yosys-config --datdir/ecp5/cells_sim.v` 
	#	verilator --lint-only  $(TARGET)_syn.v -Iecp5 ecp5/cells_sim.v
	
		
# Las celdas para la simulación post synthesis se encuentran en la distribución de Yosys, en este caso que utilizamos conda en: ./envs/fpga/share/yosys/ecp5/
.PHONY: clean unittest

hello_world.elf: crt.S hello_world.c
pipe1.elf: pipe1.S
