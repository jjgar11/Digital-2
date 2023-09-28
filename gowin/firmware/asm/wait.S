.section .text
.globl wait

wait:
	addi sp,sp,-4      # save a3, a4, a5 on the stack
	sw   a0,0(sp) 
        li a0,1
.L0:       
        addi a0,a0,-1
	bnez a0, .L0
	lw   a0,0(sp) 
	addi sp,sp,4      # save a3, a4, a5 on the stack
	ret
