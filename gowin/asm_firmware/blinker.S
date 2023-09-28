# Simple blinker

.equ IO_BASE, 0x400000  
.equ IO_LEDS, 5
.section .text
.globl blinker

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
	ret


