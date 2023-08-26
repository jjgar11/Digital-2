.equ IO_BASE, 0x400000  
.equ IO_LEDS, 4
.equ IO_UART_DAT, 8
.equ IO_UART_CNTL, 16
.section .text
.section .text
.globl mult
mult:	
	li		t0, 25		# A
	li		t1, 11		# B
	li		t2, 0		# Acumulador
loop:
	andi 	t3, t1, 1	# LSBB
	beq		t3, zero, shift
	add		t2, t2, t0
shift:
	slli	t0, t0, 1
	srli	t1, t1, 1
	bne		t1, zero, loop
	addi	a0, t2, 0
	call	convert
	call	putstring
	j		.end
putstring:
	addi	sp, sp, -4 # save ra on the stack
	sw		ra, 0(sp)   # (need to do that for functions that call functions)
	mv		t2,a0	
.L1:    
	lbu		a0, 0(t2)
	beqz	a0, .L2
	call	putchar
	addi	t2, t2, 1
	j		.L1
.L2:    
	lw		ra, 0(sp)  # restore ra
	addi	sp, sp, 4 # restore sp
	ret	
#	ebreak
.end:
	ebreak
