//-----------------------------------------------------
// Design Name : divisor_old 
// File Name   : divisor_old.v
//-----------------------------------------------------
module divisor_old #(
	parameter          freq_hz = 25000000
) (
	input				reset,
	input				clk,
	// operandos
	input [31:0]		DV_in,
	input [31:0]		DR_in,
	//
	input				init,	// control de inicio
	output reg			ready,	// verificacion resultado
	// resultado
	output reg [31:0]	result
	//	
);

reg	[31:0]	DV;
reg	[31:0]	DR;
reg [31:0]	PP;
reg	[31:0]	A;
reg	[5:0]	count;
reg			busy;
reg			hold;

always @(posedge clk)
begin
	if (reset) begin
		DV		<= 0;
		DR		<= 0;
		PP		<= 0;
		A		<= 0;
		count	<= 0;
		busy	<= 0;
		ready	<= 0;
		hold	<= 0;
	end else begin
		if (init & !busy) begin
			DV		<= DV_in;
			DR		<= DR_in;
			PP		<= 0;
			A		<= 0;
			count	<= 32;
			ready	<= 0;
			hold	<= 0;
			busy	<= 1;
		end
		if (busy) begin
			if (!hold) begin
				A	<= { A[30:0], DV[31] };
				DV	<= { DV[30:0], 1'b0 };
				count--;
				PP	<= { PP[30:0], 1'b0 };
				hold	<= 1;
			end
			else begin
				hold <= 0;
				if (A < DR) begin
					PP[0] <= 1'b0;
				end else begin
					PP[0] <= 1'b1;
					A <= A - DR;
				end
			end
			if (!(|count) & hold) begin
				ready	<= 1;
				busy	<= 0;
				result	<= PP;
			end
		end
	end
end

endmodule