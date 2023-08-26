////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.49d
//  \   \         Application: netgen
//  /   /         Filename: project.v
// /___/   /\     Timestamp: Mon Sep 26 07:59:01 2016
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -sim -ofmt verilog -w project.ngc 
// Device	: xc6slx4-2tqg144
// Input file	: project.ngc
// Output file	: project.v
// # of Modules	: 1
// Design Name	: mult_32
// Xilinx        : /opt/cad/Xilinx/14.4/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module mult_32 (
  clk, rst, init, done, A, B, pp
);
  input clk;
  input rst;
  input init;
  output done;
  input [15 : 0] A;
  input [15 : 0] B;
  output [31 : 0] pp;
  wire A_15_IBUF_0;
  wire A_14_IBUF_1;
  wire A_13_IBUF_2;
  wire A_12_IBUF_3;
  wire A_11_IBUF_4;
  wire A_10_IBUF_5;
  wire A_9_IBUF_6;
  wire A_8_IBUF_7;
  wire A_7_IBUF_8;
  wire A_6_IBUF_9;
  wire A_5_IBUF_10;
  wire A_4_IBUF_11;
  wire A_3_IBUF_12;
  wire A_2_IBUF_13;
  wire A_1_IBUF_14;
  wire A_0_IBUF_15;
  wire B_15_IBUF_16;
  wire B_14_IBUF_17;
  wire B_13_IBUF_18;
  wire B_12_IBUF_19;
  wire B_11_IBUF_20;
  wire B_10_IBUF_21;
  wire B_9_IBUF_22;
  wire B_8_IBUF_23;
  wire B_7_IBUF_24;
  wire B_6_IBUF_25;
  wire B_5_IBUF_26;
  wire B_4_IBUF_27;
  wire B_3_IBUF_28;
  wire B_2_IBUF_29;
  wire B_1_IBUF_30;
  wire B_0_IBUF_31;
  wire clk_BUFGP_32;
  wire rst_IBUF_33;
  wire init_IBUF_34;
  wire \control0/state_FSM_FFd1_115 ;
  wire w_reset;
  wire w_add;
  wire w_z;
  wire N0;
  wire clk_inv;
  wire \lsr0/_n0012_inv ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<0> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<1> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<2> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<3> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<4> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<5> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<6> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<7> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<8> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<9> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<10> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<11> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<12> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<13> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<14> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<15> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<16> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<17> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<18> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<19> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<20> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<21> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<22> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<23> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<24> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<25> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<26> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<27> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<28> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<29> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<30> ;
  wire \lsr0/s_A[31]_GND_3_o_mux_2_OUT<31> ;
  wire \rsr0/s_B[15]_in_B[15]_mux_2_OUT<0> ;
  wire \rsr0/s_B[15]_in_B[15]_mux_2_OUT<1> ;
  wire \rsr0/s_B[15]_in_B[15]_mux_2_OUT<2> ;
  wire \rsr0/s_B[15]_in_B[15]_mux_2_OUT<3> ;
  wire \rsr0/s_B[15]_in_B[15]_mux_2_OUT<4> ;
  wire \rsr0/s_B[15]_in_B[15]_mux_2_OUT<5> ;
  wire \rsr0/s_B[15]_in_B[15]_mux_2_OUT<6> ;
  wire \rsr0/s_B[15]_in_B[15]_mux_2_OUT<7> ;
  wire \rsr0/s_B[15]_in_B[15]_mux_2_OUT<8> ;
  wire \rsr0/s_B[15]_in_B[15]_mux_2_OUT<9> ;
  wire \rsr0/s_B[15]_in_B[15]_mux_2_OUT<10> ;
  wire \rsr0/s_B[15]_in_B[15]_mux_2_OUT<11> ;
  wire \rsr0/s_B[15]_in_B[15]_mux_2_OUT<12> ;
  wire \rsr0/s_B[15]_in_B[15]_mux_2_OUT<13> ;
  wire \rsr0/s_B[15]_in_B[15]_mux_2_OUT<14> ;
  wire \rsr0/s_B[15]_in_B[15]_mux_2_OUT<15> ;
  wire \control0/state_FSM_FFd1-In_269 ;
  wire \control0/state_FSM_FFd3-In ;
  wire \control0/_n0050_inv ;
  wire \control0/state[2]_count[3]_wide_mux_8_OUT<0> ;
  wire \control0/state[2]_count[3]_wide_mux_8_OUT<1> ;
  wire \control0/state[2]_count[3]_wide_mux_8_OUT<2> ;
  wire \control0/state[2]_count[3]_wide_mux_8_OUT<3> ;
  wire \control0/state_FSM_FFd3_276 ;
  wire \control0/state_FSM_FFd2_277 ;
  wire \comp0/tmp<15>1_279 ;
  wire N3;
  wire \acc0/pp_31_1_349 ;
  wire \acc0/pp_30_1_350 ;
  wire \acc0/pp_29_1_351 ;
  wire \acc0/pp_28_1_352 ;
  wire \acc0/pp_27_1_353 ;
  wire \acc0/pp_26_1_354 ;
  wire \acc0/pp_25_1_355 ;
  wire \acc0/pp_24_1_356 ;
  wire \acc0/pp_23_1_357 ;
  wire \acc0/pp_22_1_358 ;
  wire \acc0/pp_21_1_359 ;
  wire \acc0/pp_20_1_360 ;
  wire \acc0/pp_19_1_361 ;
  wire \acc0/pp_18_1_362 ;
  wire \acc0/pp_17_1_363 ;
  wire \acc0/pp_16_1_364 ;
  wire \acc0/pp_15_1_365 ;
  wire \acc0/pp_14_1_366 ;
  wire \acc0/pp_13_1_367 ;
  wire \acc0/pp_12_1_368 ;
  wire \acc0/pp_11_1_369 ;
  wire \acc0/pp_10_1_370 ;
  wire \acc0/pp_9_1_371 ;
  wire \acc0/pp_8_1_372 ;
  wire \acc0/pp_7_1_373 ;
  wire \acc0/pp_6_1_374 ;
  wire \acc0/pp_5_1_375 ;
  wire \acc0/pp_4_1_376 ;
  wire \acc0/pp_3_1_377 ;
  wire \acc0/pp_2_1_378 ;
  wire \acc0/pp_1_1_379 ;
  wire \acc0/pp_0_1_380 ;
  wire \control0/state_FSM_FFd1_1_381 ;
  wire [31 : 0] \lsr0/s_A ;
  wire [15 : 0] \rsr0/s_B ;
  wire [31 : 0] \acc0/pp ;
  wire [31 : 0] Result;
  wire [31 : 0] \acc0/Maccum_pp_lut ;
  wire [30 : 0] \acc0/Maccum_pp_cy ;
  wire [3 : 0] \control0/count ;
  wire [15 : 15] \comp0/tmp ;
  GND   XST_GND (
    .G(N0)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_0  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[0]),
    .R(w_reset),
    .Q(\acc0/pp [0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[1]),
    .R(w_reset),
    .Q(\acc0/pp [1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_2  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[2]),
    .R(w_reset),
    .Q(\acc0/pp [2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_3  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[3]),
    .R(w_reset),
    .Q(\acc0/pp [3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_4  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[4]),
    .R(w_reset),
    .Q(\acc0/pp [4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_5  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[5]),
    .R(w_reset),
    .Q(\acc0/pp [5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_6  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[6]),
    .R(w_reset),
    .Q(\acc0/pp [6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_7  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[7]),
    .R(w_reset),
    .Q(\acc0/pp [7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_8  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[8]),
    .R(w_reset),
    .Q(\acc0/pp [8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_9  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[9]),
    .R(w_reset),
    .Q(\acc0/pp [9])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_10  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[10]),
    .R(w_reset),
    .Q(\acc0/pp [10])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_11  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[11]),
    .R(w_reset),
    .Q(\acc0/pp [11])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_12  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[12]),
    .R(w_reset),
    .Q(\acc0/pp [12])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_13  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[13]),
    .R(w_reset),
    .Q(\acc0/pp [13])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_14  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[14]),
    .R(w_reset),
    .Q(\acc0/pp [14])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_15  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[15]),
    .R(w_reset),
    .Q(\acc0/pp [15])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_16  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[16]),
    .R(w_reset),
    .Q(\acc0/pp [16])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_17  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[17]),
    .R(w_reset),
    .Q(\acc0/pp [17])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_18  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[18]),
    .R(w_reset),
    .Q(\acc0/pp [18])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_19  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[19]),
    .R(w_reset),
    .Q(\acc0/pp [19])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_20  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[20]),
    .R(w_reset),
    .Q(\acc0/pp [20])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_21  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[21]),
    .R(w_reset),
    .Q(\acc0/pp [21])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_22  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[22]),
    .R(w_reset),
    .Q(\acc0/pp [22])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_23  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[23]),
    .R(w_reset),
    .Q(\acc0/pp [23])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_24  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[24]),
    .R(w_reset),
    .Q(\acc0/pp [24])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_25  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[25]),
    .R(w_reset),
    .Q(\acc0/pp [25])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_26  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[26]),
    .R(w_reset),
    .Q(\acc0/pp [26])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_27  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[27]),
    .R(w_reset),
    .Q(\acc0/pp [27])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_28  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[28]),
    .R(w_reset),
    .Q(\acc0/pp [28])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_29  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[29]),
    .R(w_reset),
    .Q(\acc0/pp [29])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_30  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[30]),
    .R(w_reset),
    .Q(\acc0/pp [30])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_31  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[31]),
    .R(w_reset),
    .Q(\acc0/pp [31])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<0>  (
    .I0(\acc0/pp [0]),
    .I1(\lsr0/s_A [0]),
    .O(\acc0/Maccum_pp_lut [0])
  );
  MUXCY   \acc0/Maccum_pp_cy<0>  (
    .CI(N0),
    .DI(\acc0/pp [0]),
    .S(\acc0/Maccum_pp_lut [0]),
    .O(\acc0/Maccum_pp_cy [0])
  );
  XORCY   \acc0/Maccum_pp_xor<0>  (
    .CI(N0),
    .LI(\acc0/Maccum_pp_lut [0]),
    .O(Result[0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<1>  (
    .I0(\acc0/pp [1]),
    .I1(\lsr0/s_A [1]),
    .O(\acc0/Maccum_pp_lut [1])
  );
  MUXCY   \acc0/Maccum_pp_cy<1>  (
    .CI(\acc0/Maccum_pp_cy [0]),
    .DI(\acc0/pp [1]),
    .S(\acc0/Maccum_pp_lut [1]),
    .O(\acc0/Maccum_pp_cy [1])
  );
  XORCY   \acc0/Maccum_pp_xor<1>  (
    .CI(\acc0/Maccum_pp_cy [0]),
    .LI(\acc0/Maccum_pp_lut [1]),
    .O(Result[1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<2>  (
    .I0(\acc0/pp [2]),
    .I1(\lsr0/s_A [2]),
    .O(\acc0/Maccum_pp_lut [2])
  );
  MUXCY   \acc0/Maccum_pp_cy<2>  (
    .CI(\acc0/Maccum_pp_cy [1]),
    .DI(\acc0/pp [2]),
    .S(\acc0/Maccum_pp_lut [2]),
    .O(\acc0/Maccum_pp_cy [2])
  );
  XORCY   \acc0/Maccum_pp_xor<2>  (
    .CI(\acc0/Maccum_pp_cy [1]),
    .LI(\acc0/Maccum_pp_lut [2]),
    .O(Result[2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<3>  (
    .I0(\acc0/pp [3]),
    .I1(\lsr0/s_A [3]),
    .O(\acc0/Maccum_pp_lut [3])
  );
  MUXCY   \acc0/Maccum_pp_cy<3>  (
    .CI(\acc0/Maccum_pp_cy [2]),
    .DI(\acc0/pp [3]),
    .S(\acc0/Maccum_pp_lut [3]),
    .O(\acc0/Maccum_pp_cy [3])
  );
  XORCY   \acc0/Maccum_pp_xor<3>  (
    .CI(\acc0/Maccum_pp_cy [2]),
    .LI(\acc0/Maccum_pp_lut [3]),
    .O(Result[3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<4>  (
    .I0(\acc0/pp [4]),
    .I1(\lsr0/s_A [4]),
    .O(\acc0/Maccum_pp_lut [4])
  );
  MUXCY   \acc0/Maccum_pp_cy<4>  (
    .CI(\acc0/Maccum_pp_cy [3]),
    .DI(\acc0/pp [4]),
    .S(\acc0/Maccum_pp_lut [4]),
    .O(\acc0/Maccum_pp_cy [4])
  );
  XORCY   \acc0/Maccum_pp_xor<4>  (
    .CI(\acc0/Maccum_pp_cy [3]),
    .LI(\acc0/Maccum_pp_lut [4]),
    .O(Result[4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<5>  (
    .I0(\acc0/pp [5]),
    .I1(\lsr0/s_A [5]),
    .O(\acc0/Maccum_pp_lut [5])
  );
  MUXCY   \acc0/Maccum_pp_cy<5>  (
    .CI(\acc0/Maccum_pp_cy [4]),
    .DI(\acc0/pp [5]),
    .S(\acc0/Maccum_pp_lut [5]),
    .O(\acc0/Maccum_pp_cy [5])
  );
  XORCY   \acc0/Maccum_pp_xor<5>  (
    .CI(\acc0/Maccum_pp_cy [4]),
    .LI(\acc0/Maccum_pp_lut [5]),
    .O(Result[5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<6>  (
    .I0(\acc0/pp [6]),
    .I1(\lsr0/s_A [6]),
    .O(\acc0/Maccum_pp_lut [6])
  );
  MUXCY   \acc0/Maccum_pp_cy<6>  (
    .CI(\acc0/Maccum_pp_cy [5]),
    .DI(\acc0/pp [6]),
    .S(\acc0/Maccum_pp_lut [6]),
    .O(\acc0/Maccum_pp_cy [6])
  );
  XORCY   \acc0/Maccum_pp_xor<6>  (
    .CI(\acc0/Maccum_pp_cy [5]),
    .LI(\acc0/Maccum_pp_lut [6]),
    .O(Result[6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<7>  (
    .I0(\acc0/pp [7]),
    .I1(\lsr0/s_A [7]),
    .O(\acc0/Maccum_pp_lut [7])
  );
  MUXCY   \acc0/Maccum_pp_cy<7>  (
    .CI(\acc0/Maccum_pp_cy [6]),
    .DI(\acc0/pp [7]),
    .S(\acc0/Maccum_pp_lut [7]),
    .O(\acc0/Maccum_pp_cy [7])
  );
  XORCY   \acc0/Maccum_pp_xor<7>  (
    .CI(\acc0/Maccum_pp_cy [6]),
    .LI(\acc0/Maccum_pp_lut [7]),
    .O(Result[7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<8>  (
    .I0(\acc0/pp [8]),
    .I1(\lsr0/s_A [8]),
    .O(\acc0/Maccum_pp_lut [8])
  );
  MUXCY   \acc0/Maccum_pp_cy<8>  (
    .CI(\acc0/Maccum_pp_cy [7]),
    .DI(\acc0/pp [8]),
    .S(\acc0/Maccum_pp_lut [8]),
    .O(\acc0/Maccum_pp_cy [8])
  );
  XORCY   \acc0/Maccum_pp_xor<8>  (
    .CI(\acc0/Maccum_pp_cy [7]),
    .LI(\acc0/Maccum_pp_lut [8]),
    .O(Result[8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<9>  (
    .I0(\acc0/pp [9]),
    .I1(\lsr0/s_A [9]),
    .O(\acc0/Maccum_pp_lut [9])
  );
  MUXCY   \acc0/Maccum_pp_cy<9>  (
    .CI(\acc0/Maccum_pp_cy [8]),
    .DI(\acc0/pp [9]),
    .S(\acc0/Maccum_pp_lut [9]),
    .O(\acc0/Maccum_pp_cy [9])
  );
  XORCY   \acc0/Maccum_pp_xor<9>  (
    .CI(\acc0/Maccum_pp_cy [8]),
    .LI(\acc0/Maccum_pp_lut [9]),
    .O(Result[9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<10>  (
    .I0(\acc0/pp [10]),
    .I1(\lsr0/s_A [10]),
    .O(\acc0/Maccum_pp_lut [10])
  );
  MUXCY   \acc0/Maccum_pp_cy<10>  (
    .CI(\acc0/Maccum_pp_cy [9]),
    .DI(\acc0/pp [10]),
    .S(\acc0/Maccum_pp_lut [10]),
    .O(\acc0/Maccum_pp_cy [10])
  );
  XORCY   \acc0/Maccum_pp_xor<10>  (
    .CI(\acc0/Maccum_pp_cy [9]),
    .LI(\acc0/Maccum_pp_lut [10]),
    .O(Result[10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<11>  (
    .I0(\acc0/pp [11]),
    .I1(\lsr0/s_A [11]),
    .O(\acc0/Maccum_pp_lut [11])
  );
  MUXCY   \acc0/Maccum_pp_cy<11>  (
    .CI(\acc0/Maccum_pp_cy [10]),
    .DI(\acc0/pp [11]),
    .S(\acc0/Maccum_pp_lut [11]),
    .O(\acc0/Maccum_pp_cy [11])
  );
  XORCY   \acc0/Maccum_pp_xor<11>  (
    .CI(\acc0/Maccum_pp_cy [10]),
    .LI(\acc0/Maccum_pp_lut [11]),
    .O(Result[11])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<12>  (
    .I0(\acc0/pp [12]),
    .I1(\lsr0/s_A [12]),
    .O(\acc0/Maccum_pp_lut [12])
  );
  MUXCY   \acc0/Maccum_pp_cy<12>  (
    .CI(\acc0/Maccum_pp_cy [11]),
    .DI(\acc0/pp [12]),
    .S(\acc0/Maccum_pp_lut [12]),
    .O(\acc0/Maccum_pp_cy [12])
  );
  XORCY   \acc0/Maccum_pp_xor<12>  (
    .CI(\acc0/Maccum_pp_cy [11]),
    .LI(\acc0/Maccum_pp_lut [12]),
    .O(Result[12])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<13>  (
    .I0(\acc0/pp [13]),
    .I1(\lsr0/s_A [13]),
    .O(\acc0/Maccum_pp_lut [13])
  );
  MUXCY   \acc0/Maccum_pp_cy<13>  (
    .CI(\acc0/Maccum_pp_cy [12]),
    .DI(\acc0/pp [13]),
    .S(\acc0/Maccum_pp_lut [13]),
    .O(\acc0/Maccum_pp_cy [13])
  );
  XORCY   \acc0/Maccum_pp_xor<13>  (
    .CI(\acc0/Maccum_pp_cy [12]),
    .LI(\acc0/Maccum_pp_lut [13]),
    .O(Result[13])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<14>  (
    .I0(\acc0/pp [14]),
    .I1(\lsr0/s_A [14]),
    .O(\acc0/Maccum_pp_lut [14])
  );
  MUXCY   \acc0/Maccum_pp_cy<14>  (
    .CI(\acc0/Maccum_pp_cy [13]),
    .DI(\acc0/pp [14]),
    .S(\acc0/Maccum_pp_lut [14]),
    .O(\acc0/Maccum_pp_cy [14])
  );
  XORCY   \acc0/Maccum_pp_xor<14>  (
    .CI(\acc0/Maccum_pp_cy [13]),
    .LI(\acc0/Maccum_pp_lut [14]),
    .O(Result[14])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<15>  (
    .I0(\acc0/pp [15]),
    .I1(\lsr0/s_A [15]),
    .O(\acc0/Maccum_pp_lut [15])
  );
  MUXCY   \acc0/Maccum_pp_cy<15>  (
    .CI(\acc0/Maccum_pp_cy [14]),
    .DI(\acc0/pp [15]),
    .S(\acc0/Maccum_pp_lut [15]),
    .O(\acc0/Maccum_pp_cy [15])
  );
  XORCY   \acc0/Maccum_pp_xor<15>  (
    .CI(\acc0/Maccum_pp_cy [14]),
    .LI(\acc0/Maccum_pp_lut [15]),
    .O(Result[15])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<16>  (
    .I0(\acc0/pp [16]),
    .I1(\lsr0/s_A [16]),
    .O(\acc0/Maccum_pp_lut [16])
  );
  MUXCY   \acc0/Maccum_pp_cy<16>  (
    .CI(\acc0/Maccum_pp_cy [15]),
    .DI(\acc0/pp [16]),
    .S(\acc0/Maccum_pp_lut [16]),
    .O(\acc0/Maccum_pp_cy [16])
  );
  XORCY   \acc0/Maccum_pp_xor<16>  (
    .CI(\acc0/Maccum_pp_cy [15]),
    .LI(\acc0/Maccum_pp_lut [16]),
    .O(Result[16])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<17>  (
    .I0(\acc0/pp [17]),
    .I1(\lsr0/s_A [17]),
    .O(\acc0/Maccum_pp_lut [17])
  );
  MUXCY   \acc0/Maccum_pp_cy<17>  (
    .CI(\acc0/Maccum_pp_cy [16]),
    .DI(\acc0/pp [17]),
    .S(\acc0/Maccum_pp_lut [17]),
    .O(\acc0/Maccum_pp_cy [17])
  );
  XORCY   \acc0/Maccum_pp_xor<17>  (
    .CI(\acc0/Maccum_pp_cy [16]),
    .LI(\acc0/Maccum_pp_lut [17]),
    .O(Result[17])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<18>  (
    .I0(\acc0/pp [18]),
    .I1(\lsr0/s_A [18]),
    .O(\acc0/Maccum_pp_lut [18])
  );
  MUXCY   \acc0/Maccum_pp_cy<18>  (
    .CI(\acc0/Maccum_pp_cy [17]),
    .DI(\acc0/pp [18]),
    .S(\acc0/Maccum_pp_lut [18]),
    .O(\acc0/Maccum_pp_cy [18])
  );
  XORCY   \acc0/Maccum_pp_xor<18>  (
    .CI(\acc0/Maccum_pp_cy [17]),
    .LI(\acc0/Maccum_pp_lut [18]),
    .O(Result[18])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<19>  (
    .I0(\acc0/pp [19]),
    .I1(\lsr0/s_A [19]),
    .O(\acc0/Maccum_pp_lut [19])
  );
  MUXCY   \acc0/Maccum_pp_cy<19>  (
    .CI(\acc0/Maccum_pp_cy [18]),
    .DI(\acc0/pp [19]),
    .S(\acc0/Maccum_pp_lut [19]),
    .O(\acc0/Maccum_pp_cy [19])
  );
  XORCY   \acc0/Maccum_pp_xor<19>  (
    .CI(\acc0/Maccum_pp_cy [18]),
    .LI(\acc0/Maccum_pp_lut [19]),
    .O(Result[19])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<20>  (
    .I0(\acc0/pp [20]),
    .I1(\lsr0/s_A [20]),
    .O(\acc0/Maccum_pp_lut [20])
  );
  MUXCY   \acc0/Maccum_pp_cy<20>  (
    .CI(\acc0/Maccum_pp_cy [19]),
    .DI(\acc0/pp [20]),
    .S(\acc0/Maccum_pp_lut [20]),
    .O(\acc0/Maccum_pp_cy [20])
  );
  XORCY   \acc0/Maccum_pp_xor<20>  (
    .CI(\acc0/Maccum_pp_cy [19]),
    .LI(\acc0/Maccum_pp_lut [20]),
    .O(Result[20])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<21>  (
    .I0(\acc0/pp [21]),
    .I1(\lsr0/s_A [21]),
    .O(\acc0/Maccum_pp_lut [21])
  );
  MUXCY   \acc0/Maccum_pp_cy<21>  (
    .CI(\acc0/Maccum_pp_cy [20]),
    .DI(\acc0/pp [21]),
    .S(\acc0/Maccum_pp_lut [21]),
    .O(\acc0/Maccum_pp_cy [21])
  );
  XORCY   \acc0/Maccum_pp_xor<21>  (
    .CI(\acc0/Maccum_pp_cy [20]),
    .LI(\acc0/Maccum_pp_lut [21]),
    .O(Result[21])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<22>  (
    .I0(\acc0/pp [22]),
    .I1(\lsr0/s_A [22]),
    .O(\acc0/Maccum_pp_lut [22])
  );
  MUXCY   \acc0/Maccum_pp_cy<22>  (
    .CI(\acc0/Maccum_pp_cy [21]),
    .DI(\acc0/pp [22]),
    .S(\acc0/Maccum_pp_lut [22]),
    .O(\acc0/Maccum_pp_cy [22])
  );
  XORCY   \acc0/Maccum_pp_xor<22>  (
    .CI(\acc0/Maccum_pp_cy [21]),
    .LI(\acc0/Maccum_pp_lut [22]),
    .O(Result[22])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<23>  (
    .I0(\acc0/pp [23]),
    .I1(\lsr0/s_A [23]),
    .O(\acc0/Maccum_pp_lut [23])
  );
  MUXCY   \acc0/Maccum_pp_cy<23>  (
    .CI(\acc0/Maccum_pp_cy [22]),
    .DI(\acc0/pp [23]),
    .S(\acc0/Maccum_pp_lut [23]),
    .O(\acc0/Maccum_pp_cy [23])
  );
  XORCY   \acc0/Maccum_pp_xor<23>  (
    .CI(\acc0/Maccum_pp_cy [22]),
    .LI(\acc0/Maccum_pp_lut [23]),
    .O(Result[23])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<24>  (
    .I0(\acc0/pp [24]),
    .I1(\lsr0/s_A [24]),
    .O(\acc0/Maccum_pp_lut [24])
  );
  MUXCY   \acc0/Maccum_pp_cy<24>  (
    .CI(\acc0/Maccum_pp_cy [23]),
    .DI(\acc0/pp [24]),
    .S(\acc0/Maccum_pp_lut [24]),
    .O(\acc0/Maccum_pp_cy [24])
  );
  XORCY   \acc0/Maccum_pp_xor<24>  (
    .CI(\acc0/Maccum_pp_cy [23]),
    .LI(\acc0/Maccum_pp_lut [24]),
    .O(Result[24])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<25>  (
    .I0(\acc0/pp [25]),
    .I1(\lsr0/s_A [25]),
    .O(\acc0/Maccum_pp_lut [25])
  );
  MUXCY   \acc0/Maccum_pp_cy<25>  (
    .CI(\acc0/Maccum_pp_cy [24]),
    .DI(\acc0/pp [25]),
    .S(\acc0/Maccum_pp_lut [25]),
    .O(\acc0/Maccum_pp_cy [25])
  );
  XORCY   \acc0/Maccum_pp_xor<25>  (
    .CI(\acc0/Maccum_pp_cy [24]),
    .LI(\acc0/Maccum_pp_lut [25]),
    .O(Result[25])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<26>  (
    .I0(\acc0/pp [26]),
    .I1(\lsr0/s_A [26]),
    .O(\acc0/Maccum_pp_lut [26])
  );
  MUXCY   \acc0/Maccum_pp_cy<26>  (
    .CI(\acc0/Maccum_pp_cy [25]),
    .DI(\acc0/pp [26]),
    .S(\acc0/Maccum_pp_lut [26]),
    .O(\acc0/Maccum_pp_cy [26])
  );
  XORCY   \acc0/Maccum_pp_xor<26>  (
    .CI(\acc0/Maccum_pp_cy [25]),
    .LI(\acc0/Maccum_pp_lut [26]),
    .O(Result[26])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<27>  (
    .I0(\acc0/pp [27]),
    .I1(\lsr0/s_A [27]),
    .O(\acc0/Maccum_pp_lut [27])
  );
  MUXCY   \acc0/Maccum_pp_cy<27>  (
    .CI(\acc0/Maccum_pp_cy [26]),
    .DI(\acc0/pp [27]),
    .S(\acc0/Maccum_pp_lut [27]),
    .O(\acc0/Maccum_pp_cy [27])
  );
  XORCY   \acc0/Maccum_pp_xor<27>  (
    .CI(\acc0/Maccum_pp_cy [26]),
    .LI(\acc0/Maccum_pp_lut [27]),
    .O(Result[27])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<28>  (
    .I0(\acc0/pp [28]),
    .I1(\lsr0/s_A [28]),
    .O(\acc0/Maccum_pp_lut [28])
  );
  MUXCY   \acc0/Maccum_pp_cy<28>  (
    .CI(\acc0/Maccum_pp_cy [27]),
    .DI(\acc0/pp [28]),
    .S(\acc0/Maccum_pp_lut [28]),
    .O(\acc0/Maccum_pp_cy [28])
  );
  XORCY   \acc0/Maccum_pp_xor<28>  (
    .CI(\acc0/Maccum_pp_cy [27]),
    .LI(\acc0/Maccum_pp_lut [28]),
    .O(Result[28])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<29>  (
    .I0(\acc0/pp [29]),
    .I1(\lsr0/s_A [29]),
    .O(\acc0/Maccum_pp_lut [29])
  );
  MUXCY   \acc0/Maccum_pp_cy<29>  (
    .CI(\acc0/Maccum_pp_cy [28]),
    .DI(\acc0/pp [29]),
    .S(\acc0/Maccum_pp_lut [29]),
    .O(\acc0/Maccum_pp_cy [29])
  );
  XORCY   \acc0/Maccum_pp_xor<29>  (
    .CI(\acc0/Maccum_pp_cy [28]),
    .LI(\acc0/Maccum_pp_lut [29]),
    .O(Result[29])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<30>  (
    .I0(\acc0/pp [30]),
    .I1(\lsr0/s_A [30]),
    .O(\acc0/Maccum_pp_lut [30])
  );
  MUXCY   \acc0/Maccum_pp_cy<30>  (
    .CI(\acc0/Maccum_pp_cy [29]),
    .DI(\acc0/pp [30]),
    .S(\acc0/Maccum_pp_lut [30]),
    .O(\acc0/Maccum_pp_cy [30])
  );
  XORCY   \acc0/Maccum_pp_xor<30>  (
    .CI(\acc0/Maccum_pp_cy [29]),
    .LI(\acc0/Maccum_pp_lut [30]),
    .O(Result[30])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \acc0/Maccum_pp_lut<31>  (
    .I0(\acc0/pp [31]),
    .I1(\lsr0/s_A [31]),
    .O(\acc0/Maccum_pp_lut [31])
  );
  XORCY   \acc0/Maccum_pp_xor<31>  (
    .CI(\acc0/Maccum_pp_cy [30]),
    .LI(\acc0/Maccum_pp_lut [31]),
    .O(Result[31])
  );
  FDE_1   \lsr0/s_A_31  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<31> ),
    .Q(\lsr0/s_A [31])
  );
  FDE_1   \lsr0/s_A_30  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<30> ),
    .Q(\lsr0/s_A [30])
  );
  FDE_1   \lsr0/s_A_29  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<29> ),
    .Q(\lsr0/s_A [29])
  );
  FDE_1   \lsr0/s_A_28  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<28> ),
    .Q(\lsr0/s_A [28])
  );
  FDE_1   \lsr0/s_A_27  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<27> ),
    .Q(\lsr0/s_A [27])
  );
  FDE_1   \lsr0/s_A_26  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<26> ),
    .Q(\lsr0/s_A [26])
  );
  FDE_1   \lsr0/s_A_25  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<25> ),
    .Q(\lsr0/s_A [25])
  );
  FDE_1   \lsr0/s_A_24  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<24> ),
    .Q(\lsr0/s_A [24])
  );
  FDE_1   \lsr0/s_A_23  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<23> ),
    .Q(\lsr0/s_A [23])
  );
  FDE_1   \lsr0/s_A_22  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<22> ),
    .Q(\lsr0/s_A [22])
  );
  FDE_1   \lsr0/s_A_21  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<21> ),
    .Q(\lsr0/s_A [21])
  );
  FDE_1   \lsr0/s_A_20  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<20> ),
    .Q(\lsr0/s_A [20])
  );
  FDE_1   \lsr0/s_A_19  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<19> ),
    .Q(\lsr0/s_A [19])
  );
  FDE_1   \lsr0/s_A_18  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<18> ),
    .Q(\lsr0/s_A [18])
  );
  FDE_1   \lsr0/s_A_17  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<17> ),
    .Q(\lsr0/s_A [17])
  );
  FDE_1   \lsr0/s_A_16  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<16> ),
    .Q(\lsr0/s_A [16])
  );
  FDE_1   \lsr0/s_A_15  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<15> ),
    .Q(\lsr0/s_A [15])
  );
  FDE_1   \lsr0/s_A_14  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<14> ),
    .Q(\lsr0/s_A [14])
  );
  FDE_1   \lsr0/s_A_13  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<13> ),
    .Q(\lsr0/s_A [13])
  );
  FDE_1   \lsr0/s_A_12  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<12> ),
    .Q(\lsr0/s_A [12])
  );
  FDE_1   \lsr0/s_A_11  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<11> ),
    .Q(\lsr0/s_A [11])
  );
  FDE_1   \lsr0/s_A_10  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<10> ),
    .Q(\lsr0/s_A [10])
  );
  FDE_1   \lsr0/s_A_9  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<9> ),
    .Q(\lsr0/s_A [9])
  );
  FDE_1   \lsr0/s_A_8  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<8> ),
    .Q(\lsr0/s_A [8])
  );
  FDE_1   \lsr0/s_A_7  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<7> ),
    .Q(\lsr0/s_A [7])
  );
  FDE_1   \lsr0/s_A_6  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<6> ),
    .Q(\lsr0/s_A [6])
  );
  FDE_1   \lsr0/s_A_5  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<5> ),
    .Q(\lsr0/s_A [5])
  );
  FDE_1   \lsr0/s_A_4  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<4> ),
    .Q(\lsr0/s_A [4])
  );
  FDE_1   \lsr0/s_A_3  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<3> ),
    .Q(\lsr0/s_A [3])
  );
  FDE_1   \lsr0/s_A_2  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<2> ),
    .Q(\lsr0/s_A [2])
  );
  FDE_1   \lsr0/s_A_1  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<1> ),
    .Q(\lsr0/s_A [1])
  );
  FDE_1   \lsr0/s_A_0  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<0> ),
    .Q(\lsr0/s_A [0])
  );
  FDE_1   \rsr0/s_B_15  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<15> ),
    .Q(\rsr0/s_B [15])
  );
  FDE_1   \rsr0/s_B_14  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<14> ),
    .Q(\rsr0/s_B [14])
  );
  FDE_1   \rsr0/s_B_13  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<13> ),
    .Q(\rsr0/s_B [13])
  );
  FDE_1   \rsr0/s_B_12  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<12> ),
    .Q(\rsr0/s_B [12])
  );
  FDE_1   \rsr0/s_B_11  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<11> ),
    .Q(\rsr0/s_B [11])
  );
  FDE_1   \rsr0/s_B_10  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<10> ),
    .Q(\rsr0/s_B [10])
  );
  FDE_1   \rsr0/s_B_9  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<9> ),
    .Q(\rsr0/s_B [9])
  );
  FDE_1   \rsr0/s_B_8  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<8> ),
    .Q(\rsr0/s_B [8])
  );
  FDE_1   \rsr0/s_B_7  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<7> ),
    .Q(\rsr0/s_B [7])
  );
  FDE_1   \rsr0/s_B_6  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<6> ),
    .Q(\rsr0/s_B [6])
  );
  FDE_1   \rsr0/s_B_5  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<5> ),
    .Q(\rsr0/s_B [5])
  );
  FDE_1   \rsr0/s_B_4  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<4> ),
    .Q(\rsr0/s_B [4])
  );
  FDE_1   \rsr0/s_B_3  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<3> ),
    .Q(\rsr0/s_B [3])
  );
  FDE_1   \rsr0/s_B_2  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<2> ),
    .Q(\rsr0/s_B [2])
  );
  FDE_1   \rsr0/s_B_1  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<1> ),
    .Q(\rsr0/s_B [1])
  );
  FDE_1   \rsr0/s_B_0  (
    .C(clk_BUFGP_32),
    .CE(\lsr0/_n0012_inv ),
    .D(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<0> ),
    .Q(\rsr0/s_B [0])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \control0/state_FSM_FFd2  (
    .C(clk_BUFGP_32),
    .D(\control0/state_FSM_FFd3_276 ),
    .R(rst_IBUF_33),
    .Q(\control0/state_FSM_FFd2_277 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \control0/state_FSM_FFd3  (
    .C(clk_BUFGP_32),
    .D(\control0/state_FSM_FFd3-In ),
    .R(rst_IBUF_33),
    .Q(\control0/state_FSM_FFd3_276 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \control0/state_FSM_FFd1  (
    .C(clk_BUFGP_32),
    .D(\control0/state_FSM_FFd1-In_269 ),
    .R(rst_IBUF_33),
    .Q(\control0/state_FSM_FFd1_115 )
  );
  FDE   \control0/count_3  (
    .C(clk_BUFGP_32),
    .CE(\control0/_n0050_inv ),
    .D(\control0/state[2]_count[3]_wide_mux_8_OUT<3> ),
    .Q(\control0/count [3])
  );
  FDE   \control0/count_2  (
    .C(clk_BUFGP_32),
    .CE(\control0/_n0050_inv ),
    .D(\control0/state[2]_count[3]_wide_mux_8_OUT<2> ),
    .Q(\control0/count [2])
  );
  FDE   \control0/count_1  (
    .C(clk_BUFGP_32),
    .CE(\control0/_n0050_inv ),
    .D(\control0/state[2]_count[3]_wide_mux_8_OUT<1> ),
    .Q(\control0/count [1])
  );
  FDE   \control0/count_0  (
    .C(clk_BUFGP_32),
    .CE(\control0/_n0050_inv ),
    .D(\control0/state[2]_count[3]_wide_mux_8_OUT<0> ),
    .Q(\control0/count [0])
  );
  LUT5 #(
    .INIT ( 32'h28888888 ))
  \control0/Mmux_state[2]_count[3]_wide_mux_8_OUT41  (
    .I0(\control0/state_FSM_FFd1_115 ),
    .I1(\control0/count [3]),
    .I2(\control0/count [0]),
    .I3(\control0/count [1]),
    .I4(\control0/count [2]),
    .O(\control0/state[2]_count[3]_wide_mux_8_OUT<3> )
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  \control0/Mmux_state[2]_count[3]_wide_mux_8_OUT21  (
    .I0(\control0/state_FSM_FFd1_115 ),
    .I1(\control0/count [0]),
    .I2(\control0/count [1]),
    .O(\control0/state[2]_count[3]_wide_mux_8_OUT<1> )
  );
  LUT6 #(
    .INIT ( 64'h303200023C3E0C0E ))
  \control0/state_FSM_FFd3-In1  (
    .I0(init_IBUF_34),
    .I1(\control0/state_FSM_FFd2_277 ),
    .I2(\control0/state_FSM_FFd3_276 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(\rsr0/s_B [0]),
    .I5(w_z),
    .O(\control0/state_FSM_FFd3-In )
  );
  LUT4 #(
    .INIT ( 16'h2888 ))
  \control0/Mmux_state[2]_count[3]_wide_mux_8_OUT31  (
    .I0(\control0/state_FSM_FFd1_115 ),
    .I1(\control0/count [2]),
    .I2(\control0/count [0]),
    .I3(\control0/count [1]),
    .O(\control0/state[2]_count[3]_wide_mux_8_OUT<2> )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \control0/Mmux_state[2]_count[3]_wide_mux_8_OUT11  (
    .I0(\control0/count [0]),
    .I1(\control0/state_FSM_FFd1_115 ),
    .O(\control0/state[2]_count[3]_wide_mux_8_OUT<0> )
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  \control0/state__n0059<2>1  (
    .I0(\control0/state_FSM_FFd3_276 ),
    .I1(\control0/state_FSM_FFd2_277 ),
    .I2(\control0/state_FSM_FFd1_115 ),
    .O(w_reset)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \control0/state__n0059<3>1  (
    .I0(\control0/state_FSM_FFd3_276 ),
    .I1(\control0/state_FSM_FFd2_277 ),
    .O(w_add)
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  \control0/_n0050_inv1  (
    .I0(rst_IBUF_33),
    .I1(\control0/state_FSM_FFd2_277 ),
    .I2(\control0/state_FSM_FFd3_276 ),
    .O(\control0/_n0050_inv )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \comp0/tmp<15>1  (
    .I0(\rsr0/s_B [1]),
    .I1(\rsr0/s_B [0]),
    .I2(\rsr0/s_B [2]),
    .I3(\rsr0/s_B [3]),
    .I4(\rsr0/s_B [4]),
    .I5(\rsr0/s_B [5]),
    .O(\comp0/tmp [15])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \comp0/tmp<15>2  (
    .I0(\rsr0/s_B [7]),
    .I1(\rsr0/s_B [6]),
    .I2(\rsr0/s_B [8]),
    .I3(\rsr0/s_B [9]),
    .I4(\rsr0/s_B [10]),
    .I5(\rsr0/s_B [11]),
    .O(\comp0/tmp<15>1_279 )
  );
  LUT6 #(
    .INIT ( 64'h0001000000000000 ))
  \comp0/tmp<15>3  (
    .I0(\rsr0/s_B [15]),
    .I1(\rsr0/s_B [14]),
    .I2(\rsr0/s_B [12]),
    .I3(\rsr0/s_B [13]),
    .I4(\comp0/tmp [15]),
    .I5(\comp0/tmp<15>1_279 ),
    .O(w_z)
  );
  LUT3 #(
    .INIT ( 8'h81 ))
  \control0/state_FSM_FFd1-In_SW0  (
    .I0(\control0/count [2]),
    .I1(\control0/count [1]),
    .I2(\control0/count [0]),
    .O(N3)
  );
  LUT6 #(
    .INIT ( 64'h8AFF8A8A8A8A8A8A ))
  \control0/state_FSM_FFd1-In  (
    .I0(\control0/state_FSM_FFd1_115 ),
    .I1(N3),
    .I2(\control0/count [3]),
    .I3(\control0/state_FSM_FFd3_276 ),
    .I4(\control0/state_FSM_FFd2_277 ),
    .I5(w_z),
    .O(\control0/state_FSM_FFd1-In_269 )
  );
  IBUF   A_15_IBUF (
    .I(A[15]),
    .O(A_15_IBUF_0)
  );
  IBUF   A_14_IBUF (
    .I(A[14]),
    .O(A_14_IBUF_1)
  );
  IBUF   A_13_IBUF (
    .I(A[13]),
    .O(A_13_IBUF_2)
  );
  IBUF   A_12_IBUF (
    .I(A[12]),
    .O(A_12_IBUF_3)
  );
  IBUF   A_11_IBUF (
    .I(A[11]),
    .O(A_11_IBUF_4)
  );
  IBUF   A_10_IBUF (
    .I(A[10]),
    .O(A_10_IBUF_5)
  );
  IBUF   A_9_IBUF (
    .I(A[9]),
    .O(A_9_IBUF_6)
  );
  IBUF   A_8_IBUF (
    .I(A[8]),
    .O(A_8_IBUF_7)
  );
  IBUF   A_7_IBUF (
    .I(A[7]),
    .O(A_7_IBUF_8)
  );
  IBUF   A_6_IBUF (
    .I(A[6]),
    .O(A_6_IBUF_9)
  );
  IBUF   A_5_IBUF (
    .I(A[5]),
    .O(A_5_IBUF_10)
  );
  IBUF   A_4_IBUF (
    .I(A[4]),
    .O(A_4_IBUF_11)
  );
  IBUF   A_3_IBUF (
    .I(A[3]),
    .O(A_3_IBUF_12)
  );
  IBUF   A_2_IBUF (
    .I(A[2]),
    .O(A_2_IBUF_13)
  );
  IBUF   A_1_IBUF (
    .I(A[1]),
    .O(A_1_IBUF_14)
  );
  IBUF   A_0_IBUF (
    .I(A[0]),
    .O(A_0_IBUF_15)
  );
  IBUF   B_15_IBUF (
    .I(B[15]),
    .O(B_15_IBUF_16)
  );
  IBUF   B_14_IBUF (
    .I(B[14]),
    .O(B_14_IBUF_17)
  );
  IBUF   B_13_IBUF (
    .I(B[13]),
    .O(B_13_IBUF_18)
  );
  IBUF   B_12_IBUF (
    .I(B[12]),
    .O(B_12_IBUF_19)
  );
  IBUF   B_11_IBUF (
    .I(B[11]),
    .O(B_11_IBUF_20)
  );
  IBUF   B_10_IBUF (
    .I(B[10]),
    .O(B_10_IBUF_21)
  );
  IBUF   B_9_IBUF (
    .I(B[9]),
    .O(B_9_IBUF_22)
  );
  IBUF   B_8_IBUF (
    .I(B[8]),
    .O(B_8_IBUF_23)
  );
  IBUF   B_7_IBUF (
    .I(B[7]),
    .O(B_7_IBUF_24)
  );
  IBUF   B_6_IBUF (
    .I(B[6]),
    .O(B_6_IBUF_25)
  );
  IBUF   B_5_IBUF (
    .I(B[5]),
    .O(B_5_IBUF_26)
  );
  IBUF   B_4_IBUF (
    .I(B[4]),
    .O(B_4_IBUF_27)
  );
  IBUF   B_3_IBUF (
    .I(B[3]),
    .O(B_3_IBUF_28)
  );
  IBUF   B_2_IBUF (
    .I(B[2]),
    .O(B_2_IBUF_29)
  );
  IBUF   B_1_IBUF (
    .I(B[1]),
    .O(B_1_IBUF_30)
  );
  IBUF   B_0_IBUF (
    .I(B[0]),
    .O(B_0_IBUF_31)
  );
  IBUF   rst_IBUF (
    .I(rst),
    .O(rst_IBUF_33)
  );
  IBUF   init_IBUF (
    .I(init),
    .O(init_IBUF_34)
  );
  OBUF   pp_31_OBUF (
    .I(\acc0/pp_31_1_349 ),
    .O(pp[31])
  );
  OBUF   pp_30_OBUF (
    .I(\acc0/pp_30_1_350 ),
    .O(pp[30])
  );
  OBUF   pp_29_OBUF (
    .I(\acc0/pp_29_1_351 ),
    .O(pp[29])
  );
  OBUF   pp_28_OBUF (
    .I(\acc0/pp_28_1_352 ),
    .O(pp[28])
  );
  OBUF   pp_27_OBUF (
    .I(\acc0/pp_27_1_353 ),
    .O(pp[27])
  );
  OBUF   pp_26_OBUF (
    .I(\acc0/pp_26_1_354 ),
    .O(pp[26])
  );
  OBUF   pp_25_OBUF (
    .I(\acc0/pp_25_1_355 ),
    .O(pp[25])
  );
  OBUF   pp_24_OBUF (
    .I(\acc0/pp_24_1_356 ),
    .O(pp[24])
  );
  OBUF   pp_23_OBUF (
    .I(\acc0/pp_23_1_357 ),
    .O(pp[23])
  );
  OBUF   pp_22_OBUF (
    .I(\acc0/pp_22_1_358 ),
    .O(pp[22])
  );
  OBUF   pp_21_OBUF (
    .I(\acc0/pp_21_1_359 ),
    .O(pp[21])
  );
  OBUF   pp_20_OBUF (
    .I(\acc0/pp_20_1_360 ),
    .O(pp[20])
  );
  OBUF   pp_19_OBUF (
    .I(\acc0/pp_19_1_361 ),
    .O(pp[19])
  );
  OBUF   pp_18_OBUF (
    .I(\acc0/pp_18_1_362 ),
    .O(pp[18])
  );
  OBUF   pp_17_OBUF (
    .I(\acc0/pp_17_1_363 ),
    .O(pp[17])
  );
  OBUF   pp_16_OBUF (
    .I(\acc0/pp_16_1_364 ),
    .O(pp[16])
  );
  OBUF   pp_15_OBUF (
    .I(\acc0/pp_15_1_365 ),
    .O(pp[15])
  );
  OBUF   pp_14_OBUF (
    .I(\acc0/pp_14_1_366 ),
    .O(pp[14])
  );
  OBUF   pp_13_OBUF (
    .I(\acc0/pp_13_1_367 ),
    .O(pp[13])
  );
  OBUF   pp_12_OBUF (
    .I(\acc0/pp_12_1_368 ),
    .O(pp[12])
  );
  OBUF   pp_11_OBUF (
    .I(\acc0/pp_11_1_369 ),
    .O(pp[11])
  );
  OBUF   pp_10_OBUF (
    .I(\acc0/pp_10_1_370 ),
    .O(pp[10])
  );
  OBUF   pp_9_OBUF (
    .I(\acc0/pp_9_1_371 ),
    .O(pp[9])
  );
  OBUF   pp_8_OBUF (
    .I(\acc0/pp_8_1_372 ),
    .O(pp[8])
  );
  OBUF   pp_7_OBUF (
    .I(\acc0/pp_7_1_373 ),
    .O(pp[7])
  );
  OBUF   pp_6_OBUF (
    .I(\acc0/pp_6_1_374 ),
    .O(pp[6])
  );
  OBUF   pp_5_OBUF (
    .I(\acc0/pp_5_1_375 ),
    .O(pp[5])
  );
  OBUF   pp_4_OBUF (
    .I(\acc0/pp_4_1_376 ),
    .O(pp[4])
  );
  OBUF   pp_3_OBUF (
    .I(\acc0/pp_3_1_377 ),
    .O(pp[3])
  );
  OBUF   pp_2_OBUF (
    .I(\acc0/pp_2_1_378 ),
    .O(pp[2])
  );
  OBUF   pp_1_OBUF (
    .I(\acc0/pp_1_1_379 ),
    .O(pp[1])
  );
  OBUF   pp_0_OBUF (
    .I(\acc0/pp_0_1_380 ),
    .O(pp[0])
  );
  OBUF   done_OBUF (
    .I(\control0/state_FSM_FFd1_1_381 ),
    .O(done)
  );
  LUT4 #(
    .INIT ( 16'h0002 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT110  (
    .I0(A_0_IBUF_15),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<0> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT210  (
    .I0(\lsr0/s_A [9]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(A_10_IBUF_5),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<10> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT33  (
    .I0(\lsr0/s_A [10]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(A_11_IBUF_4),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<11> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT41  (
    .I0(\lsr0/s_A [11]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(A_12_IBUF_3),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<12> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT51  (
    .I0(\lsr0/s_A [12]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(A_13_IBUF_2),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<13> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT61  (
    .I0(\lsr0/s_A [13]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(A_14_IBUF_1),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<14> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT71  (
    .I0(\lsr0/s_A [14]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(A_15_IBUF_0),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<15> )
  );
  LUT4 #(
    .INIT ( 16'hAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT81  (
    .I0(\lsr0/s_A [15]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<16> )
  );
  LUT4 #(
    .INIT ( 16'hAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT91  (
    .I0(\lsr0/s_A [16]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<17> )
  );
  LUT4 #(
    .INIT ( 16'hAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT101  (
    .I0(\lsr0/s_A [17]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<18> )
  );
  LUT4 #(
    .INIT ( 16'hAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT111  (
    .I0(\lsr0/s_A [18]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<19> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT121  (
    .I0(\lsr0/s_A [0]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(A_1_IBUF_14),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<1> )
  );
  LUT4 #(
    .INIT ( 16'hAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT131  (
    .I0(\lsr0/s_A [19]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<20> )
  );
  LUT4 #(
    .INIT ( 16'hAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT141  (
    .I0(\lsr0/s_A [20]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<21> )
  );
  LUT4 #(
    .INIT ( 16'hAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT151  (
    .I0(\lsr0/s_A [21]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<22> )
  );
  LUT4 #(
    .INIT ( 16'hAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT161  (
    .I0(\lsr0/s_A [22]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<23> )
  );
  LUT4 #(
    .INIT ( 16'hAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT171  (
    .I0(\lsr0/s_A [23]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<24> )
  );
  LUT4 #(
    .INIT ( 16'hAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT181  (
    .I0(\lsr0/s_A [24]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<25> )
  );
  LUT4 #(
    .INIT ( 16'hAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT191  (
    .I0(\lsr0/s_A [25]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<26> )
  );
  LUT4 #(
    .INIT ( 16'hAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT201  (
    .I0(\lsr0/s_A [26]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<27> )
  );
  LUT4 #(
    .INIT ( 16'hAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT211  (
    .I0(\lsr0/s_A [27]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<28> )
  );
  LUT4 #(
    .INIT ( 16'hAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT221  (
    .I0(\lsr0/s_A [28]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<29> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT231  (
    .I0(\lsr0/s_A [1]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(A_2_IBUF_13),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<2> )
  );
  LUT4 #(
    .INIT ( 16'hAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT241  (
    .I0(\lsr0/s_A [29]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<30> )
  );
  LUT4 #(
    .INIT ( 16'hAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT251  (
    .I0(\lsr0/s_A [30]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<31> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT261  (
    .I0(\lsr0/s_A [2]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(A_3_IBUF_12),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<3> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT271  (
    .I0(\lsr0/s_A [3]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(A_4_IBUF_11),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<4> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT281  (
    .I0(\lsr0/s_A [4]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(A_5_IBUF_10),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<5> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT291  (
    .I0(\lsr0/s_A [5]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(A_6_IBUF_9),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<6> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT301  (
    .I0(\lsr0/s_A [6]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(A_7_IBUF_8),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<7> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT311  (
    .I0(\lsr0/s_A [7]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(A_8_IBUF_7),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<8> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \lsr0/Mmux_s_A[31]_GND_3_o_mux_2_OUT321  (
    .I0(\lsr0/s_A [8]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(A_9_IBUF_6),
    .O(\lsr0/s_A[31]_GND_3_o_mux_2_OUT<9> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \rsr0/mux1511  (
    .I0(\rsr0/s_B [10]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(B_9_IBUF_22),
    .O(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<9> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \rsr0/mux1411  (
    .I0(\rsr0/s_B [9]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(B_8_IBUF_23),
    .O(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<8> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \rsr0/mux1311  (
    .I0(\rsr0/s_B [8]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(B_7_IBUF_24),
    .O(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<7> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \rsr0/mux1211  (
    .I0(\rsr0/s_B [7]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(B_6_IBUF_25),
    .O(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<6> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \rsr0/mux11111  (
    .I0(\rsr0/s_B [6]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(B_5_IBUF_26),
    .O(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<5> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \rsr0/mux1011  (
    .I0(\rsr0/s_B [5]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(B_4_IBUF_27),
    .O(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<4> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \rsr0/mux911  (
    .I0(\rsr0/s_B [4]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(B_3_IBUF_28),
    .O(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<3> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \rsr0/mux811  (
    .I0(\rsr0/s_B [3]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(B_2_IBUF_29),
    .O(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<2> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \rsr0/mux711  (
    .I0(\rsr0/s_B [2]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(B_1_IBUF_30),
    .O(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<1> )
  );
  LUT4 #(
    .INIT ( 16'h0002 ))
  \rsr0/mux611  (
    .I0(B_15_IBUF_16),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .O(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<15> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \rsr0/mux511  (
    .I0(\rsr0/s_B [15]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(B_14_IBUF_17),
    .O(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<14> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \rsr0/mux411  (
    .I0(\rsr0/s_B [14]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(B_13_IBUF_18),
    .O(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<13> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \rsr0/mux311  (
    .I0(\rsr0/s_B [13]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(B_12_IBUF_19),
    .O(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<12> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \rsr0/mux211  (
    .I0(\rsr0/s_B [12]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(B_11_IBUF_20),
    .O(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<11> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \rsr0/mux1111  (
    .I0(\rsr0/s_B [11]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(B_10_IBUF_21),
    .O(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<10> )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \rsr0/mux161  (
    .I0(\rsr0/s_B [1]),
    .I1(\control0/state_FSM_FFd3_276 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .I3(\control0/state_FSM_FFd1_115 ),
    .I4(B_0_IBUF_31),
    .O(\rsr0/s_B[15]_in_B[15]_mux_2_OUT<0> )
  );
  LUT3 #(
    .INIT ( 8'h51 ))
  \lsr0/_n0012_inv1  (
    .I0(\control0/state_FSM_FFd3_276 ),
    .I1(\control0/state_FSM_FFd1_115 ),
    .I2(\control0/state_FSM_FFd2_277 ),
    .O(\lsr0/_n0012_inv )
  );
  BUFGP   clk_BUFGP (
    .I(clk),
    .O(clk_BUFGP_32)
  );
  INV   clk_inv1_INV_0 (
    .I(clk_BUFGP_32),
    .O(clk_inv)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_31_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[31]),
    .R(w_reset),
    .Q(\acc0/pp_31_1_349 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_30_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[30]),
    .R(w_reset),
    .Q(\acc0/pp_30_1_350 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_29_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[29]),
    .R(w_reset),
    .Q(\acc0/pp_29_1_351 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_28_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[28]),
    .R(w_reset),
    .Q(\acc0/pp_28_1_352 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_27_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[27]),
    .R(w_reset),
    .Q(\acc0/pp_27_1_353 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_26_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[26]),
    .R(w_reset),
    .Q(\acc0/pp_26_1_354 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_25_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[25]),
    .R(w_reset),
    .Q(\acc0/pp_25_1_355 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_24_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[24]),
    .R(w_reset),
    .Q(\acc0/pp_24_1_356 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_23_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[23]),
    .R(w_reset),
    .Q(\acc0/pp_23_1_357 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_22_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[22]),
    .R(w_reset),
    .Q(\acc0/pp_22_1_358 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_21_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[21]),
    .R(w_reset),
    .Q(\acc0/pp_21_1_359 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_20_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[20]),
    .R(w_reset),
    .Q(\acc0/pp_20_1_360 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_19_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[19]),
    .R(w_reset),
    .Q(\acc0/pp_19_1_361 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_18_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[18]),
    .R(w_reset),
    .Q(\acc0/pp_18_1_362 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_17_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[17]),
    .R(w_reset),
    .Q(\acc0/pp_17_1_363 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_16_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[16]),
    .R(w_reset),
    .Q(\acc0/pp_16_1_364 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_15_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[15]),
    .R(w_reset),
    .Q(\acc0/pp_15_1_365 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_14_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[14]),
    .R(w_reset),
    .Q(\acc0/pp_14_1_366 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_13_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[13]),
    .R(w_reset),
    .Q(\acc0/pp_13_1_367 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_12_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[12]),
    .R(w_reset),
    .Q(\acc0/pp_12_1_368 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_11_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[11]),
    .R(w_reset),
    .Q(\acc0/pp_11_1_369 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_10_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[10]),
    .R(w_reset),
    .Q(\acc0/pp_10_1_370 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_9_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[9]),
    .R(w_reset),
    .Q(\acc0/pp_9_1_371 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_8_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[8]),
    .R(w_reset),
    .Q(\acc0/pp_8_1_372 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_7_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[7]),
    .R(w_reset),
    .Q(\acc0/pp_7_1_373 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_6_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[6]),
    .R(w_reset),
    .Q(\acc0/pp_6_1_374 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_5_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[5]),
    .R(w_reset),
    .Q(\acc0/pp_5_1_375 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_4_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[4]),
    .R(w_reset),
    .Q(\acc0/pp_4_1_376 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_3_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[3]),
    .R(w_reset),
    .Q(\acc0/pp_3_1_377 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_2_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[2]),
    .R(w_reset),
    .Q(\acc0/pp_2_1_378 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_1_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[1]),
    .R(w_reset),
    .Q(\acc0/pp_1_1_379 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \acc0/pp_0_1  (
    .C(clk_inv),
    .CE(w_add),
    .D(Result[0]),
    .R(w_reset),
    .Q(\acc0/pp_0_1_380 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \control0/state_FSM_FFd1_1  (
    .C(clk_BUFGP_32),
    .D(\control0/state_FSM_FFd1-In_269 ),
    .R(rst_IBUF_33),
    .Q(\control0/state_FSM_FFd1_1_381 )
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

