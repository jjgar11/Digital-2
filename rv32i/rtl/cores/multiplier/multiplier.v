//-----------------------------------------------------
// Design Name : multiplier 
// File Name   : multiplier.v
//-----------------------------------------------------
module multiplier #(
	parameter          freq_hz = 25000000
) (
	input				reset,
	input				clk,
	// operandos
	input [31:0]		A_in,
	input [31:0]		B_in,
	//
	input				init,	// control de inicio
	output reg			ready,	// verificacion resultado
	// resultado
	output reg [31:0]	res_up,
	output reg [31:0]	res_dn
	//	
);

reg [63:0]	PP;
reg	[63:0]	A;
reg	[31:0]	B;
reg			busy;

always @(posedge clk)
begin
	if (reset) begin
		PP		<= 0;
		A		<= 0;
		B		<= 0;
		busy	<= 0;
		ready	<= 0;
	end else begin
		if (init & !busy) begin
			A		<= { 32'b0, A_in};
			B		<= B_in;
			PP		<= 0;
			ready	<= 0;
			busy	<= 1;
		end
		if (busy) begin
			if (B[0]) begin
				PP <= PP+A;
			end
			A <= {A[62:0], 1'b0};
			B <= {1'b0, B[31:1]};
			if (!(|B)) begin
				ready	<= 1;
				busy	<= 0;
				res_up	<= PP[63:32];
				res_dn	<= PP[31:0];
			end
		end
	end
end

endmodule