.equ IO_BASE, 0x400000  
.equ IO_LEDS, 4
.equ IO_UART_DAT, 8
.equ IO_UART_CNTL, 16
.section .text
.globl main
main:
	li   gp,IO_BASE
	li   sp,0x400
	li		a0, 293		# A
	li		a1, 144		# B
	call	mult
#	call	div
	call	convert
	call	putstring
	j		.end
putstring:
	addi	sp, sp, -4 # save ra on the stack
	sw		ra, 0(sp)   # (need to do that for functions that call functions)
	addi	s0, sp, -8
.L1:    
	lbu		a0, 0(s0)
	beq		a0, zero, .L2
	call	putchar
	addi	s0, s0, 1
	bne		s0, sp, .L1
.L2:    
	lw		ra, 0(sp)  # restore ra
	addi	sp, sp, 4 # restore sp
	ret
.end:
	ebreak