
module bench();
   parameter tck              = 40;

   reg CLK;
   reg i;
   reg RESET; 
   wire [4:0] LEDS;
   reg  RXD = 1'b0;
   wire TXD;

   SOC uut(
     .clk(CLK),
     .resetn(RESET),
     .LEDS(LEDS),
     .RXD(RXD),
     .TXD(TXD)
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
    #(tck*1000000) $finish;
 end
 
 
endmodule   
 
