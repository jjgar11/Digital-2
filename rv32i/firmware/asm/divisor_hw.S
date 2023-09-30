.equ IO_DIV, 0x430000

.section .text
.globl div

div:
	li		s9, IO_DIV
	sw		a1, 0(s9)
	sw		a2, 4(s9)
	li		t1, 1
	sw		t1, 8(s9)
	sw		zero, 8(s9)
.loop_div:
	lw		t1, 12(s9)
	beq		t1, zero, .loop_div
	lw		a3, 16(s9)
	ret