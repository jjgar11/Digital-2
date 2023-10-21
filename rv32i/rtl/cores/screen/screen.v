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
	output wire			clk_screen,
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

parameter NUM_COLS = 64;

reg [1:0]	state;
reg [($clog2(NUM_COLS)-1):0]	col;
reg			enable_clk;
assign		clk_screen = clk_sm & enable_clk;

// reg [NUM_COLS-1:0]	Rdata = 64'hFFFF0000FFFFFFFF;
// reg [NUM_COLS-1:0]	Gdata = 64'hFFFFFFFF0000FFFF;
// reg [NUM_COLS-1:0]	Bdata = 64'h0000FFFFFFFFFFFF;

// assign R0 = Rdata[col];
// assign G0 = Gdata[col];
// assign B0 = Bdata[col];
// assign R1 = ~Rdata[col];
// assign G1 = ~Gdata[col];
// assign B1 = ~Bdata[col];

reg [2:0] colors;
reg  count_secs;

always @(posedge clk_secs or posedge reset)
begin
	if (reset) begin
		colors		<= 0;
		count_secs	<= 0;
	end else begin
		count_secs++;
		if(&(count_secs)) begin
			colors++;
		end
	end
end

assign R0 = colors[0];
assign G0 = colors[1];
assign B0 = colors[2];
assign R1 = colors[0];
assign G1 = colors[1];
assign B1 = colors[2];

localparam DELAY = 64;
reg [($clog2(DELAY)-1):0] delay_cycles;


always @(negedge clk_sm or posedge reset)
begin
if (reset) begin
	blank	<= 1;
	latch	<= 0;
	state	<= START;
	row	<= 0;
	col	<= 0;
	enable_clk <= 0;
	delay_cycles <= 0;
end else begin
	case(state)
		START: begin
			blank	<= 1;
			state	<= SHIFT;
			enable_clk <= 1;
		end
		SHIFT: begin
			if (&col) begin
				enable_clk <= 0;
				latch <= 1;
				state <= PRINT;
			end
			col++;
		end
		PRINT: begin
			latch <= 0;
			if (!latch) begin
				blank <= 0;
				state <= WAIT;
				delay_cycles <= 0;
			end
		end
		WAIT: begin
			if (delay_cycles == DELAY - 1) begin
				row++;
				blank <= 1;
				state <= START;
			end else if (delay_cycles == 1) begin
				blank <= 1;
			end
			delay_cycles++;
		end
	endcase
end
end


// ======================================================================
// ================== divisor de reloj 25MHz a 2.5MHz ===================
// ======================================================================

localparam FREQ_SCREEN = 2500000;
localparam CYCLES = freq_hz/FREQ_SCREEN/2;
reg [($clog2(CYCLES)-1):0] count_clk;

reg clk_sm;

always@(posedge clk or posedge reset)
begin
	if (reset) begin
		clk_sm <= 0;
		count_clk <= 0;
	end else begin
		if(count_clk==CYCLES - 1) begin		// cuenta x de reloj    
				count_clk<=0;				// reinicia cuenta a 0
				clk_sm <= ~clk_sm; // transiciona clk_sm a alto o bajo
		end	else begin
			count_clk<=count_clk+1;  //  aumenta contador
		end
	end
end

// ======================================================================
// ======================================================================




// ======================================================================
// ================== divisor de reloj 25MHz a 1Hz ===================
// ======================================================================

localparam FREQ_HZ = 1;
localparam CYCLES2 = freq_hz/FREQ_HZ/2;
reg [($clog2(CYCLES2)-1):0] count_clk_seg = 0;

reg clk_secs;

always@(posedge clk or posedge reset)
begin
	if (reset) begin
		clk_secs <= 0;
	end else begin
		if(count_clk_seg==CYCLES2 - 1) begin		// cuenta x de reloj    
				count_clk_seg<=0;				// reinicia cuenta a 0
				clk_secs <= ~clk_secs; // transiciona clk_secs a alto o bajo
		end	else begin
			count_clk_seg<=count_clk_seg+1;  //  aumenta contador
		end
	end
end

// ======================================================================
// ======================================================================

endmodule