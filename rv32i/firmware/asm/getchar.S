.equ IO_LEDS, 4
.equ IO_UART_DAT, 8
.equ IO_UART_CNTL, 16

.section .text
.globl getchar

getchar:
.verify:
	lw		t1, IO_UART_CNTL(gp)
	andi	t1, t1, 1<<8 # bit 8 = data ready
	beq		t1, zero, .verify
	li		t1, 1<<1
	sw		t1, IO_UART_CNTL(gp)
	lbu		a0, IO_UART_DAT(gp)
	andi	a0, a0, 0xFF
	ret

