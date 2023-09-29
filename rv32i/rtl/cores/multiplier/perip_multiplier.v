module peripheral_multiplier#(
	parameter          clk_freq = 25000000
)(
	input clk,
	input rst,
	input [31:0]d_in,
	input cs,
	input [4:2]addr,
	input rd,
	input wr,
    output reg [31:0]d_out
);

//------------------------------------ regs and wires-------------------------------
reg [5:0]	s;
reg [31:0]	d_in_mult_A = 0;	// data in mult A
reg [31:0]	d_in_mult_B = 0;	// data in mult B
reg 		init = 0;	// mult init
wire 		ready;	// data out mult B
wire [31:0]	res_up;	// data out mult B
wire [31:0]	res_dn;	// data out mult B

//----address_decoder (one selection bit for register) ------------------
always @(*) begin
	case (addr)
		3'b000:begin s = (cs & wr) ? 6'b000001 : 6'b000000 ;end // input A
		3'b001:begin s = (cs & wr) ? 6'b000010 : 6'b000000 ;end // input B
		3'b010:begin s = (cs & wr) ? 6'b000100 : 6'b000000 ;end // init
		3'b011:begin s = (cs & rd) ? 6'b001000 : 6'b000000 ;end // output ready
		3'b100:begin s = (cs & rd) ? 6'b010000 : 6'b000000 ;end // output Up
		3'b101:begin s = (cs & rd) ? 6'b100000 : 6'b000000 ;end // output Dn
		default:begin s=6'b000000 ; end
	endcase
end

//Input Registers
always @(posedge clk) begin
d_in_mult_A		= (s[0]) ? d_in : d_in_mult_A; // data in mult A
d_in_mult_B		= (s[1]) ? d_in : d_in_mult_B; // data in mult B
init			= (s[2]) ? d_in[0] : init; // data in mult B
end

//Output registers
always @(posedge clk) begin
	case (s[5:3])
		3'b001: d_out= {30'b0, ready};
		3'b010: d_out= res_up;
		3'b100: d_out= res_dn;
		default: d_out=0;
	endcase
end

multiplier #(
	.freq_hz(  clk_freq )
)mult0(
	.reset(    rst          ),
	.clk(      clk          ),
	.A_in(        d_in_mult_A  ),
	.B_in(        d_in_mult_B  ),
	.init(     init         ),
	.ready(    ready        ),
	.res_up(   res_up       ),
	.res_dn(   res_dn       )
);
endmodule