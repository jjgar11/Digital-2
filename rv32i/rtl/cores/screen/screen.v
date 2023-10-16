//-----------------------------------------------------
// Design Name : screen32x32 
// File Name   : screen.v
//-----------------------------------------------------
module screen32x32 #(
	parameter          freq_hz = 25000000
) (
	input				reset,
	input				clk,
	//	
	output reg			clk_screen,
	output wire			R0,
	output wire			G0,
	output wire			B0,
	output wire			R1,
	output wire			G1,
	output wire			B1,
	output reg			blank,
	output reg			latch,
	output reg [4:0]	row);

parameter START  = 2'b00;
parameter SHIFT  = 2'b01;
parameter PRINT  = 2'b10;
parameter WAIT   = 2'b11;

reg [1:0]	state;
reg [5:0]	col;
reg [31:0]	Rdata = 32'b01010101010101010101010101010101;
reg [31:0]	Gdata = 32'b10101010101010101010101010101010;
reg [31:0]	Bdata = 32'b11111111111111111111111111111110;

assign R0 = Rdata[31];
assign G0 = Gdata[31];
assign B0 = Bdata[31];
assign R1 = Rdata[31];
assign G1 = Gdata[31];
assign B1 = Bdata[31];

localparam DELAY = 100000;
localparam WIDTH2 = $clog2(DELAY)-1;
reg [WIDTH2:0] delay_cycles = 0;


always @(negedge clk_screen or posedge reset)
begin
if (reset) begin
	blank	<= 0;
	latch	<= 0;
	state	<= 0;
	row	<= 0;
	col	<= 0;
end else begin
	case(state)
		START: begin
			blank	<= 1;
			state	<= 1;
		end
		SHIFT: begin
			if ((&col)) begin
				latch <= 1;
				state <= 2;
			end
			Rdata = {Rdata[30:0], Rdata[31]};
			Gdata = {Gdata[30:0], Gdata[31]};
			Bdata = {Bdata[30:0], Bdata[31]};
			col++;
		end
		PRINT: begin
			latch <= 0;
			if (!latch) begin
				blank <= 0;
				state <= 3;
				delay_cycles <= 0;
			end
		end
		WAIT: begin
			if (delay_cycles == DELAY) begin
				row++;
				state <= 0;
			end else begin
				delay_cycles++;
			end
		end
	endcase
end
end


// ======================================================================
// ================== divisor de reloj 25MHz a 2.5MHz ===================
// ======================================================================

localparam FREQ_SCREEN = 2500000;
localparam CYCLES = freq_hz/FREQ_SCREEN/2;
localparam WIDTH = $clog2(CYCLES)-1;

reg [WIDTH:0] count_clk = 0;

always@(posedge clk or posedge reset)
begin
	if (reset) begin
		clk_screen <= 0;
	end else begin
		if(count_clk==CYCLES-1) begin		// cuenta x de reloj    
				count_clk<=0;				// reinicia cuenta a 0
				clk_screen <= ~clk_screen; // transiciona clk_screen a alto o bajo
		end	else begin
			count_clk<=count_clk+1;  //  aumenta contador
		end
	end
end

// ======================================================================
// ======================================================================

endmodule