.section .text
.globl div
div:	
	addi	t0, a0, 0	# Dividendo (DV)
	addi	t1, a1, 0	# Divisor (DR)
	li		t2, 32		# Contador N
	li		t3, 0		# Auxiliar
	li		t4, 0		# Resultado
.loop_div:
# Corrimiento de A concatenado con DV 
	li		t5, 1
	slli	t5, t5, 31
	and 	t6, t5, t0	# MSBB
	slli	t3, t3, 1
	add		t3, t3, t6
	slli	t0, t0, 1
	addi	t2, t2, -1
# Verificacion
	slli 	t4, t4, 1
	bge		t3, t1, .no
	j		.si
.no:
	addi	t4, t4, 1
	li		a0, 0xFFFFFFFF
	xor		a0, t1, a0
	addi	a0, a0, 1
	add		t3, t3, a0
	li		a0, 0xFFFFFFFF
	xor		t3, t3, a0
	addi	a0, a0, 1
.si:
	bne		t2, zero, .loop_div
	addi	a0, t4, 0
	ret

comp2:
	addi sp,sp,-4 # save ra on the stack
	sw ra,0(sp)   # (need to do that for functions that call functions)
#	xor		a0, 


	lw		ra, 0(sp)  # restore ra
	addi	sp, sp, 4 # restore sp
	ret
