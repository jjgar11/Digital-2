`timescale 1ns / 1ps

`define SIMULATION


module mult_TB;

   reg  clk;
   reg  reset;
   reg  init;
   reg  [15:0] op_A;
   reg  [15:0] op_B;
   wire [31:0] result;
   wire done;

   mult uut (.clk(clk) , .reset(reset) , .init(init) , .op_A(op_A) , .op_B(op_B) , .result(result) , .done(done));

   parameter PERIOD          = 20;
   parameter real DUTY_CYCLE = 0.5;
   parameter OFFSET          = 0;
   reg [20:0] i;

	event reset_trigger;
	event reset_done_trigger;

	initial begin 
	  forever begin 
	   @ (reset_trigger);
		@ (negedge clk);
		reset = 1;
		@ (negedge clk);
		reset = 0;
		-> reset_done_trigger;
		end
	end



   initial begin  // Initialize Inputs
      clk = 0; reset = 0; init = 0; op_A = 16'h0055; op_B = 16'h0033;
   end

   initial  begin  // Process for clk
     #OFFSET;
     forever
       begin
         clk = 1'b0;
         #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b1;
         #(PERIOD*DUTY_CYCLE);
       end
   end

   initial begin // Reset the system, Start the image capture process
        #10 -> reset_trigger;
        @ (reset_done_trigger);
        @ (posedge clk);
        init = 0;
        @ (posedge clk);
        init = 1;

       for(i=0; i<2; i=i+1) begin
         @ (posedge clk);
       end
          init = 0;

       for(i=0; i<50; i=i+1) begin
         @ (posedge clk);
       end

   end
	 

   initial begin: TEST_CASE
     $dumpfile("mult_TB.vcd");
     $dumpvars(-1, mult_TB);
     #((PERIOD*DUTY_CYCLE)*100) $finish;
   end

endmodule

