module corescore_emitter_uart
	#(
	parameter clk_freq_hz = 25000000,
	parameter baud_rate = 115200)
	(
	input 	 	    clk,
	input wire 	    rst,

	input wire 	     uart_rx,
	output wire 	 uart_tx,

	input wire [7:0] tx_data,
	input wire 	     tx_valid,
	output reg 	     tx_ready,

	input wire		 rx_ack,
	output wire	     rx_valid,
	output wire [7:0] rx_data
);

	localparam START_VALUE = clk_freq_hz/baud_rate;
	localparam START_VALUE_DELAY = clk_freq_hz/baud_rate/2;

	localparam WIDTH = $clog2(START_VALUE);
	localparam WIDTH2 = $clog2(START_VALUE_DELAY);

	reg [WIDTH:0]  cnt = 0;

	reg [9:0] 	    data = 0;
	reg       	    rx_busy = 0;
	reg	[3:0]		bit_count = 0;

	assign uart_tx = data[0] | !(|data);
	assign rx_data = data[8:1];

	always @(posedge clk) begin
		if (cnt[WIDTH] & !(|data)) begin
			tx_ready <= 1'b1;
		end else if (tx_valid & tx_ready) begin
			tx_ready <= 1'b0;
		end

		if (tx_ready | cnt[WIDTH])
			cnt <= {1'b0,START_VALUE[WIDTH-1:0]};
		else
			cnt <= cnt-1;
		
		if (cnt[WIDTH])
			data <= {1'b0, data[9:1]};
		else if (tx_valid & tx_ready)
			data <= {1'b1, tx_data, 1'b0};
	end

	// always @(posedge clk) begin
	// 	if(rx_ack) begin
	// 		rx_busy <= 0;
	// 	end

	// 	if (uart_rx & !rx_busy) begin
	// 		cont <= 0;
	// 		cont[WIDTH2-1:0] <= START_VALUE_DELAY[WIDTH2-1:0];
	// 		bit_count <= 0;
	// 		rx_valid <= 0;
	// 	end else if (!rx_busy) begin
	// 		rx_busy <= 1;
	// 	end else begin
	// 		if (!(|bit_count)) begin
	// 			if (uart_rx) begin
	// 				rx_busy <= 0;
	// 			end
	// 		end

	// 		if (cont[WIDTH]) begin
	// 			bit_count <= bit_count+1;
	// 			data <= {uart_rx, data[9:1]};
	// 			cont <= {1'b0, START_VALUE[WIDTH-1:0]};
	// 			if (bit_count == 9) begin
	// 				rx_busy <= 0;
	// 				if (uart_rx) begin
	// 					rx_valid <= 1;
	// 				end
	// 			end
	// 		end else begin
	// 			cont <= cont-1;
	// 		end
	// 	end
	// end

endmodule

