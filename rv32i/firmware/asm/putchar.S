.equ IO_BASE, 0x400000  
.equ IO_LEDS, 4
.equ IO_UART_DAT, 8
.equ IO_UART_CNTL, 16

.section .text
.globl putchar

putchar:
	li		gp, IO_BASE
	sw		a0, IO_UART_DAT(gp)
	li		t1, 0x01
	sw		t1, IO_UART_CNTL(gp)
	li		t1, 0x00
	sw		t1, IO_UART_CNTL(gp)
	li		t3, 1<<9
.L0:  
	lw		t1, IO_UART_CNTL(gp)
	and		t1, t1, t3
	bnez	t1, .L0
  ret

