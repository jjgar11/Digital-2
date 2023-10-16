
module bench();
   parameter tck              = 40;

   reg CLK;
   reg i;
   reg RESET; 
   wire [4:0] LEDS;
   reg  RXD = 1'b0;
   wire TXD;
   wire [4:0] A;
   wire [2:0] RGB0;
   wire [2:0] RGB1;
   wire LATCH;
   wire BLANK;
   wire CLK_SCREEN;

   SOC uut(
     .clk(CLK),
     .resetn(RESET),
     .LEDS(LEDS),
     .RXD(RXD),
     .TXD(TXD),
     .A(A),
     .RGB0(RGB0),
     .RGB1(RGB1),
     .LATCH(LATCH),
     .BLANK(BLANK),
     .CLK_SCREEN(CLK_SCREEN)
   );


initial         CLK <= 0;
always #(tck/2) CLK <= ~CLK;


   reg[4:0] prev_LEDS = 0;
   initial begin
	 if(LEDS != prev_LEDS) begin
	    $display("LEDS = %b",LEDS);
	 end
	 prev_LEDS <= LEDS;
	
   end
   
   initial
 begin
    $dumpfile("bench.vcd");
    $dumpvars(0,bench);
    #0   RESET = 0;
    #80  RESET = 0;
    #160 RESET = 1;
    #(tck*100000) $finish;
 end
 
 
endmodule   
 
