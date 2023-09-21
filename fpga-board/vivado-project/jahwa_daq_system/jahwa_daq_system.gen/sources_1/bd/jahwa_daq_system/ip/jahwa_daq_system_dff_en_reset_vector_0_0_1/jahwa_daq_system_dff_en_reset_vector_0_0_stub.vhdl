-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Mon Sep 11 11:41:31 2023
-- Host        : DLT-SEED-PC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/Jahwa/windows/vivado/pynq_mb/jahwa_daq_system/jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_dff_en_reset_vector_0_0_1/jahwa_daq_system_dff_en_reset_vector_0_0_stub.vhdl
-- Design      : jahwa_daq_system_dff_en_reset_vector_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jahwa_daq_system_dff_en_reset_vector_0_0 is
  Port ( 
    d : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC;
    en : in STD_LOGIC;
    reset : in STD_LOGIC;
    q : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end jahwa_daq_system_dff_en_reset_vector_0_0;

architecture stub of jahwa_daq_system_dff_en_reset_vector_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "d[0:0],clk,en,reset,q[0:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "dff_en_reset_vector,Vivado 2020.2";
begin
end;
