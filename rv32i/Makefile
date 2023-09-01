#TARGET=colorlight_5a_75e
#TOP=colorlight_5a_75e
#TOP=blink
#GATE_DIR=build/gateware
#SOFT_DIR=build/software
#LITEX_DIR=/home/alph4/litex
#RTL_CPU_DIR=${LITEX_DIR}/pythondata-cpu-vexriscv/pythondata_cpu_vexriscv/verilog


#SERIAL?=/dev/ttyUSB0

#NEXTPNR=nextpnr-ecp5
#CC=riscv64-unknown-elf-gcc

TARGET=SOC
TOP=blink


OBJS+= femtorv32_quark.v


# TRELLIS=/usr/local/share/trellis

# all: ${TARGET}.bit ${TARGET}.svf
all: $(TARGET).fs



$(TARGET).fs: 
	gw_sh  soc_src.tcl

${TARGET}.svf : ${TARGET}.bit


.PHONY: clean
.PHONY: cleanall
clean:
	rm -rf impl obj_dir *svg a.out *.vcd *.json *.bit *.config *.rpt *.svf
cleanall:
	make -C ./asm_firmware clean
	make -C ./c_firmware clean
	rm -rf impl obj_dir *svg a.out *.vcd

sim: 
	rm -f a.out *.vcd
	iverilog -DBENCH -DSIM -DPASSTHROUGH_PLL -DBOARD_FREQ=27 -DCPU_FREQ=27 bench_iverilog.v soc_femto.v
	vvp a.out
	gtkwave bench.vcd &

sim_quark:
	rm -f a.out *.vcd
	iverilog -DBENCH -DSIM -DPASSTHROUGH_PLL -DBOARD_FREQ=27 -DCPU_FREQ=27 bench_quark.v femtorv32_quark.v
	vvp a.out
	gtkwave bench.vcd

sim_verilator: 
	verilator -CFLAGS '-I../libfemtorv32/ -DSTANDALONE_FEMTOELF' -DBENCH -DBOARD_FREQ=10 -DCPU_FREQ=10 -DPASSTHROUGH_PLL -Wno-fatal \
	--top-module SOC -cc -exe sim_main.cpp libfemtorv32/femto_elf.c soc_femto.v
	cd obj_dir; make -f VSOC.mk 
	obj_dir/VSOC
  	
svg: $(OBJS)
	yosys -p "prep -top ${TARGET}; write_json ${TARGET}.json" -DPASSTHROUGH_PLL -DBOARD_FREQ=27 -DCPU_FREQ=27  ${OBJS}
	netlistsvg ${TARGET}.json -o ${TARGET}.svg  #--skin default.svg
	yosys -p "prep -top ${TARGET} -flatten; write_json ${TARGET}_flat.json" ${OBJS}
	netlistsvg ${TARGET}_flat.json -o ${TARGET}_flat.svg  #--skin default.svg

configure: ${TARGET}.bit
	sudo openFPGALoader -c ft232RL --pins=RXD:RTS:TXD:CTS -m ${TARGET}.bit

$(TARGET)_out.config: $(TARGET).json
	nextpnr-ecp5 --json $< --lpf $(TARGET).lpf --textcfg $@ --25k --package CABGA256 --speed 6  --timing-allow-fail --seed 1 --lpf-allow-unconstrained
#	nextpnr-ecp5 --json $< --lpf $(TARGET).lpf --textcfg $@ --25k --package CABGA381 --speed 6  --timing-allow-fail --seed 1 --lpf-allow-unconstrained

$(TARGET).json: $(OBJS)
	yosys -p 'verilog_defaults -push; verilog_defaults -add -defer; read_verilog -formal $(OBJS); verilog_defaults -pop; attrmap -tocase keep -imap keep="true" keep=1 -imap keep="false" keep=0 -remove keep=0; synth_ecp5 -top $(TARGET); write_json $@' -l ${TARGET}.rpt

$(TARGET).bit: $(TARGET)_out.config
	ecppack --bootaddr 0 --compress $< --svf ${TARGET}.svf --bit $@



# export PATH=$PATH:/home/carlos/Embedded/Gowin/IDE/bin
#Install netlistsvg for svg generation
