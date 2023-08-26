.section .text
.globl convert

convert:
	addi	t0, a0, 0 # store binary res in t2
.bincdb:
	li		t1, 0
	andi	t2, t1, 0x80000000

	li		t1, 0
	li		t2, 9
	li		t3, 10
	li		t5, 0
.loop:
	beq		t0, zero, .restore
	li		t4, 0
	andi	t4, t0, 0xF	# select 4 LSSB
	bge		t4, t2, .letra
	bge		t3, t4, .num
.letra:
	addi	t4, t4, 0x37
	j		.cont
.num:
	addi	t4, t4, 0x30
.cont:
	srli	t0, t0, 4
	sll		t4, t4, t5
	addi	t5, t5, 8
	add		t1, t1, t4
	j		.loop
.restore:
	addi	a0, t1, 0
	ret
