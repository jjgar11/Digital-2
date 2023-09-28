# *************************************************
# IMPORTANTE PARA PODER COMPILAR ESTE EJEMPLO:
# En el aechivo:litex/litex/soc/software/common.mak
# cambiar de:
# ifeq ($(LTO), 1)
# COMMONFLAGS += -flto
# endif
# a:
# COMMONFLAGS += -flto
# *************************************************
OBJECTS =  hello.o 
#CROSS   = riscv64-unknown-elf
CROSS   = riscv32-unknown-elf
CC      = $(CROSS)-gcc
AS      = $(CROSS)-as
LD      = $(CROSS)-ld
OBJDUMP = $(CROSS)-objdump
LIB_DIR = -Llibfemtorv -L/home/carlos/miniconda3/envs/fpga/riscv32-elf/lib/rv32i/ilp32/ \
          -L/home/carlos/miniconda3/envs/fpga/lib/gcc/riscv32-elf/10.1.0/rv32iac/ilp32/
LIBS    = -lfemtorv -lm -lc -lgcc
LDFLAGS = -m elf32lriscv -b elf32-littleriscv --no-relax --print-memory-usage -Tlinker.ld
AFLAGS  = -march=rv32i -mabi=ilp32
CFLAGS  =  -Ilibfemtorv/include -Ilibfemtoc/include -fno-pic -march=rv32i -mabi=ilp32 -fno-stack-protector -w -Wl,--no-relax
OBJCOPY = $(CROSS)-objcopy
all: firmware.hex
#vpath %S libfemtorv 

%.bin: %.elf
#	$(OBJCOPY) -O verilog $< $@
	$(OBJCOPY) -O binary $< $@
	chmod -x $@

firmware.elf: $(OBJECTS) 
	$(LD) $(LDFLAGS)  -Map firmware.map $(OBJECTS) -o $@  ${LIB_DIR}  ${LIBS}  
	chmod -x $@
	
firmware.hex: firmware.elf firmware.lst
	../firmware_words firmware.elf -ram 8192 -max_addr 8192  -out firmware.hex

firmware.lst: firmware.elf
	$(OBJDUMP) -h -S $< > $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< 
%.o: %.S
	$(AS) $(AFLAGS) -c $< -o $@
clean:
	rm -rf  $(OBJECTS) *.elf *.bin .*~ *~ *.map *.d *.hex *.lst
.PHONY: clean


#export PATH=$PATH:/home/carlos/Embedded/litex_work/learn-fpga/FemtoRV/FIRMWARE/TOOLCHAIN/riscv64-unknown-elf-gcc-8.3.0-2020.04.0-x86_64-linux-ubuntu14/bin/


#/home/carlos/Embedded/litex_work/learn-fpga/FemtoRV/FIRMWARE//TOOLCHAIN/riscv64-unknown-elf-gcc-8.3.0-2020.04.0-x86_64-linux-ubuntu14/bin/riscv64-unknown-elf-gcc -O3 -I/home/carlos/Embedded/litex_work/learn-fpga/FemtoRV/FIRMWARE//LIBFEMTOGL -I/home/carlos/Embedded/litex_work/learn-fpga/FemtoRV/FIRMWARE//LIBFEMTORV32 -I/home/carlos/Embedded/litex_work/learn-fpga/FemtoRV/FIRMWARE//LIBFEMTOC -DFGA=1 -DSSD1331=1 -DSDCARD=1 -fno-pic -march=rv32imafc -mabi=ilp32f -fno-stack-protector -w -Wl,--no-relax   -c sieve.c

#/home/carlos/Embedded/litex_work/learn-fpga/FemtoRV/FIRMWARE//TOOLCHAIN/riscv64-unknown-elf-gcc-8.3.0-2020.04.0-x86_64-linux-ubuntu14/bin/riscv64-unknown-elf-ld -m elf32lriscv -b elf32-littleriscv --no-relax --print-memory-usage -T/home/carlos/Embedded/litex_work/learn-fpga/FemtoRV/FIRMWARE//CRT/baremetal.ld sieve.o -o sieve.baremetal.elf -L/home/carlos/Embedded/litex_work/learn-fpga/FemtoRV/FIRMWARE//TOOLCHAIN/riscv64-unknown-elf-gcc-8.3.0-2020.04.0-x86_64-linux-ubuntu14/riscv64-unknown-elf/lib/rv32imafc/ilp32f -L/home/carlos/Embedded/litex_work/learn-fpga/FemtoRV/FIRMWARE//CRT -L/home/carlos/Embedded/litex_work/learn-fpga/FemtoRV/FIRMWARE//LIBFEMTOGL -L/home/carlos/Embedded/litex_work/learn-fpga/FemtoRV/FIRMWARE//LIBFEMTORV32 -L/home/carlos/Embedded/litex_work/learn-fpga/FemtoRV/FIRMWARE//LIBFEMTOC -lfemtoGL -lfemtorv32 -lfemtoc  /home/carlos/Embedded/litex_work/learn-fpga/FemtoRV/FIRMWARE//TOOLCHAIN/riscv64-unknown-elf-gcc-8.3.0-2020.04.0-x86_64-linux-ubuntu14/riscv64-unknown-elf/lib/rv32imafc/ilp32f/libc.a /home/carlos/Embedded/litex_work/learn-fpga/FemtoRV/FIRMWARE//TOOLCHAIN/riscv64-unknown-elf-gcc-8.3.0-2020.04.0-x86_64-linux-ubuntu14/riscv64-unknown-elf/lib/rv32imafc/ilp32f/libm.a /home/carlos/Embedded/litex_work/learn-fpga/FemtoRV/FIRMWARE//TOOLCHAIN/riscv64-unknown-elf-gcc-8.3.0-2020.04.0-x86_64-linux-ubuntu14/lib/gcc/riscv64-unknown-elf/8.3.0/rv32imafc/ilp32f/libgcc.a

