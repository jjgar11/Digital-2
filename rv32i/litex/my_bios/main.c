// This file is Copyright (c) 2013-2014 Sebastien Bourdeauducq <sb@m-labs.hk>
// This file is Copyright (c) 2014-2019 Florent Kermarrec <florent@enjoy-digital.fr>
// This file is Copyright (c) 2015 Yann Sionneau <ys@m-labs.hk>
// This file is Copyright (c) 2015 whitequark <whitequark@whitequark.org>
// This file is Copyright (c) 2019 Ambroz Bizjak <ambrop7@gmail.com>
// This file is Copyright (c) 2019 Caleb Jamison <cbjamo@gmail.com>
// This file is Copyright (c) 2018 Dolu1990 <charles.papon.90@gmail.com>
// This file is Copyright (c) 2018 Felix Held <felix-github@felixheld.de>
// This file is Copyright (c) 2019 Gabriel L. Somlo <gsomlo@gmail.com>
// This file is Copyright (c) 2018 Jean-François Nguyen <jf@lambdaconcept.fr>
// This file is Copyright (c) 2018 Sergiusz Bazanski <q3k@q3k.org>
// This file is Copyright (c) 2016 Tim 'mithro' Ansell <mithro@mithis.com>
// This file is Copyright (c) 2020 Franck Jullien <franck.jullien@gmail.com>
// This file is Copyright (c) 2020 Antmicro <www.antmicro.com>

// License: BSD

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <system.h>
#include <irq.h>

#include "boot.h"
#include "readline.h"
#include "helpers.h"
#include "command.h"

#include <generated/csr.h>
#include <generated/soc.h>
#include <generated/mem.h>
#include <generated/git.h>

#include <libbase/console.h>
#include <libbase/crc.h>
#include <libbase/memtest.h>

#include <libbase/spiflash.h>
#include <libbase/uart.h>
#include <libbase/i2c.h>

#include <liblitedram/sdram.h>
#include <liblitedram/utils.h>

#include <libliteeth/udp.h>
#include <libliteeth/mdio.h>

#include <liblitespi/spiflash.h>

#include <liblitesdcard/sdcard.h>
#include <liblitesata/sata.h>



__attribute__((__used__)) int main(int i, char **c)
{
	char buffer[CMD_LINE_BUFFER_SIZE];
	char *params[MAX_PARAM];
	char *command;
	struct command_struct *cmd;
	int nb_params;
	int sdr_ok;

#ifdef CONFIG_CPU_HAS_INTERRUPT
	irq_setmask(0);
	irq_setie(1);
#endif
	uart_init();

#ifdef CONFIG_HAS_I2C
	i2c_send_init_cmds();
#endif

	printf("\n");
	printf("\e[1m:::::::'######:::::'###::::'####:'##::: ##:\e[0m\n");
	printf("\e[1m::::::'##... ##:::'## ##:::. ##:: ###:: ##:\e[0m\n");
	printf("\e[1m:::::: ##:::..:::'##:. ##::: ##:: ####: ##:\e[0m\n");
	printf("\e[1m:::::: ##:::..:::'##:. ##::: ##:: ####: ##:\e[0m\n");
	printf("\e[1m:::::: ##:::..:::'##:. ##::: ##:: ####: ##:\e[0m\n");
	printf("\e[1m:::::: ##:::::::'##:::. ##:: ##:: ## ## ##:\e[0m\n");
	printf("\e[1m:::::: ##::::::: #########:: ##:: ##. ####:\e[0m\n");
	printf("\e[1m:::::: ##::: ##: ##.... ##:: ##:: ##:. ###:\e[0m\n");
	printf("\e[1m::::::. ######:: ##:::: ##:'####: ##::. ##:\e[0m\n");
	printf("\e[1m:::::::......:::..:::::..::....::..::::..::\e[0m\n");
	printf("\n");
	printf("--============= \e[1mController\e[0m ================--\n");
	printf("\n");


	/* Execute  initialization functions */
	init_dispatcher();


	/* Console */
//	hist_init();
	printf("\n%s", PROMPT);
	while(1) {
		readline(buffer, CMD_LINE_BUFFER_SIZE);
		if (buffer[0] != 0) {
			printf("\n");
			nb_params = get_param(buffer, &command, params);
			cmd = command_dispatcher(command, nb_params, params);
			if (!cmd)
				printf("Command not found");
		}
		printf("\n%s", PROMPT);
	}
	return 0;
}
