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
   wire [29:0] mem_wordaddr = mem_addr[31:2];
   reg isIO;
   reg isRAM;
   reg uart_valid;
   wire mem_wstrb = |mem_wmask;

   Memory RAM(
      .clk(clk),
      .mem_addr(mem_addr),
      .mem_rdata(RAM_rdata),
      .mem_rstrb(isRAM & mem_rstrb),
      .mem_wdata(mem_wdata),
      .mem_wmask({4{isRAM}}&mem_wmask)
   );

   wire uart_tx_busy;
   wire uart_data_available;
   wire uart_error;
   reg  tx_wr  = 0;
   reg  rx_ack = 0;   
   wire [7:0] uart_rx_data;
   reg  [7:0] uart_tx_data;
   reg  [31:0] IO_rdata;
  uart #(
	.freq_hz(25000000),  // for Colorlight
	.baud(115200)        // for colorlight
//	.freq_hz(27000000),  // for Gowin
//	.baud(57600)         // for Gowin
  ) UART_LM ( 
	.reset(!resetn),
	.clk(clk),
	// UART lines
	.uart_rxd(RXD),
	.uart_txd(TXD),
	// 
	.rx_data(uart_rx_data),          // Output Data
	.rx_avail(uart_data_available),  // Output data
	.rx_error(uart_error),           // Output
	.rx_ack(rx_ack),                 // Input Enable receiver
	.tx_data(uart_tx_data),        // Input Data      
	.tx_wr(tx_wr),                   // Input: Enable Transmitter
	.tx_busy(uart_tx_busy)           // Output Uart transmitting
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

  always @*
  begin
      if ( (mem_addr[23:0] >= 24'h400008) && (mem_addr[23:0] <= 24'h400010) ) begin	// direcciones - chip_select
        uart_valid = 1;
      end else begin
        uart_valid = 0;
      end
  end  

   // Memory-mapped IO in IO page, 1-hot addressing in word address.   
   localparam IO_LEDS_bit      = 2;  // W five leds
   localparam IO_UART_DAT_bit  = 3;  // W data to send (8 bits) 
   localparam IO_UART_CNTL_bit = 4;  // R status. bit 9: busy sending
   
   
   always @(posedge clk) begin
      if(isIO & mem_wstrb & mem_addr[IO_LEDS_bit]) begin
	 LEDS <= mem_wdata;
	 $display("Value sent to LEDS: %b %d %d",mem_wdata,mem_wdata,$signed(mem_wdata));
      end
   end


   always @(posedge clk) begin
     if (uart_valid & mem_wstrb & mem_addr[IO_UART_DAT_bit]) begin
       uart_tx_data <= mem_wdata[7:0];
     end
   end

   always @(posedge clk) begin
     if (uart_valid & mem_wstrb & mem_addr[IO_UART_CNTL_bit]) begin
       tx_wr  <= mem_wdata[0];
       rx_ack <= mem_wdata[1];
     end
   end


  always @*
  begin
      if ( uart_valid & !mem_wstrb) begin
        case (mem_addr[7:0])	// direcciones - chip_select
          8'h10: IO_rdata = {22'b0, uart_tx_busy, uart_data_available, uart_error, 7'b0};
          8'h08: IO_rdata = { 24'b0, uart_rx_data};
          default: IO_rdata = 32'b0;
        endcase
      end else begin
        IO_rdata =  32'b0;
      end
  end 

  assign mem_rdata = isRAM ? RAM_rdata : IO_rdata;
   
   
`ifdef BENCH
   always @(posedge clk) begin
      if(uart_valid & mem_wstrb & mem_addr[IO_UART_DAT_bit]) begin
	 $write("%c", mem_wdata[7:0] );
	 $fflush(32'h8000_0001);
      end
   end
`endif

endmodule
