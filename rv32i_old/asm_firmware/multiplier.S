.section .text
.globl mult
mult:	
	addi	t0, a1, 0	# A
	addi	t1, a2, 0	# B
	li		t2, 0		# Acumulador
.loop_multi:
	andi 	t3, t1, 1	# LSBB
	beq		t3, zero, .shift
	add		t2, t2, t0
.shift:
	slli	t0, t0, 1
	srli	t1, t1, 1
	bne		t1, zero, .loop_multi
	addi	a3, t2, 0
	ret