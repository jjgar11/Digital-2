//-----------------------------------------------------
// Design Name : bin2bcd 
// File Name   : bin2bcd.v
//-----------------------------------------------------
module bin2bcd #(
	parameter          freq_hz = 25000000
) (
	input				reset,
	input				clk,
	// numero binario
	input [31:0]		bin_in,
	//
	input				init,	// control de inicio
	output reg			ready,	// verificacion resultado
	// resultado
	output reg [31:0]	result_dn,
	output reg [31:0]	result_up
	//	
);

reg	[1:0]	state, nextState;
reg	[31:0]	bin;
reg	[4:0]	count;
reg			busy;

// Asignación síncrona: Actualización del estado
always @(negedge clk)
begin
	if (reset) begin
		state	<= 0;
	end else begin
		state <= nextState;
	end
end

always @(posedge clk)
begin
	case (state)
		0: begin		// start
			if (!init) begin
				bin		<= 0;
				count	<= 0;
				busy	<= 0;
				nextState <= 0;
			end else begin
				bin			<= bin_in;
				count		<= 32;
				result_up	<= 0;
				result_dn	<= 0;
				busy		<= 1;
				ready		<= 0;
				nextState	<= 1;
			end
		end
		1: begin
			result_up	<= { result_up[30:0], result_dn[31] };
			result_dn	<= { result_dn[30:0], bin[31] };
			bin			<= { bin[30:0], 1'b0 };
			count--;
			nextState	<= 2;
		end
		2: begin
			if (|count) begin
				nextState	<= 3;
			end else begin
				nextState	<= 0;
				ready		<= 1;
			end
		end
		3: begin
			nextState	<= 1;

			//=========== SUMA EN RESULT_DN ==================

			if (result_dn[3:0] > 4'd4) begin
				result_dn[3:0] <= result_dn[3:0] + 4'd3;
			end
			if (result_dn[7:4] > 4'd4) begin
				result_dn[7:4] <= result_dn[7:4] + 4'd3;
			end
			if (result_dn[11:8] > 4'd4) begin
				result_dn[11:8] <= result_dn[11:8] + 4'd3;
			end
			if (result_dn[15:12] > 4'd4) begin
				result_dn[15:12] <= result_dn[15:12] + 4'd3;
			end
			if (result_dn[19:16] > 4'd4) begin
				result_dn[19:16] <= result_dn[19:16] + 4'd3;
			end
			if (result_dn[23:20] > 4'd4) begin
				result_dn[23:20] <= result_dn[23:20] + 4'd3;
			end
			if (result_dn[27:24] > 4'd4) begin
				result_dn[27:24] <= result_dn[27:24] + 4'd3;
			end
			if (result_dn[31:28] > 4'd4) begin
				result_dn[31:28] <= result_dn[31:28] + 4'd3;
			end


			//=========== SUMA EN RESULT_UP ==================

			if (result_up[3:0] > 4'd4) begin
				result_up[3:0] <= result_up[3:0] + 4'd3;
			end
			if (result_up[7:4] > 4'd4) begin
				result_up[7:4] <= result_up[7:4] + 4'd3;
			end
			if (result_up[11:8] > 4'd4) begin
				result_up[11:8] <= result_up[11:8] + 4'd3;
			end
			if (result_up[15:12] > 4'd4) begin
				result_up[15:12] <= result_up[15:12] + 4'd3;
			end
			if (result_up[19:16] > 4'd4) begin
				result_up[19:16] <= result_up[19:16] + 4'd3;
			end
			if (result_up[23:20] > 4'd4) begin
				result_up[23:20] <= result_up[23:20] + 4'd3;
			end
			if (result_up[27:24] > 4'd4) begin
				result_up[27:24] <= result_up[27:24] + 4'd3;
			end
			if (result_up[31:28] > 4'd4) begin
				result_up[31:28] <= result_up[31:28] + 4'd3;
			end
		end
		default: nextState <= 0;
	endcase
end

endmodule