.equ IO_BASE, 0x400000  
.equ IO_LEDS, 4
.equ IO_UART_DAT, 8
.equ IO_UART_CNTL, 16
.section .text
.globl main
main:
	li		gp,IO_BASE
	li		sp,0x1000
#	li		a1, 304835	# A
#	li		a2, 323	# B
	addi	s0, sp, -12
	addi	s1, s0, 0

	la		a3, input1
	call	putstring
	call	getstring

	la		a3, input2
	call	putstring
	call	getstring

.select_option:
	la		a3, op
	call	putstring
	call	getstring
	lw		a1, -4(s1)
	lw		a2, -8(s1)
	lw		t0, -12(s1)
	li		t1, 1
	beq		t0, t1, .select_sum
	addi	t1, t1, 1
	beq		t0, t1, .select_res
	addi	t1, t1, 1
	beq		t0, t1, .select_mul
	addi	t1, t1, 1
	beq		t0, t1, .select_div
	addi	s0, s0, 4
	la		a3, error
	call	putstring
	j		.select_option

.select_sum:
	la		a3, sum_result
	call	putstring
	add		a3, a1, a2
	j		.print_result
.select_res:
	la		a3, res_result
	call	putstring
	xor		a2, a2, -1
	addi	a2, a2, 1
	add		a3, a1, a2
	j		.print_result
.select_mul:
	la		a3, multi_result
	call	putstring
	call	mult
	j		.print_result
.select_div:
	la		a3, div_result
	call	putstring
	call	div
	j		.print_result
.print_result:
	call	convert
	call	putresult
	li		a0, 10
	call	putchar
	j		main

#	la		a3, hello
#	call	putstring
# blinker:
#	li		t0, 1
#	sw		t0, IO_LEDS(gp)
#	call	wait
#	li		t0, 0
#	sw		t0, IO_LEDS(gp)
#	call	wait
#	j		blinker

getstring:
	addi	sp, sp, -4 # save ra on the stack
	sw		ra, 0(sp)
	addi	s0, s0, -4
	li		t0, 0		# result
.L1_getstring:
	call	getchar
	call	putchar
	li		t1, 13
	beq		a0, t1, .end_get	# if char is enter (10) stops reading
	addi	a1, t0, 0	
	li		a2, 10
	call	mult		# multiply res in t0 by 10
	addi	t0, a3, 0	# save mult in t0
	addi	a0, a0, -0x30	# rest 0x30 to get number and add it to res
	add		t0, t0, a0
	j		.L1_getstring
.end_get:
	li		a0, 10
	call	putchar
	sw		t0, 0(s0)	# save bin res to a0
	lw		ra, 0(sp)	# restore ra
	addi	sp, sp, 4	# restore sp
	ret

putstring:
	addi	sp, sp, -4 # save ra on the stack
	sw		ra, 0(sp)   # (need to do that for functions that call functions)
	mv		t2, a3
.L1_putstring:
	lbu		a0, 0(t2)
	beqz	a0, .L2_putstring
	call	putchar
	addi	t2, t2, 1
	j		.L1_putstring
.L2_putstring:
	lw		ra, 0(sp)  # restore ra
	addi	sp, sp, 4 # restore sp
	ret	

putresult:
	addi	sp, sp, -4 # save ra on the stack
	sw		ra, 0(sp)   # (need to do that for functions that call functions)
	addi	s0, sp, -16
	addi	s1, s0, 4
.L1_putresult:
	lbu		a0, -1(s1)
	beq		a0, zero, .ignore
	call	putchar
.ignore:
	addi	s1, s1, -1
	bne		s0, s1, .L1_putresult
	addi	s0, s0, 4
	addi	s1, s1, 8
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
sum_result:
	.asciz "El resultado de la suma es: "
res_result:
	.asciz "El resultado de la resta es: "
multi_result:
	.asciz "El resultado de la multiplicacion es: "
div_result:
	.asciz "El resultado de la division es: "
input1:
	.asciz "Ingrese el primer operando: "
input2:
	.asciz "Ingrese el segundo operando: "
error:
	.asciz "Ingrese una opcion valida.\n\r"
op:
	.asciz "\nSeleccione la operacion:\n\r1.Suma\n\r2.Resta\n\r3.Multiplicacion\n\r4.Division\n\n\r"