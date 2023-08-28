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
#OBJECTS =  wait.o putchar.o start.o #hello.o 
#OBJECTS = for.o 
OBJECTS = main.o multiplier.o putchar.o convert.o wait.o
CROSS   = riscv32-unknown-elf
CC      = $(CROSS)-gcc
AS      = $(CROSS)-as
LD      = $(CROSS)-ld
OBJCOPY = $(CROSS)-objcopy
OBJDUMP = $(CROSS)-objdump
AFLAGS  = -march=rv32i -mabi=ilp32

all: firmware.hex

%.bin: %.elf
#	$(OBJCOPY) -O verilog $< $@
	$(OBJCOPY) -O binary $< $@
	chmod -x $@

firmware.elf: $(OBJECTS) 
	$(LD) $(LDFLAGS) -T bram.ld  -m elf32lriscv -nostdlib -Map firmware.map -N -o $@ $(OBJECTS)
	chmod -x $@
	
firmware.hex: firmware.lst firmware_words
	../firmware_words_src/firmware_words firmware.elf -ram 1024 -max_addr 1024  -out firmware.hex

firmware_words:
	g++ -I../c_firmware/libfemtorv/include/ -DSTANDALONE_FEMTOELF -o ../firmware_words_src/firmware_words ../firmware_words_src/firmware_words.cpp ../c_firmware/libfemtorv/femto_elf.c

firmware.lst: firmware.elf
	$(OBJDUMP) -h -S $< > $@

%.o: %.c
	$(compile)
%.o: %.S
	$(AS) $(AFLAGS) -c $< -o $@
clean:
	rm -rf  $(OBJECTS) *.elf *.bin .*~ *~ *.map *.d *.hex *.o *.lst
.PHONY: clean


#export PATH=$PATH:/home/carlos/Embedded/litex_work/learn-fpga/FemtoRV/FIRMWARE/TOOLCHAIN/riscv64-unknown-elf-gcc-8.3.0-2020.04.0-x86_64-linux-ubuntu14/bin/
