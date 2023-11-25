// SPDX-License-Identifier: BSD-Source-Code

#include <stdio.h>
#include <stdlib.h>

#include <generated/csr.h>

#include "../command.h"
#include "../helpers.h"
#include "../boot.h"

#include <generated/mem.h>
#include <libliteeth/udp.h>
#include <libliteeth/tftp.h>

/**
 * Command "getfile"
 *
 * Get image from TFTP to display
 *
 */
#ifdef CSR_ETHMAC_BASE

/*-----------------------------------------------------------------------*/
/* Copy Image                                                         */
/*-----------------------------------------------------------------------*/

static void getfile(int nb_params, char **params)
{

	#ifndef TFTP_SERVER_PORT
	#define TFTP_SERVER_PORT 69
	#endif

	static unsigned char macadr[6] = {0x10, 0xe2, 0xd5, 0x00, 0x00, 0x00};

	static unsigned int local_ip[4] = {192, 168, 1, 50};
	static unsigned int remote_ip[4] = {192, 168, 1, 100};
	unsigned int ip;
	char * filename = NULL;

	if (nb_params > 0 )
		filename = params[0];

	ip = IPTOINT(remote_ip[0], remote_ip[1], remote_ip[2], remote_ip[3]);
	udp_start(macadr, IPTOINT(local_ip[0], local_ip[1], local_ip[2], local_ip[3]));

	if (filename) {
		printf("Local IP: %d.%d.%d.%d\n", local_ip[0], local_ip[1], local_ip[2], local_ip[3]);
		printf("Remote IP: %d.%d.%d.%d\n", remote_ip[0], remote_ip[1], remote_ip[2], remote_ip[3]);

		int size;
		size = copy_file_from_tftp_to_ram(ip, TFTP_SERVER_PORT, filename, (void *)MAIN_RAM_BASE+MAIN_RAM_SIZE);
		if (size <= 0) {
			printf("File is empty or does not exist.\n");
			return;
		}
		printf("Si se copia XD.\n");
		// boot(0, 0, 0, MAIN_RAM_BASE);
	} else {
	/* Boot failed if we are here... */
	printf("Especify a file name.\n");
	}
}

define_command(getfile, getfile, "Get image to display (TFTP)", IMAGE_CMDS);

#endif