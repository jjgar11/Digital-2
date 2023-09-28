.equ IO_LEDS, 4
.equ IO_UART_DAT_W, 8
.equ IO_UART_CNTL, 16
.equ IO_UART_DAT_R, 32

.section .text
.globl getchar

getchar:
	li		t1, 1
	sw		t1, IO_UART_DAT_R(gp)
	sw		zero, IO_UART_DAT_R(gp)
	li		t2, 1<<8
.confirm:
	lw		t1,	IO_UART_CNTL(gp)
	and		t1, t1, t2
	beq		t1, zero, .confirm
	lbu		a0, IO_UART_DAT_R(gp)
	ret

