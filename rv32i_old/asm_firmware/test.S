.equ IO_BASE, 0x400000  
.equ IO_LEDS, 4
.equ IO_UART_DAT_W, 8
.equ IO_UART_CNTL, 16
.equ IO_UART_DAT_R, 32
.section .text
.globl test
test:
	li		gp,IO_BASE
	li		sp,0x400
	call	getchar
	call	putchar
	j		test