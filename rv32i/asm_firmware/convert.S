.section .text
.globl convert

convert:
#	addi	sp, sp, -4 # save ra on the stack
#	addi	ra, ra, 0
#	sw		ra, 0(sp)   # (need to do that for functions that call functions)
	addi	t0, a0, 0	# store binary res in t0
.bincdb:
#	li		t0, 0x97	# Valor de prueba
	li		t3, 0		# bcd num
	li		t6, 15		# Seleccionador de primer bit
.loop1:
	li		t1, 1
	sll		t1, t1, t6
	and		t2, t1, t0	# select bit t6
	srl		t2, t2, t6	# desplaza bit a primer lugar
	add		t3, t3, t2	# suma bit a res
	beq		t6, zero, .save
# aqui ya se puede usar t1 y t2
.init_check:
	li		t1, 0xF
	li		t2, 4		# comparador
	li		t5, 3
.check:
	beq		t1, zero, .else1
	and		t4, t3, t1	# sel 4 bits para comparar
	bge		t2, t4, .else1	# si 4 bits > 5 suma 3
	add		t3, t3, t5
.else1: 
	slli	t1, t1, 4
	slli	t2, t2, 4
	slli	t5, t5, 4
	bne		t1, zero, .check
	slli	t3, t3, 1	# desplaza res
	addi	t6, t6, -1
	j		.loop1
.save:
	add		t0, t3, 0
.bcdascii:
	li		t1, 0	# store res in ascii
	li		t2, 9	# compare value (number or letter)
	li		t5, 0
.loop:
	beq		t0, zero, .restore
	li		t4, 0
	andi	t4, t0, 0xF	# select 4 LSSB
	bge		t4, t2, .letra
	addi	t2, t2, 1
	bge		t2, t4, .num
.letra:
	addi	t4, t4, 0x37
	j		.cont
.num:
	addi	t4, t4, 0x30
	addi	t2, t2, -1
.cont:
	srli	t0, t0, 4
	sll		t4, t4, t5
	addi	t5, t5, 8
	add		t1, t1, t4
	j		.loop
.restore:
	addi	a0, t1, 0
#	lw		ra, 0(sp)  # restore ra
#	addi	ra, ra, 0
#	addi sp,sp,4 # restore sp
	ret
