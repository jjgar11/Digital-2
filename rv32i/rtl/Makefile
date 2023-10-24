TARGET=SOC
TOP=blink

OBJS = SOC.v
OBJS+= cores/cpu/femtorv32_quark.v
OBJS+= cores/uart/*uart.v
OBJS+= cores/multiplier/*multiplier.v
OBJS+= cores/divisor/*divisor.v
OBJS+= cores/bin2bcd/*bin2bcd.v
OBJS+= cores/screen/*screen.v


BUILD_DIR = build

all: $(TARGET).fs

$(TARGET).fs: 
	gw_sh  soc_src.tcl

${TARGET}.svf : ${TARGET}.bit

clean:
	rm -rf impl obj_dir *svg a.out *.vcd *.json *.bit build *.config *.rpt *.svf *.elf *.bin *.map *.d *.hex
sim: 
	rm -f a.out *.vcd
	iverilog -DBENCH -DSIM -DPASSTHROUGH_PLL -DBOARD_FREQ=27 -DCPU_FREQ=27 bench_quark.v $(OBJS)
	vvp a.out
	gtkwave bench.vcd &

sim_iverilog:
	rm -f a.out *.vcd
	iverilog -DBENCH -DSIM -DPASSTHROUGH_PLL -DBOARD_FREQ=27 -DCPU_FREQ=27 bench_iverilog.v $(OBJS)
	vvp a.out
	gtkwave bench.vcd &


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

########################
#  LATTICE COLORLIGHT 5A
########################
$(TARGET)_out.config: $(TARGET).json
	nextpnr-ecp5 --json $(BUILD_DIR)/$< --lpf $(TARGET).lpf --textcfg $(BUILD_DIR)/$@ --25k --package CABGA256 --speed 6  --timing-allow-fail --seed 1 --lpf-allow-unconstrained
#	nextpnr-ecp5 --json $< --lpf $(TARGET).lpf --textcfg $@ --25k --package CABGA381 --speed 6  --timing-allow-fail --seed 1 --lpf-allow-unconstrained
$(TARGET).json: $(OBJS)
	mkdir -p $(BUILD_DIR)
	yosys -p 'verilog_defaults -push; verilog_defaults -add -defer; read_verilog -formal $(OBJS); verilog_defaults -pop; attrmap -tocase keep -imap keep="true" keep=1 -imap keep="false" keep=0 -remove keep=0; synth_ecp5 -top $(TARGET); write_json $(BUILD_DIR)/$@' -l $(BUILD_DIR)/${TARGET}.rpt

$(TARGET).bit: $(TARGET)_out.config
	ecppack --bootaddr 0 --compress $(BUILD_DIR)/$< --svf $(BUILD_DIR)/${TARGET}.svf --bit $(BUILD_DIR)/$@

configure: ${TARGET}.bit
	sudo openFPGALoader -c ft232RL --pins=RXD:RTS:TXD:CTS -m $(BUILD_DIR)/${TARGET}.bit
	
########################
#  LATTICE COLORLIGHT I5
########################
$(TARGET)_i5.json: $(OBJS)
	mkdir -p $(BUILD_DIR)
	yosys -p 'verilog_defaults -push; verilog_defaults -add -defer; read_verilog -formal $(OBJS); verilog_defaults -pop; attrmap -tocase keep -imap keep="true" keep=1 -imap keep="false" keep=0 -remove keep=0; synth_ecp5 -top $(TARGET); write_json $(BUILD_DIR)/$@' -l $(BUILD_DIR)/${TARGET}.rpt

$(TARGET)_i5_out.config: $(TARGET)_i5.json
	nextpnr-ecp5 --json $(BUILD_DIR)/$< --lpf $(TARGET)_i5.lpf --textcfg $(BUILD_DIR)/$@ --25k --package CABGA381 --speed 6  --timing-allow-fail --seed 1 --lpf-allow-unconstrained

$(TARGET)_i5.bit: $(TARGET)_i5_out.config
	ecppack --bootaddr 0 --compress $(BUILD_DIR)/$< --svf $(BUILD_DIR)/${TARGET}.svf --bit $(BUILD_DIR)/$@

configure_i5: ${TARGET}_i5.bit   # TDI:TDO:TCK:TMS
	sudo openFPGALoader -b colorlight-i5 -m $(BUILD_DIR)/${TARGET}_i5.bit 

########################
#  TANG PRIMER 20K
########################
configure_tang: ${TARGET}.fs
	sudo openFPGALoader -b tangprimer20k -m impl/pnr/project.fs	

.PHONY: clean sim sim_iverilog sim_verilator configure configure_i5 configure_tang


# export PATH=$PATH:/home/carlos/Embedded/Gowin/IDE/bin
#Install netlistsvg for svg generation
