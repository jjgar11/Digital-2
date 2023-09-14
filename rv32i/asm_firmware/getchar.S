# Base address of memory-mapped IO,
# Loaded into gp at startup
.equ IO_BASE, 0x400000  

# IO-reg offsets. To read or write one of them,
# use IO_XXX(gp)
.equ IO_LEDS, 4
.equ IO_UART_DAT_W, 8
.equ IO_UART_CNTL, 16
.equ IO_UART_DAT_R, 32

.section .text
.globl getchar

getchar:
	li		t0, 1
	li		t2, 1<<8
	sw		t0, IO_UART_DAT_R(gp)
.confirm:
	lw		t1,	IO_UART_CNTL(gp)
	and		t1, t1, t2
	beq		t1, zero, .confirm
	sw		a0, IO_UART_DAT_R(gp)
	ret

