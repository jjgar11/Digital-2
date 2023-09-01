.equ IO_BASE, 0x400000  
.equ IO_LEDS, 4
.equ IO_UART_DAT, 8
.equ IO_UART_CNTL, 16
.section .text
.globl main
main:
	li   gp,IO_BASE
	li   sp,0x400
	li		a0, 285		# A
	li		a1, 15		# B
	call	mult
	call	convert
	call	putresult
	call	div
	call	convert
	call	putresult
	la   a0, hello
	call putstring
blinker:	
	li   t0, 1
	sw   t0, IO_LEDS(gp)
	call wait
	li   t0, 0
	sw   t0, IO_LEDS(gp)
	call wait
	j    blinker
putstring:
	addi sp,sp,-4 # save ra on the stack
	sw ra,0(sp)   # (need to do that for functions that call functions)
	mv t2,a0	
.L1_putstring:
	lbu a0,0(t2)
	beqz a0,.L2_putstring
	call putchar
	addi t2,t2,1	
	j .L1_putstring
.L2_putstring:
	lw ra,0(sp)  # restore ra
	addi sp,sp,4 # restore sp
	ret	

putresult:
	addi	sp, sp, -4 # save ra on the stack
	sw		ra, 0(sp)   # (need to do that for functions that call functions)
	addi	s0, sp, -8
.L1_putresult:    
	lbu		a0, 0(s0)
	beq		a0, zero, .L2_putresult
	call	putchar
	addi	s0, s0, 1
	bne		s0, sp, .L1_putresult
.L2_putresult:    
	li		a0, 10
	call	putchar
	li		a0, 13
	call	putchar
	lw		ra, 0(sp)  # restore ra
	addi	sp, sp, 4 # restore sp
	ret


.section .data
hello:
	.asciz "Hello, ASM world !\n\r"
	
