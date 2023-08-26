
#include "soc-hw.h"

void hexprint(unsigned int hexval)
{
  unsigned char digit[8];
  int pos;
  uart_putstr("0x");
  for(pos = 0; pos < 8; pos++)
    {
      digit[pos] = (hexval & 0x0F);  /* last hexit */
      hexval = hexval >> 4;
    }
  for(pos = 7; pos > -1; pos--)
    {
      if( digit[pos] < 0x0A)
        uart_putchar(digit[pos] + '0' );
      else
        uart_putchar(digit[pos] + 'A' - 10);
    }
  uart_putchar('.');
}


int main(int argc, char **argv)
{
  unsigned char key;
  //gpio0->oe = 0x00000000;
  //gpio0->out = 0;
  irq_disable();
  while(1){ /* loop forever until u-boot gets booted or the board is reset */
    //gpio0->out = 255;
    uart_putstr("Hello World!!\r\n");
//    key = uart_getchar();
//    key = key + 1;
    //sleep(100);
    //gpio0->out = 0;
    //sleep(100);
    
  }
}

