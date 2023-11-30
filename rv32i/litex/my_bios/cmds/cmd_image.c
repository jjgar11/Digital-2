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

#define IMAGE_BASE 0x00006000
#define BIT_DEPTH 12
#define PIXEL_NUM 4096

/**
 * Command "getimage"
 *
 * Get image from TFTP to display
 *
 */
#ifdef CSR_ETHMAC_BASE

/*-----------------------------------------------------------------------*/
/* Copy Image                                                         */
/*-----------------------------------------------------------------------*/

static void getimage(int nb_params, char **params)
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
		size = copy_file_from_tftp_to_ram(ip, TFTP_SERVER_PORT, filename, (void *)MAIN_RAM_BASE+IMAGE_BASE);
		if (size <= 0) {
			printf("File is empty or does not exist.\n");
			return;
		}
		printf("Imagen copiada.\n");

		// uint32_t contador = 0;
		// while (contador < PIXEL_NUM) {
		// 	printf("%x:", ((volatile unsigned char *) MAIN_RAM_BASE+IMAGE_BASE)[contador]);
		// 	contador++;
		// }
		// printf("\n\rAcabo \n");

		screen_verilog_init_write(1);
		screen_verilog_init_write(0);

		for (short i = 0; i <= PIXEL_NUM*BIT_DEPTH/8 - 1; i += 3) {
			short data1	= ((volatile unsigned char *) MAIN_RAM_BASE+IMAGE_BASE)[i];
			data1 = data1 & 0x00ff;
			short data2	= ((volatile unsigned char *) MAIN_RAM_BASE+IMAGE_BASE)[i+1];
			data2 = data2 & 0x00ff;
			short data3	= ((volatile unsigned char *) MAIN_RAM_BASE+IMAGE_BASE)[i+2];
			data3 = data3 & 0x00ff;
			data1 = data1 << 4;
			short temp_d2 = data2 & 0x00f0;
			temp_d2 = temp_d2 >> 4;
			data1 = data1 | temp_d2;
			screen_verilog_mat_in_write(data1);
			screen_verilog_wr_data_write(1);
			screen_verilog_wr_data_write(0);

			data2 = data2 << 8;
			data2 = data2 | data3;
			screen_verilog_mat_in_write(data2);
			screen_verilog_wr_data_write(1);
			screen_verilog_wr_data_write(0);
			// printf("%x \n\r", data1);
			// printf("%x \n\r", data2);
		}
	} else {
	/* Boot failed if we are here... */
	printf("Especify a file name.\n");
	}
}

define_command(getimage, getimage, "Get image to display (TFTP)", IMAGE_CMDS);

/*-----------------------------------------------------------------------*/
/* Copy Video                                                         */
/*-----------------------------------------------------------------------*/

static void getvideo(int nb_params, char **params)
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

		int size_video;
		size_video = copy_file_from_tftp_to_ram(ip, TFTP_SERVER_PORT, filename, (void *)MAIN_RAM_BASE+IMAGE_BASE);
		if (size_video <= 0) {
			printf("File is empty or does not exist.\n");
			return;
		}
		printf("Video copiado.\n");

		screen_verilog_init_write(1);
		screen_verilog_init_write(0);

		int num_images;
		int size_image = (PIXEL_NUM*BIT_DEPTH)/8;
		num_images = size_video/size_image;
		while (1) {
			for (short j = 0; j < num_images; j++) {
				for (short i = 0; i <= size_image - 1; i += 3) {
					short data1	= ((volatile unsigned char *) MAIN_RAM_BASE+IMAGE_BASE+size_image*j)[i];
					data1 = data1 & 0x00ff;
					short data2	= ((volatile unsigned char *) MAIN_RAM_BASE+IMAGE_BASE+size_image*j)[i+1];
					data2 = data2 & 0x00ff;
					short data3	= ((volatile unsigned char *) MAIN_RAM_BASE+IMAGE_BASE+size_image*j)[i+2];
					data3 = data3 & 0x00ff;
					data1 = data1 << 4;
					short temp_d2 = data2 & 0x00f0;
					temp_d2 = temp_d2 >> 4;
					data1 = data1 | temp_d2;
					screen_verilog_mat_in_write(data1);
					screen_verilog_wr_data_write(1);
					screen_verilog_wr_data_write(0);

					data2 = data2 << 8;
					data2 = data2 | data3;
					screen_verilog_mat_in_write(data2);
					screen_verilog_wr_data_write(1);
					screen_verilog_wr_data_write(0);
				}
				busy_wait(25);
			}
		}
	} else {
	/* Boot failed if we are here... */
	printf("Especify a file name.\n");
	}
}

define_command(getvideo, getvideo, "Get video to display (TFTP)", IMAGE_CMDS);

#endif