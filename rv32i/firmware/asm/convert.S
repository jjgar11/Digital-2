.section .text
.globl convert

convert:
	addi	sp, sp, -4
	sw		ra, 0(sp)
	addi	s0, sp, -16
	sw		zero, 0(s0)
	sw		zero, 4(s0)
	sw		zero, 8(s0)
	sw		zero, 12(s0)
	
	addi	t0, a3, 0	# store binary res in t0
	li		t3, 0		# bcd num
	sw		t3, 0(s0)
	sw		t3, 4(s0)
.bincdb:
#	li		t0, 0x97	# Valor de prueba
	li		t6, 26		# Seleccionador de primer bit
.loop_convert:
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
	j		.loop_convert
.save:
	add		t0, t3, 0

	li		a1, 0
	bne		t0, zero, .bcdascii_2
	li		t1, 0x30
	sw		t1, 4(s0)
	j		.end
.bcdascii_2:
	call	bcdascii
.end:
	lw		ra, 0(sp)
	addi	sp, sp, 4
	ret


bcdascii:
	li		t1, 0	# store res in ascii
	li		t2, 0xF0000000
	li		t3, 0
	li		t5, 28
	li		t6, 24
	bne		a1, zero, .loop_verify
.shiftascii:
	and		t4, t0, t2	# select 4 LSSB
	bne		t4, zero, .loop_verify
	srli	t2, t2, 4
	addi	t5, t5, -4
	beq		t6, zero, .changew
	addi	t6, t6, -8
	j		.shiftascii
.loop_verify:
# selecciona los 4 bits mas a la izquierda, les suma 0x30 y luego los guarda en los 8 mas a la derecha
	li		a1, 1
	beq		t2, zero, .restore
	and		t4, t0, t2	# select 4 LSSB
	srl		t4, t4, t5	# los desplaza al primer lugar
	addi	t4, t4, 0x30
.cont:
	sll		t4, t4, t6	# los desplaza al lugar correspondiente, los mas significativos quedan mas a la derecha
	srli	t2, t2, 4	# desplaza el seleccionador para la derecha
	addi	t5, t5, -4	# disminuye el numero de desplazamientos a la derecha de los bits seleccionados
	add		t1, t1, t4	
	beq		t6, zero, .changew
	addi	t6, t6, -8	# aumenta el numero de desplazamientos a la izquierda de los bits organizados
	j		.loop_verify
.changew:
	bne		zero, t3, .restore
	sw		t1, 0(s0)
	addi	s0, s0, 4
	li		t1, 0
	li		t6, 24
	li		t3, 1
	beq		a1, zero, .shiftascii
	j		.loop_verify
.restore:
	sw		t1, 0(s0)
	addi	s0, s0, 4
	ret