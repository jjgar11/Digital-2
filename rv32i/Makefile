firmware_words:
	make -C firmware/firmware_words_src/

c:
	make -C firmware/c

asm:
	make -C firmware/asm

sim:
	make -C rtl sim

configure:
	make -C rtl configure

build-litex:
	make -C litex build

configure-litex:
	make -C litex configure

build-litex-old:
	make -C litex build-old

configure-litex-old:
	make -C litex configure-old

mybios:
	make -C litex/my_bios

#rtl:
#	make -C rtl/
	
clean:
	make -C firmware/c clean
	make -C firmware/asm clean
	make -C litex/my_bios clean
	make -C litex clean
#	make -C firmware/firmware_words_src/ clean
	
cleanall: clean
	make -C rtl clean

PHONY: clean cleanall firmware_words c asm sim configure