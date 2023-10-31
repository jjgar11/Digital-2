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

// ====== Estados de la maquina de estados ======
parameter START  = 2'b00;
parameter SHIFT  = 2'b01;
parameter PRINT  = 2'b10;
parameter WAIT   = 2'b11;
reg [1:0]	state;
// ----------------------------------------------

// ======== Caracteristicas de la matriz ========
parameter NUM_COLS = 64;
parameter NUM_ROWS = 64;
parameter NUM_PIXELS = NUM_COLS*NUM_ROWS;
parameter HALF_SCREEN = NUM_PIXELS/2;
parameter BIT_DEPTH = 3;
reg [($clog2(NUM_COLS)-1):0]		col;
reg [($clog2(HALF_SCREEN)-1):0]		base_pixel;
wire [($clog2(HALF_SCREEN)-1):0]	pixel;
// ----------------------------------------------

// ====== Parametros del BCM (Bit Code Modulation) ======
localparam INIT_DELAY = 64;
localparam MAX_DELAY = 2**(BIT_DEPTH-1) * INIT_DELAY;
reg [($clog2(MAX_DELAY+1)-1):0] count_delay;
reg [($clog2(MAX_DELAY+1)-1):0] delay_cycles;
reg [($clog2(BIT_DEPTH)-1):0] index_depth;
// ------------------------------------------------------

// ====== INFORMACION DE LA MATRIX ENTERA ======
reg [(BIT_DEPTH*3-1):0] colors [(NUM_PIXELS-1):0];
// ---------------------------------------------

// ======= Informacion del pixel actual =======
wire [(BIT_DEPTH-1):0] data_r0;
wire [(BIT_DEPTH-1):0] data_g0;
wire [(BIT_DEPTH-1):0] data_b0;
wire [(BIT_DEPTH-1):0] data_r1;
wire [(BIT_DEPTH-1):0] data_g1;
wire [(BIT_DEPTH-1):0] data_b1;
// --------------------------------------------

// ====== Clock del registro de corrimiento ======
reg		enable_clk;
assign	clk_screen = clk_sm & enable_clk;
// -----------------------------------------------

// ======= Prueba desvanecido unicromatico =======
reg [(BIT_DEPTH*3-1):0] test [(NUM_COLS-1):0];
reg [6:0] color_counter;
reg [(BIT_DEPTH*1-1):0] zero = 0;
initial begin
	for (color_counter = 0; color_counter < 64; color_counter = color_counter + 1) begin
		test[color_counter] <= {color_counter[5:(6-BIT_DEPTH)], color_counter[5:(6-BIT_DEPTH)], zero};
	end
end
// -----------------------------------------------

// ============= Prueba imagen real =============
initial begin
    $readmemb("../images/multicolor.txt", colors);
end
// ----------------------------------------------

// =============== ASIGNACION DE SALIDAS ===============

assign pixel = base_pixel + col;
assign data_r0 = colors[pixel][(3*BIT_DEPTH-1):(2*BIT_DEPTH)];
assign data_g0 = colors[pixel][(2*BIT_DEPTH-1):(1*BIT_DEPTH)];
assign data_b0 = colors[pixel][(1*BIT_DEPTH-1):0];
assign data_r1 = colors[pixel+HALF_SCREEN][(3*BIT_DEPTH-1):(2*BIT_DEPTH)];
assign data_g1 = colors[pixel+HALF_SCREEN][(2*BIT_DEPTH-1):(1*BIT_DEPTH)];
assign data_b1 = colors[pixel+HALF_SCREEN][(1*BIT_DEPTH-1):0];
// assign data_r0 = test[col][(3*BIT_DEPTH-1):(2*BIT_DEPTH)];
// assign data_g0 = test[col][(2*BIT_DEPTH-1):(1*BIT_DEPTH)];
// assign data_b0 = test[col][(1*BIT_DEPTH-1):0];
// assign data_r1 = test[col][(3*BIT_DEPTH-1):(2*BIT_DEPTH)];
// assign data_g1 = test[col][(2*BIT_DEPTH-1):(1*BIT_DEPTH)];
// assign data_b1 = test[col][(1*BIT_DEPTH-1):0];

assign R0 = data_r0[index_depth];
assign G0 = data_g0[index_depth];
assign B0 = data_b0[index_depth];
assign R1 = data_r1[index_depth];
assign G1 = data_g1[index_depth];
assign B1 = data_b1[index_depth];
// -----------------------------------------------------

always @(negedge clk_sm or posedge reset)
begin
if (reset) begin
	row	<= 0;
	col	<= 0;
	blank	<= 1;
	latch	<= 0;
	state	<= START;
	base_pixel	<= 0;
	enable_clk	<= 0;
	count_delay	<= 0;
	delay_cycles<= INIT_DELAY;
	index_depth	<= 0;
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
				count_delay <= 0;
			end
		end
		WAIT: begin
			if (count_delay == delay_cycles - 1) begin
				index_depth++;
				delay_cycles = delay_cycles + delay_cycles;
				blank <= 1;
				state <= START;
			end
			if (delay_cycles == 0) begin
				index_depth	<= 0;
				delay_cycles<= INIT_DELAY;
				base_pixel	<= base_pixel + NUM_COLS;
				row++;
			end
			count_delay++;
		end
	endcase
end
end


// ======================================================================
// ================== divisor de reloj 25MHz a 12.5MHz ===================
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

// always@(clk)
// begin
// 	if (reset) begin
// 		clk_sm <= 0;
// 		count_clk <= 0;
// 	end else begin
// 		clk_sm <= clk;
// 	end
// end

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