// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Mon Sep 11 11:41:31 2023
// Host        : DLT-SEED-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Jahwa/windows/vivado/pynq_mb/jahwa_daq_system/jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_dff_en_reset_vector_0_0_1/jahwa_daq_system_dff_en_reset_vector_0_0_stub.v
// Design      : jahwa_daq_system_dff_en_reset_vector_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "dff_en_reset_vector,Vivado 2020.2" *)
module jahwa_daq_system_dff_en_reset_vector_0_0(d, clk, en, reset, q)
/* synthesis syn_black_box black_box_pad_pin="d[0:0],clk,en,reset,q[0:0]" */;
  input [0:0]d;
  input clk;
  input en;
  input reset;
  output [0:0]q;
endmodule
