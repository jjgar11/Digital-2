module peripheral_uart#(
	parameter          clk_freq = 25000000,
	parameter          baud     = 115200
)(
    input clk,
    input rst,
    input [15:0]d_in,
    input cs,
    input [3:0]addr,
    input rd,
    input wr,
    output reg [15:0]d_out,
    output uart_tx,
    input  uart_rx,
    output reg ledout=0
);

//------------------------------------ regs and wires-------------------------------
reg [3:0] s; 	     //selector mux_4  and demux_4
reg [7:0] d_in_uart; // data in uart
reg [7:0] uart_ctrl; // data in uart
wire [7:0] rx_data;  // data received
wire tx_busy;        // uart transmitting
wire rx_error;       // reception error
wire rx_avail;       // data received
//------------------------------------ regs and wires-------------------------------

//----address_decoder (one selection bit for register) ------------------
always @(*) begin
case (addr)
4'h0:begin s = (cs && rd) ? 4'b0001 : 4'b0000 ;end //3'b0, tx_busy, 2'b0, rx_error, rx_avail
4'h2:begin s = (cs && rd) ? 4'b0010 : 4'b0000 ;end //data_rx
4'h4:begin s = (cs && wr) ? 4'b0100 : 4'b0000 ;end //data_tx
4'h6:begin s = (cs && wr) ? 4'b1000 : 4'b0000 ;end //5'b0, LED, tx_wr, rx_ack
default:begin s=3'b000 ; end
endcase
end

//Input Registers
always @(negedge clk) begin
d_in_uart = (s[2]) ? d_in[7:0] : d_in_uart; // data in uart
uart_ctrl = (s[3]) ? d_in[7:0] : uart_ctrl; // data controller 5'b0, LED, tx_wr, rx_ack
ledout    = uart_ctrl[2];	// write ledout register
end

//Output registers
always @(negedge clk) begin
case (s)
4'b0001: d_out[7:0]= {3'b0, tx_busy, 2'b0, rx_error, rx_avail};
4'b0010: d_out[7:0]= rx_data;
default: d_out=0;
endcase
end

uart #(
	.freq_hz(  clk_freq ),
	.baud(     baud     )
)uart0(
	.reset(    rst          ),
	.clk(      clk          ),
	.uart_rxd( uart_rx      ),
	.uart_txd( uart_tx      ),
	.rx_data(  rx_data      ),
	.rx_avail( rx_avail     ),
	.rx_error( rx_error     ),
	.rx_ack(   uart_ctrl[0] ),
	.tx_data(  d_in_uart    ),
	.tx_wr(    uart_ctrl[1] ),
	.tx_busy(  tx_busy)
);
endmodule
