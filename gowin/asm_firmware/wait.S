.section .text
.globl wait

wait:
	addi sp,sp,-4 # save t3 on the stack
	sw t3,0(sp)   # (need to do that for functions that call functions)
        li t3,1
	slli t3, t3,17
.L0:       
        addi t3,t3,-1
	bnez t3, .L0
	lw t3,0(sp)  # restore t3
	addi sp,sp,4 # restore sp
	ret
