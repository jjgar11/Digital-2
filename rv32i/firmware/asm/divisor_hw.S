.equ DIV_BASE,  0x430000
.equ DIV_DV,    0
.equ DIV_DR,    4
.equ DIV_INIT,  8
.equ DIV_DONE,  12
.equ DIV_RES,   16
.equ DIV_MOD,   20

.section .text
.globl div

div:
	li		gp, DIV_BASE
	sw		a1, DIV_DV(gp)
	sw		a2, DIV_DR(gp)
	li		t1, 1
	sw		t1, DIV_INIT(gp)
	sw		zero, DIV_INIT(gp)
.loop_div:
	lw		t1, DIV_DONE(gp)
	beq		t1, zero, .loop_div
	beq		a3, zero, .ret_mod
	lw		a3, DIV_RES(gp)
	ret
.ret_mod:
	lw		a3, DIV_MOD(gp)
	ret