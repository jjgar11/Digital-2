//-----------------------------------------------------
// Design Name : divisor 
// File Name   : divisor.v
//-----------------------------------------------------
module divisor #(
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

reg	[1:0]	state, nextState;
reg			rst;
reg	[31:0]	DV;
reg	[31:0]	DR;
reg [31:0]	PP;
reg	[31:0]	A;
reg	[5:0]	count;
reg			busy;
reg			init2; 
reg			init_prev = 0;

// Asignación síncrona: Actualización del estado
always @(posedge clk)
begin
	if (reset | rst) begin
		DV		<= 0;
		DR		<= 0;
		A		<= 0;
		count	<= 0;
		busy	<= 0;
		state	<= 0;
		nextState <= 0;
		rst		<= 0;
	end else begin
		state <= nextState;
	end
end

always @(posedge clk)
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

always @(state, posedge init2)
begin
	case (state)
		0: begin		// start
			if (!init2) begin
				rst		<= 1;
				nextState <= 0;
			end else begin
				DV		<= DV_in;
				DR		<= DR_in;
				PP		<= 0;
				A		<= 0;
				count	<= 32;
				busy	<= 1;
				ready	<= 0;
				nextState <= 1;
			end
		end
		1: begin		// shift
			A	<= { A[30:0], DV[31] };
			DV	<= { DV[30:0], 1'b0 };
			count--;
			nextState <= 2;
		end
		2: begin		// check
			if (A < DR) begin
				PP	<= { PP[30:0], 1'b0 };
			end else begin
				PP	<= { PP[30:0], 1'b1 };
				A	<= A - DR;
			end
			if (|count) begin
				nextState <= 1;
			end else begin
				nextState <= 3;
			end
		end
		3: begin		// end
			ready	<= 1;
			busy	<= 0;
			result	<= PP;
			nextState <= 0;
		end
		default: nextState <= 0;
	endcase
end

endmodule