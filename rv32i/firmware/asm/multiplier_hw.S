.equ MULT_BASE,  0x420000
.equ MULT_A,     0
.equ MULT_B,     4
.equ MULT_INIT,  8
.equ MULT_DONE,  12
.equ MULT_RESDN, 16
.equ MULT_RESUP, 20

.section .text
.globl mult

mult:
	li		gp, MULT_BASE
	sw		a1, MULT_A(gp)
	sw		a2, MULT_B(gp)
	li		t1, 1
	sw		t1, MULT_INIT(gp)
	sw		zero, MULT_INIT(gp)
.loop_multi:
	lw		t1, MULT_DONE(gp)
	beq		t1, zero, .loop_multi
	lw		a3, MULT_RESDN(gp)
#	lw		a3, 20(gp)
	ret