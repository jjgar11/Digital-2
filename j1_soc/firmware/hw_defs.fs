( Hardware port assignments )

h# FF00 constant mult_a  \ no cambiar estos tres
h# FF02 constant mult_b  \ hacen parte de otras
h# FF04 constant mult_p  \ definiciones

\ memory map multiplier:
h# 6700 constant multi_a	
h# 6702 constant multi_b
h# 6704 constant multi_init
h# 6706 constant multi_done
h# 6708 constant multi_pp_high
h# 670A constant multi_pp_low


\ memory map divider:
h# 6800 constant div_a		
h# 6802 constant div_b
h# 6804 constant div_init
h# 6806 constant div_done
h# 6808 constant div_c


\ memory map uart:
h# 6900 constant uart_status  \ 3'b0, tx_busy, 2'b0, rx_error, rx_avail
h# 6902 constant uart_data_rx \ Data received
h# 6904 constant uart_data_tx \ Data to trasnmit
h# 6906 constant uart_ctrl    \ 5'b0, LED, tx_wr, rx_ack




