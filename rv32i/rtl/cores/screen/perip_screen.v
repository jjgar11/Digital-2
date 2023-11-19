module peripheral_screen#(
	parameter          clk_freq = 25000000
)(
	input clk,
	input rst,
	input cs,
	input rd,
	input wr,
	input [31:0]		d_in,
	input [4:2]			addr,
	output wire			clk_screen,
	output wire			R0,
	output wire			G0,
	output wire			B0,
	output wire			R1,
	output wire			G1,
	output wire			B1,
	output wire			blank,
	output wire			latch,
	output wire [4:0]	row
);

//------------------------------------ regs and wires-------------------------------
reg [1:0]	s;
reg [31:0]	d_in_matrix = 0;	// data in matrix
reg 		wr_matrix = 0;	// data in matrix
reg 		init = 0;	// mult init

//----address_decoder (one selection bit for register) ------------------
always @(*) begin
	case (addr)
		3'b000:begin s = (cs & wr) ? 2'b01 : 0 ;end // init
		3'b001:begin s = (cs & wr) ? 2'b10 : 0 ;end // input
		default:begin s=0 ; end
	endcase
end

//Input Registers
always @(posedge clk) begin
init			= (s[0]) ? d_in[0] : init; // reset address
d_in_matrix		= (s[1]) ? d_in : d_in_matrix; // data in
wr_matrix		= (s[1]) ? 1 : 0;
end

screen32x32 #(
	.freq_hz(  clk_freq )
)screen0(
	.reset(      rst          ),
	.clk(        clk          ),
	.mat_in(     d_in_matrix  ),
	.wr_data(    wr_matrix    ),
	.init(       init         ),
	.clk_screen( clk_screen   ),
	.R0(         R0           ),
	.G0(         G0           ),
	.B0(         B0           ),
	.R1(         R1           ),
	.G1(         G1           ),
	.B1(         B1           ),
	.blank(      blank        ),
	.latch(      latch        ),
	.row(        row          )
);
endmodule