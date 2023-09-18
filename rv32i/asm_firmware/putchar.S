.equ IO_LEDS, 4
.equ IO_UART_DAT_W, 8
.equ IO_UART_CNTL, 16
.equ IO_UART_DAT_R, 32

.section .text
.globl putchar

putchar:
   sw a0, IO_UART_DAT_W(gp)
   li t3, 1<<9
.L0:  
   lw t1, IO_UART_CNTL(gp)
   and t1, t1, t3
   bnez t1, .L0
  ret

