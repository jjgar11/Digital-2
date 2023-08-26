#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <irq.h>
#include <uart.h>
#include <console.h>
#include <generated/csr.h>
void busy_wait(unsigned int ms)
{
	timer0_en_write(0);
	timer0_reload_write(0);
	timer0_load_write(CONFIG_CLOCK_FREQUENCY/1000*ms);
	timer0_en_write(1);
	timer0_update_value_write(1);
	while(timer0_value_read()) timer0_update_value_write(1);
}
int main(void)
{
	irq_setmask(0);
	irq_setie(1);
	uart_init();
	puts("\nCPU testing cain_test SoC\n");
	printf("Hola Mundo \n");
	while(1) {
		leds_out_write(0);
		busy_wait(250);
		leds_out_write(1);
		busy_wait(250);
	}
	return 0;
}


