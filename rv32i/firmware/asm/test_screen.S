.equ SCREEN_BASE,	0x450000  
.equ SCREEN_INIT,	0
.equ SCREEN_DATA,	4
.section .text
.globl main
main:
	li		gp, SCREEN_BASE
	li		sp, 0x2000
#	la		a3, input1
#	call	putstring
#	call	getstring

	li		t0, 1
	li		t4, 0
	li		t3, 4096
	li		t2, 0
	sw		t0, SCREEN_INIT(gp)
	sw		zero, SCREEN_INIT(gp)
.loop:
	sw		t2, SCREEN_DATA(gp)
	addi	t2, t2, 1
	addi	t4, t4, 1
	bge		t4, t3, .end
	j		.loop
.end:
	

# putstring:
#	addi	sp, sp, -4 # save ra on the stack
#	sw		ra, 0(sp)   # (need to do that for functions that call functions)
#	mv		t2, a3
#.L1_putstring:
#	lbu		a0, 0(t2)
#	beqz	a0, .L2_putstring
#	call	putchar
#	addi	t2, t2, 1
#	j		.L1_putstring
#.L2_putstring:
#	lw		ra, 0(sp)  # restore ra
#	addi	sp, sp, 4 # restore sp
#	ret	
#
# getstring:
#	addi	sp, sp, -4 # save ra on the stack
#	sw		ra, 0(sp)
#	addi	s0, s0, -4
#	li		t0, 0		# result
#.L1_getstring:
#	call	getchar
#	call	putchar
#	li		t1, 13
#	beq		a0, t1, .end_get	# if char is enter (10) stops reading
#	addi	a1, t0, 0	
#	li		a2, 10
#	call	mult		# multiply res in t0 by 10
#	addi	t0, a3, 0	# save mult in t0
#	addi	a0, a0, -0x30	# rest 0x30 to get number and add it to res
#	add		t0, t0, a0
#	j		.L1_getstring
#.end_get:
#	li		a0, 10
#	call	putchar
#	sw		t0, 0(s0)	# save bin res to a0
#	lw		ra, 0(sp)	# restore ra
#	addi	sp, sp, 4	# restore sp
#	ret

.section .data
input:
	.asciz "Ingrese el color\n\r"