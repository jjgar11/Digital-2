.equ IO_MULT, 0x420000

.section .text
.globl mult

mult:
	li		s9, IO_MULT
	sw		a1, 0(s9)
	sw		a2, 4(s9)
	li		t1, 1
	sw		t1, 8(s9)
	sw		zero, 8(s9)
.loop_multi:
	lw		t1, 12(s9)
	beq		t1, zero, .loop_multi
#	lw		a3, 16(s9)
	lw		a3, 20(s9)
	ret