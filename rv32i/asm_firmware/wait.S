.section .text
.globl wait

wait:
	li		t3, 1
	slli	t3, t3, 21
.L0:
	addi	t3, t3, -1
	bnez	t3, .L0
	ret

