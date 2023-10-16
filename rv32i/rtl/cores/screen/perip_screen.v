module peripheral_screen#(
	parameter          clk_freq = 25000000
)(
	input clk,
	input rst,
	output			clk_screen,
	output			R0,
	output			G0,
	output			B0,
	output			R1,
	output			G1,
	output			B1,
	output			blank,
	output			latch,
	output [4:0]	row
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