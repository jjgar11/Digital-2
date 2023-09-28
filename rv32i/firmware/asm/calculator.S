.equ IO_BASE, 0x400000  
.equ IO_LEDS, 4
.equ IO_UART_DAT, 8
.equ IO_UART_CNTL, 16
.section .text
.globl start 
.globl blinker
.globl put_hello

calculator:
        li   gp,IO_BASE
	li   sp,0x400
loop:

	li   t1, 5
.Lled:	
	li   t0, 0x4
	sw   t0, IO_UART_CNTL(gp)
	li   a0, 2     # 2 for simulation
	call wait
	li   t0, 0x0
	sw   t0, IO_UART_CNTL(gp)
	li   a0, 2     # 2 for simulation
	call wait
	addi t1, t1, -1
	bgez  t1, .Lled
	
	la   a0, command
	call putstring
	
	call getchar    # 
	call putchar    # echo
	addi a0, a0, -0x30
	mv   a1, a0     # first operand

	call getchar    # 
	call putchar    # echo
	addi t0, a0, -0x30


	la   a0, result
	call putstring

	mv   a0,t0
	call mult
	call bin_to_bcd
		
	j    loop
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
	ret	
#	ebreak

.section .data
command:
	.asciz "Enter two operands \n\r"
operator:
	.asciz "\n\rEnter operator \n\r"
result:
	.asciz "\n\rResult = "

