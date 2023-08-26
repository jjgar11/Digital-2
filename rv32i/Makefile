TARGET=SOC
TOP=blink

OBJS+= soc_femto.v


# TRELLIS=/usr/local/share/trellis

# all: ${TARGET}.bit ${TARGET}.svf
all: $(TARGET).fs



$(TARGET).fs: 
	gw_sh  soc_src.tcl

${TARGET}.svf : ${TARGET}.bit

clean:
	rm -rf impl obj_dir *svg a.out *.vcd

sim: 
	rm -f a.out *.vcd
	iverilog -DBENCH -DSIM -DPASSTHROUGH_PLL -DBOARD_FREQ=27 -DCPU_FREQ=27 bench_iverilog.v soc_femto.v
	vvp a.out
	gtkwave bench.vcd

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

configure: ${TARGET}.fs
	sudo openFPGALoader -b tangprimer20k -m impl/pnr/project.fs
	

.PHONY: clean


# export PATH=$PATH:/home/carlos/Embedded/Gowin/IDE/bin
#Install netlistsvg for svg generation
