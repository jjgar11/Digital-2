.equ IO_BASE, 0x400000  
.equ IO_LEDS, 4
.equ IO_UART_DAT, 8
.equ IO_UART_CNTL, 16
.section .text
.globl main
main:
	li		a0, 25		# A
	li		a1, 11		# B
	call	mult
#	call	div
#	addi	ra, ra, 0
	call	convert
	call	putstring
	j		.end
putstring:
	addi	sp, sp, -4 # save ra on the stack
	sw		ra, 0(sp)   # (need to do that for functions that call functions)
	mv		t2, a0	
.L1:    
	lbu		a0, 0(t2)
	addi	a0, a0, 0
	beq		a0, zero, .L2
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
