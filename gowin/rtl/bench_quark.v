module bench();
// Testbench uses a 10 MHz clock
// Want to interface to 115200 baud UART
// 25000000 / 115200 = 217 Clocks Per Bit.
parameter tck              = 40;
parameter c_BIT_PERIOD     = 8680;

   reg CLK;
   reg i;
   reg RESET; 
   wire [4:0] LEDS;
   reg  RXD = 1'b0;
   wire TXD;



  // Takes in input byte and serializes it 
  task UART_WRITE_BYTE;
    input [7:0] i_Data;
    integer     ii;
    begin
       
      // Send Start Bit
      RXD <= 1'b0;
      #(c_BIT_PERIOD);
      #1000;
       
       
      // Send Data Byte
      for (ii=0; ii<8; ii=ii+1)
        begin
          RXD <= i_Data[ii];
          #(c_BIT_PERIOD);
        end
       
      // Send Stop Bit
      RXD <= 1'b1;
      #(c_BIT_PERIOD);
     end
  endtask // UART_WRITE_BYTE
  
  
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
    $dumpvars(-1,bench);
    #0   RXD   = 1;
    #0   RESET = 0;
    #80  RESET = 0;
    #160 RESET = 1;
    // Send a command to the UART (exercise Rx)
    @(posedge CLK);
    #(tck*50000)
    UART_WRITE_BYTE(8'h34);
    #(tck*2500)
    UART_WRITE_BYTE(8'h35);
    @(posedge CLK);
    #(tck*80000) $finish;
 end
 
 
endmodule   
 
