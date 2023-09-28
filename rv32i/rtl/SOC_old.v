module SOC (
    input 	     clk,    // system clock 
    input 	     resetn, // reset button
    output reg [4:0] LEDS,   // system LEDs
    input 	     RXD,    // UART receive
    output 	     TXD     // UART transmit
);


   wire [31:0] mem_addr;
   wire [31:0] mem_rdata;
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
   reg isIO;
   reg isRAM;
   wire mem_wstrb = |mem_wmask;

   Memory RAM(
      .clk(clk),
      .mem_addr(mem_addr),
      .mem_rdata(RAM_rdata),
      .mem_rstrb(isRAM & mem_rstrb),
      .mem_wdata(mem_wdata),
      .mem_wmask({4{isRAM}}&mem_wmask)
   );

   wire uart_valid = isIO & mem_wstrb & mem_addr[IO_UART_DAT_W_bit];

   wire data_available_rx;
   wire [7:0] data_rx;
   wire uart_ready;
   
   corescore_emitter_uart #(
      .clk_freq_hz(25000000),
      .baud_rate(115200)			    
   ) UART(
      .clk(clk),
      .rst(!resetn),
	   .uart_rx(RXD),
      .uart_tx(TXD),
      .tx_data(mem_wdata[7:0]),
      .tx_valid(uart_valid),
      .tx_ready(uart_ready),
      .rx_ack(uart_ack),
	   .rx_valid(data_available_rx),
	   .rx_data(data_rx)
   );
  always @*
  begin
      if (mem_addr[31:20] == 12'h004) begin	// direcciones - chip_select
        isIO  = 1;
        isRAM = 0;
      end else begin
        isIO  = 0;
        isRAM = 1;
      end
  end  

   // Memory-mapped IO in IO page, 1-hot addressing in word address.   
   localparam IO_LEDS_bit      = 2;  // W five leds
   localparam IO_UART_DAT_W_bit  = 3;  // W data to send (8 bits) 
   localparam IO_UART_CNTL_bit = 4;  // R status. bit 9: busy sending
   localparam IO_UART_DAT_R_bit = 5;  
   
   always @(posedge clk) begin
      if(isIO & mem_wstrb & mem_addr[IO_LEDS_bit]) begin
	 LEDS <= mem_wdata;
	 $display("Value sent to LEDS: %b %d %d",mem_wdata,mem_wdata,$signed(mem_wdata));
      end
   end

   reg uart_ack = 0;
   
   always @(posedge clk) begin
      if(isIO & mem_wstrb & mem_addr[IO_UART_DAT_R_bit]) begin
         uart_ack <= mem_wdata;
      end
   end
   reg [31:0] IO_rdata;
   always @*
   begin
      case (mem_addr[IO_UART_DAT_R_bit:IO_UART_CNTL_bit])
      2'b10 : IO_rdata = data_rx;
      2'b01 : IO_rdata = { 22'b0, !uart_ready, data_available_rx, 8'b0};
      default : IO_rdata = 0;
      endcase
   end

   assign mem_rdata = isRAM ? RAM_rdata : IO_rdata;
   
   
`ifdef BENCH
   always @(posedge clk) begin
      if(uart_valid) begin
	 $write("%c", mem_wdata[7:0] );
	 $fflush(32'h8000_0001);
      end
   end
`endif

endmodule
