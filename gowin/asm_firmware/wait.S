.section .text
.globl wait

wait:
	addi sp,sp,-4      # save a3, a4, a5 on the stack
	sw   t3,0(sp) 
        li t3,1
#	slli t3, t3,17
	slli t3, t3,2   #for simulation
.L0:       
        addi t3,t3,-1
	bnez t3, .L0
	lw   t3,0(sp) 
	addi sp,sp,4      # save a3, a4, a5 on the stack
	ret
