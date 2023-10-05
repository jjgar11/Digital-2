module peripheral_divisor#(
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
reg [4:0]	s;
reg [31:0]	d_in_DV = 0;	// data in div A
reg [31:0]	d_in_DR = 0;	// data in div B
reg 		init = 0;	// div init
wire 		ready;	// div ready
wire [31:0]	result;	// data out result
reg			init2; 
reg			init_prev = 0;

//----address_decoder (one selection bit for register) ------------------
always @(*) begin
	case (addr)
		3'b000:begin s = (cs & wr) ? 5'b00001 : 0 ;end // input A
		3'b001:begin s = (cs & wr) ? 5'b00010 : 0 ;end // input B
		3'b010:begin s = (cs & wr) ? 5'b00100 : 0 ;end // init
		3'b011:begin s = (cs & rd) ? 5'b01000 : 0 ;end // output ready
		3'b100:begin s = (cs & rd) ? 5'b10000 : 0 ;end // output result
		default:begin s=0 ; end
	endcase
end

//----init pulse generator ------------------
always @(negedge clk)
begin
	if (init == init_prev) begin
		init2 = 0;
		init_prev <= init_prev;
	end else begin
		init_prev <= init;
		if (init == 1) begin
			init2 = 1;
		end else begin
			init2 = 0;
		end
	end
end

//Input Registers
always @(posedge clk) begin
d_in_DV		= (s[0]) ? d_in : d_in_DV; // data in dividendo
d_in_DR		= (s[1]) ? d_in : d_in_DR; // data in divisor
init			= (s[2]) ? d_in[0] : init; // init operation
end

//Output registers
always @(posedge clk) begin
	case (s[4:3])
		2'b01: d_out= {30'b0, ready};
		2'b10: d_out= result;
		default: d_out=0;
	endcase
end

divisor #(
	.freq_hz(  clk_freq )
)div0(
	.reset(    rst          ),
	.clk(      clk          ),
	.DV_in(    d_in_DV      ),
	.DR_in(    d_in_DR      ),
	.init(     init2        ),
	.ready(    ready        ),
	.result(   result       )
);
endmodule