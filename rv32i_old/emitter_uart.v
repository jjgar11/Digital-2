module corescore_emitter_uart
	#(
	parameter clk_freq_hz = 25000000,
	parameter baud_rate = 115200)
	(
	input				clk,
	input				rst,

	input wire			uart_rx,
	output wire			uart_tx,

	input wire			tx_valid,
	input wire	[7:0]	tx_data,
	output reg			tx_ready,

	input wire			rx_ack,
	output reg			rx_valid,
	output wire [7:0]	rx_data
);

	localparam START_VALUE = clk_freq_hz/baud_rate;
	localparam START_VALUE_DELAY = clk_freq_hz/baud_rate/2;
	// localparam START_VALUE = 85;
	// localparam START_VALUE_DELAY = 42;

	localparam WIDTH = $clog2(START_VALUE);
	localparam WIDTH2 = $clog2(START_VALUE_DELAY);

	reg [WIDTH:0]  cnt_tx;
	reg [WIDTH:0]  cnt_rx;

	reg [9:0] 	    tx_reg;
	reg [9:0] 	    rx_reg;
	reg       	    rx_busy;
	reg	[3:0]		bit_count;

	assign uart_tx = tx_reg[0] | !(|tx_reg);
	assign rx_data = rx_reg[8:1];

	always @(posedge clk) begin
		if (rst) begin
			cnt_tx		<= 0;
			tx_reg		<= 0;
		end else begin
			if (cnt_tx[WIDTH] & !(|tx_reg)) begin
				tx_ready <= 1'b1;
			end else if (tx_valid & tx_ready) begin
				tx_ready <= 1'b0;
			end

			if (tx_ready | cnt_tx[WIDTH])
				cnt_tx <= {1'b0,START_VALUE[WIDTH-1:0]};
			else
				cnt_tx <= cnt_tx-1;
			
			if (cnt_tx[WIDTH])
				tx_reg <= {1'b0, tx_reg[9:1]};
			else if (tx_valid & tx_ready)
				tx_reg <= {1'b1, tx_data, 1'b0};
		end
	end

	always @(posedge clk) begin
		if (rst) begin
			rx_valid	<= 0;
			rx_busy		<= 0;
			cnt_rx		<= 0;
			bit_count	<= 0;
			rx_reg		<= 0;
		end else begin
			if(rx_ack) begin
				rx_valid <= 0;
			end

			if (uart_rx & !rx_busy) begin
				cnt_rx[WIDTH2-1:0] <= START_VALUE_DELAY[WIDTH2-1:0];
				bit_count <= 0;
				rx_busy <= 0;
			end else if (!rx_busy) begin
				rx_busy <= 1;
			end else begin
				if (cnt_rx[WIDTH] && !(|bit_count)) begin
					if (uart_rx) begin
						rx_busy <= 0;
					end
				end

				if (cnt_rx[WIDTH]) begin
					bit_count <= bit_count+1;
					rx_reg <= {uart_rx, rx_reg[9:1]};
					cnt_rx <= {1'b0, START_VALUE[WIDTH-1:0]};
					if (bit_count == 9) begin
						rx_busy <= 0;
						if (uart_rx) begin
							cnt_rx <= 0;
							rx_valid <= 1;
						end
					end
				end else begin
					cnt_rx <= cnt_rx-1;
				end
			end
		end
	end

endmodule

