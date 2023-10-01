.equ IO_CONV, 0x440000

.section .text
.globl convert

convert:
	addi	sp, sp, -12
	addi	s0, sp, 0

	li		s9, IO_CONV
	sw		a3, 0(s9)
	li		t1, 1
	sw		t1, 4(s9)
	sw		zero, 4(s9)
.loop_convert:
	lw		t1, 8(s9)
	beq		t1, zero, .loop_convert
	lw		t0, 12(s9)


.bcdascii:
	beq		t0, zero, .restore
	li		t1, 0	# store res in ascii
	li		t2, 0xF0000000
	li		t3, 32
	li		t5, 28
	li		t6, 0
.shiftascii:
	and		t4, t0, t2	# select 4 MSSB
	bne		t4, zero, .loop_verify
	srli	t2, t2, 4
	addi	t5, t5, -4
	j		.shiftascii
.loop_verify:
	beq		t2, zero, .restore
	and		t4, t0, t2	# select 4 MSSB
	srl		t4, t4, t5
	addi	t4, t4, 0x30
.cont:
	sll		t4, t4, t6
	srli	t2, t2, 4
	addi	t5, t5, -4
	add		t1, t1, t4
	addi	t6, t6, 8
	beq		t6, t3, .changew
	j		.loop_verify
.changew:
	sw		t1, 0(s0)
	addi	s0, s0, 4
	li		t1, 0
	li		t6, 0
	bne		t2, zero, .loop_verify
.restore:
	sw		t1, 0(s0)
	addi	sp, sp, 12
	ret