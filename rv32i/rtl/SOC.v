module SOC (
    input 	     clk,    // system clock 
    input 	     resetn, // reset button
    output wire [4:0] LEDS,   // system LEDs

    output [2:0] RGB0,   // top rows RGB
    output [2:0] RGB1,   // bottom rows RGB
    output [4:0] A,      // row select
    output       LATCH,
    output       BLANK,
    output       CLK_SCREEN,

    input 	     RXD,    // UART receive
    output 	     TXD     // UART transmit
);
   wire [31:0] mem_addr;
   reg  [31:0] mem_rdata;
   wire mem_rstrb;
   wire [31:0] mem_wdata;
   wire [3:0]  mem_wmask;

   FemtoRV32 CPU(
      .clk(clk),
      .reset(resetn),		 
      .mem_addr(mem_addr),
      .mem_rdata(mem_rdata),
      .mem_rstrb(mem_rstrb),
      .mem_wdata(mem_wdata),
      .mem_wmask(mem_wmask),
      .mem_rbusy(1'b0),
      .mem_wbusy(1'b0)
   );
   wire [31:0] RAM_rdata;
   wire  wr = |mem_wmask;
   wire  rd = mem_rstrb; 

   Memory RAM(
      .clk(clk),
      .mem_addr(mem_addr),
      .mem_rdata(RAM_rdata),
      .mem_rstrb(cs[0] & rd),
      .mem_wdata(mem_wdata),
      .mem_wmask({4{cs[0]}}&mem_wmask)
   );


   wire [31:0] screen_dout;
   wire [31:0] uart_dout;
   wire [31:0] gpio_dout;
   wire [31:0] mult_dout;
   wire [31:0] div_dout;
   wire [31:0] bin2bcd_dout;


  peripheral_screen #(
     .clk_freq(25000000)
  ) per_screen(
     .clk(clk), 
     .rst(!resetn), 
     .clk_screen(CLK_SCREEN),
     .R0(RGB0[0]),
     .G0(RGB0[1]),
     .B0(RGB0[2]),
     .R1(RGB1[0]),
     .G1(RGB1[1]),
     .B1(RGB1[2]),
     .blank(BLANK),
     .latch(LATCH),
     .row(A)
   ); 


  peripheral_uart #(
     .clk_freq(25000000),
     .baud(115200)
   ) per_uart(
     .clk(clk), 
     .rst(!resetn), 
     .d_in(mem_wdata), 
     .cs(cs[5]), 
     .addr(mem_addr[4:0]), 
     .rd(rd), 
     .wr(wr), 
     .d_out(uart_dout), 
     .uart_tx(TXD), 
     .uart_rx(RXD), 
     .ledout(LEDS[0])
   ); 


  peripheral_multiplier #(
     .clk_freq(25000000)
   ) per_mult(
     .clk(clk), 
     .rst(!resetn), 
     .d_in(mem_wdata), 
     .cs(cs[3]), 
     .addr(mem_addr[4:2]), 
     .rd(rd), 
     .wr(wr), 
     .d_out(mult_dout)
   ); 


  peripheral_divisor #(
     .clk_freq(25000000)
   ) per_div(
     .clk(clk), 
     .rst(!resetn), 
     .d_in(mem_wdata), 
     .cs(cs[2]), 
     .addr(mem_addr[4:2]), 
     .rd(rd), 
     .wr(wr), 
     .d_out(div_dout)
   ); 


  peripheral_bin2bcd #(
     .clk_freq(25000000)
  ) per_conv(
     .clk(clk), 
     .rst(!resetn), 
     .d_in(mem_wdata), 
     .cs(cs[1]), 
     .addr(mem_addr[4:2]), 
     .rd(rd), 
     .wr(wr), 
     .d_out(bin2bcd_dout)
   );


  // ============== Chip_Select (Addres decoder) ======================== 
  // se hace con los 8 bits mas significativos de mem_addr
  // Se asigna el rango de la memoria de programa 0x00000000 - 0x003FFFFF
  // ====================================================================
  reg [6:0]cs;  // CHIP-SELECT
  always @*
  begin
      case (mem_addr[31:16])	// direcciones - chip_select
        16'h0045: cs= 7'b1000000; 		//screen
        16'h0040: cs= 7'b0100000; 		//uart
        16'h0041: cs= 7'b0010000;		//gpio
        16'h0042: cs= 7'b0001000;		//mult
        16'h0043: cs= 7'b0000100;		//div
        16'h0044: cs= 7'b0000010;		//bin_to_bcd
        default:  cs= 7'b0000001;                //RAM            
      endcase
  end
  // ============== MUX ========================  // se encarga de lecturas del RV32
  always @*
  begin
      case (cs)
        7'b1000000: mem_rdata = screen_dout;
        7'b0100000: mem_rdata = uart_dout;
        7'b0010000: mem_rdata = gpio_dout;
        7'b0001000: mem_rdata = mult_dout;
        7'b0000100: mem_rdata = div_dout;
        7'b0000010: mem_rdata = bin2bcd_dout;
        7'b0000001: mem_rdata = RAM_rdata;
        default: mem_rdata = 32'h66666666;
      endcase
  end
 // ============== MUX ========================  // 

`ifdef BENCH
   always @(posedge clk) begin
      if(cs[5] & wr ) begin
	 $write("%c", mem_wdata[7:0] );
	 $fflush(32'h8000_0001);
      end
   end
`endif


endmodule
