.equ IO_BASE, 0x400000  
.equ IO_LEDS, 4
.equ IO_UART_DAT, 8
.equ IO_UART_CNTL, 16
.section .text
.globl start 
.globl blinker
.globl put_hello

start:
        li   t0, 10
        li   t1, 5
        add  t0,t1, t0
        li   gp,IO_BASE
	li   sp,0x400
blinker:	
	li   t0, 46
	sw   t0, IO_LEDS(gp)
	call wait
	li   t0, 45
	sw   t0, IO_LEDS(gp)
	call wait
	li   t0, 43
	sw   t0, IO_LEDS(gp)
	call wait
	li   t0, 39
	sw   t0, IO_LEDS(gp)
	call wait
	li   t0, 43
	sw   t0, IO_LEDS(gp)
	call wait
	li   t0, 45
	sw   t0, IO_LEDS(gp)
	call wait
	li   t0, 46
	sw   t0, IO_LEDS(gp)
	call wait
put_hello:
	la   a0, hello
	call putstring
	ret
putstring:
	addi sp,sp,-4 # save ra on the stack
	sw ra,0(sp)   # (need to do that for functions that call functions)
	mv t2,a0	
.L1:    lbu a0,0(t2)
	beqz a0,.L2
	call putchar
	addi t2,t2,1	
	j .L1
.L2:    lw ra,0(sp)  # restore ra
	addi sp,sp,4 # restore sp
	
	j    blinker
		
#	ebreak

.section .data
hello:
	.asciz "Hello, world !\n\r"
	
