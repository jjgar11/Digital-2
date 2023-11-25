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
	screen_verilog_init_write(1);
	screen_verilog_init_write(0);
	uint32_t contador = 0;
	uint32_t num_pixels = 4096;

	while(contador < num_pixels) {
		screen_verilog_mat_in_write(contador);
		screen_verilog_wr_data_write(1);
		screen_verilog_wr_data_write(0);
		contador++;
	}
	irq_setmask(0);
	irq_setie(1);
	uart_init();
	puts("\nCPU testing alpha_board SoC\n");
	printf("Running Hola Mundo from SDRAM \n");
	while(1) {
//		leds_out_write(0);
		busy_wait(250);
//		leds_out_write(1);
		busy_wait(250);
	}
	return 0;
}


