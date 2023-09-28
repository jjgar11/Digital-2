# Base address of memory-mapped IO,
# Loaded into gp at startup
.equ IO_BASE, 0x400000  

# IO-reg offsets. To read or write one of them,
# use IO_XXX(gp)
.equ IO_LEDS, 4
.equ IO_UART_DAT, 8
.equ IO_UART_CNTL, 16

.section .text

.global	getchar
.type	getchar, @function
getchar:

	addi sp,sp,-4      # save a3, a4, a5 on the stack
	sw   t0,0(sp) 
.L0:	
        lw   a0,IO_UART_CNTL(gp)
	andi t0,a0,256 # bit 8 = data ready
        beqz t0,.L0
	li   t0,0x02
	sw   t0,IO_UART_CNTL(gp)
	lw   a0,IO_UART_DAT(gp)        
	andi a0,a0, 255
#	li   t0,10                  # <enter> generates CR/LF, we ignore LF.
#	beq  a0,t0, getchar
	lw   t0,0(sp)
	addi sp,sp,4      # save a3, a4, a5 on the stack
        ret 


