.section .text
.globl div
div:	
	addi	t0, a1, 0	# Dividendo (DV)
	addi	t1, a2, 0	# Divisor (DR)
	li		t2, 32		# Contador N
	li		t3, 0		# Auxiliar
	li		t4, 0		# Resultado
	li		t5, 0x80000000
.loop_div:
# Corrimiento de A concatenado con DV 
	and 	t6, t5, t0	# MSBB
	srli	t6, t6, 31
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
	xori	a0, t1, -1
	addi	a0, a0, 1
	add		t3, t3, a0
.si:
	bne		t2, zero, .loop_div
	addi	a3, t4, 0
	ret