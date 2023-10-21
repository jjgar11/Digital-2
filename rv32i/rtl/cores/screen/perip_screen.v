module peripheral_screen#(
	parameter          clk_freq = 25000000
)(
	input clk,
	input rst,
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

screen32x32 #(
	.freq_hz(  clk_freq )
)screen0(
	.reset(      rst          ),
	.clk(        clk          ),
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