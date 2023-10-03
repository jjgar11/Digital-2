.equ IO_CONV, 0x440000

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

	li		s9, IO_CONV
	sw		a3, 0(s9)
	li		t1, 1
	sw		t1, 4(s9)
	sw		zero, 4(s9)
.loop_convert:
	lw		t1, 8(s9)
	beq		t1, zero, .loop_convert
	
	li		a1, 0
	lw		t0, 16(s9)			# almacena los bcds
	call	bcdascii
	lw		t0, 12(s9)
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