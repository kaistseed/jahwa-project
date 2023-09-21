vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_8
vlib questa_lib/msim/processing_system7_vip_v1_0_10
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/axi_intc_v4_1_15
vlib questa_lib/msim/lib_pkg_v1_0_2
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/interrupt_control_v3_1_4
vlib questa_lib/msim/axi_iic_v2_0_25
vlib questa_lib/msim/dist_mem_gen_v8_0_13
vlib questa_lib/msim/lib_srl_fifo_v1_0_2
vlib questa_lib/msim/fifo_generator_v13_2_5
vlib questa_lib/msim/lib_fifo_v1_0_14
vlib questa_lib/msim/axi_quad_spi_v3_2_21
vlib questa_lib/msim/axi_gpio_v2_0_24
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_22
vlib questa_lib/msim/axi_data_fifo_v2_1_21
vlib questa_lib/msim/axi_crossbar_v2_1_23
vlib questa_lib/msim/xlslice_v1_0_2
vlib questa_lib/msim/axi_bram_ctrl_v4_1_4
vlib questa_lib/msim/axi_timer_v2_0_24
vlib questa_lib/msim/xlconcat_v2_1_4
vlib questa_lib/msim/mdm_v3_2_19
vlib questa_lib/msim/microblaze_v11_0_4
vlib questa_lib/msim/proc_sys_reset_v5_0_13
vlib questa_lib/msim/xlconstant_v1_1_7
vlib questa_lib/msim/lmb_v10_v3_0_11
vlib questa_lib/msim/lmb_bram_if_cntlr_v4_0_19
vlib questa_lib/msim/blk_mem_gen_v8_4_4
vlib questa_lib/msim/axi_protocol_converter_v2_1_22

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_8 questa_lib/msim/axi_vip_v1_1_8
vmap processing_system7_vip_v1_0_10 questa_lib/msim/processing_system7_vip_v1_0_10
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap axi_intc_v4_1_15 questa_lib/msim/axi_intc_v4_1_15
vmap lib_pkg_v1_0_2 questa_lib/msim/lib_pkg_v1_0_2
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 questa_lib/msim/interrupt_control_v3_1_4
vmap axi_iic_v2_0_25 questa_lib/msim/axi_iic_v2_0_25
vmap dist_mem_gen_v8_0_13 questa_lib/msim/dist_mem_gen_v8_0_13
vmap lib_srl_fifo_v1_0_2 questa_lib/msim/lib_srl_fifo_v1_0_2
vmap fifo_generator_v13_2_5 questa_lib/msim/fifo_generator_v13_2_5
vmap lib_fifo_v1_0_14 questa_lib/msim/lib_fifo_v1_0_14
vmap axi_quad_spi_v3_2_21 questa_lib/msim/axi_quad_spi_v3_2_21
vmap axi_gpio_v2_0_24 questa_lib/msim/axi_gpio_v2_0_24
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_22 questa_lib/msim/axi_register_slice_v2_1_22
vmap axi_data_fifo_v2_1_21 questa_lib/msim/axi_data_fifo_v2_1_21
vmap axi_crossbar_v2_1_23 questa_lib/msim/axi_crossbar_v2_1_23
vmap xlslice_v1_0_2 questa_lib/msim/xlslice_v1_0_2
vmap axi_bram_ctrl_v4_1_4 questa_lib/msim/axi_bram_ctrl_v4_1_4
vmap axi_timer_v2_0_24 questa_lib/msim/axi_timer_v2_0_24
vmap xlconcat_v2_1_4 questa_lib/msim/xlconcat_v2_1_4
vmap mdm_v3_2_19 questa_lib/msim/mdm_v3_2_19
vmap microblaze_v11_0_4 questa_lib/msim/microblaze_v11_0_4
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13
vmap xlconstant_v1_1_7 questa_lib/msim/xlconstant_v1_1_7
vmap lmb_v10_v3_0_11 questa_lib/msim/lmb_v10_v3_0_11
vmap lmb_bram_if_cntlr_v4_0_19 questa_lib/msim/lmb_bram_if_cntlr_v4_0_19
vmap blk_mem_gen_v8_4_4 questa_lib/msim/blk_mem_gen_v8_4_4
vmap axi_protocol_converter_v2_1_22 questa_lib/msim/axi_protocol_converter_v2_1_22

vlog -work xilinx_vip  -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L xilinx_vip "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"D:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L xilinx_vip "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"D:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"D:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93 \
"D:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_8  -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L xilinx_vip "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/94c3/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_10  -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L xilinx_vip "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_processing_system7_0_0_1/sim/jahwa_daq_system_processing_system7_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work axi_intc_v4_1_15  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/47b8/hdl/axi_intc_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_axi_intc_0_0_1/sim/jahwa_daq_system_axi_intc_0_0.vhd" \

vcom -work lib_pkg_v1_0_2  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_iic_v2_0_25  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/1529/hdl/axi_iic_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_axi_iic_0_0_1/sim/jahwa_daq_system_axi_iic_0_0.vhd" \

vlog -work dist_mem_gen_v8_0_13  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/0bf5/simulation/dist_mem_gen_v8_0.v" \

vcom -work lib_srl_fifo_v1_0_2  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_14  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/a5cb/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work axi_quad_spi_v3_2_21  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/63ec/hdl/axi_quad_spi_v3_2_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_axi_quad_spi_0_0_1/sim/jahwa_daq_system_axi_quad_spi_0_0.vhd" \

vcom -work axi_gpio_v2_0_24  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/4318/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_axi_gpio_0_0_1/sim/jahwa_daq_system_axi_gpio_0_0.vhd" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_axi_gpio_1_0_1/sim/jahwa_daq_system_axi_gpio_1_0.vhd" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_axi_gpio_2_0_1/sim/jahwa_daq_system_axi_gpio_2_0.vhd" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_axi_gpio_3_0_1/sim/jahwa_daq_system_axi_gpio_3_0.vhd" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_axi_gpio_4_0_1/sim/jahwa_daq_system_axi_gpio_4_0.vhd" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_axi_gpio_5_0/sim/jahwa_daq_system_axi_gpio_5_0.vhd" \

vlog -work xil_defaultlib  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/f30f/hdl/axi_clock_divider_v1_0_S00_AXI.v" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/f30f/hdl/clock_divider.v" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/f30f/hdl/axi_clock_divider_v1_0.v" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_axi_clock_divider_0_0_1/sim/jahwa_daq_system_axi_clock_divider_0_0.v" \

vlog -work generic_baseblocks_v2_1_0  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_22  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_21  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_23  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/bc0a/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_xbar_0_1/sim/jahwa_daq_system_xbar_0.v" \

vlog -work xlslice_v1_0_2  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/11d0/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_xlslice_0_0_1/sim/jahwa_daq_system_xlslice_0_0.v" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_xlslice_1_0_1/sim/jahwa_daq_system_xlslice_1_0.v" \

vcom -work axi_bram_ctrl_v4_1_4  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/c9f0/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_axi_bram_ctrl_0_0_1/sim/jahwa_daq_system_axi_bram_ctrl_0_0.vhd" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_axi_gpio_0_1_1/sim/jahwa_daq_system_axi_gpio_0_1.vhd" \

vcom -work axi_timer_v2_0_24  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/70d6/hdl/axi_timer_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_axi_timer_0_0_1/sim/jahwa_daq_system_axi_timer_0_0.vhd" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_axi_timer_1_0_1/sim/jahwa_daq_system_axi_timer_1_0.vhd" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_axi_timer_2_0_1/sim/jahwa_daq_system_axi_timer_2_0.vhd" \

vlog -work xlconcat_v2_1_4  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_xlconcat_0_0_1/sim/jahwa_daq_system_xlconcat_0_0.v" \

vcom -work xil_defaultlib  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_axi_intc_0_1_1/sim/jahwa_daq_system_axi_intc_0_1.vhd" \

vlog -work xil_defaultlib  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_xbar_1_1/sim/jahwa_daq_system_xbar_1.v" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/10e3/dff_en_reset_vector.v" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_dff_en_reset_vector_0_0_1/sim/jahwa_daq_system_dff_en_reset_vector_0_0.v" \

vcom -work mdm_v3_2_19  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/8715/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_mdm_0_0_1/sim/jahwa_daq_system_mdm_0_0.vhd" \

vcom -work microblaze_v11_0_4  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/9285/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_microblaze_0_0_1/sim/jahwa_daq_system_microblaze_0_0.vhd" \

vcom -work proc_sys_reset_v5_0_13  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_rst_ps7_0_100M_0_1/sim/jahwa_daq_system_rst_ps7_0_100M_0.vhd" \

vlog -work xlconstant_v1_1_7  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_xlconstant_0_0_1/sim/jahwa_daq_system_xlconstant_0_0.v" \

vcom -work lmb_v10_v3_0_11  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/c2ed/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_dlmb_0_0_1/sim/jahwa_daq_system_dlmb_0_0.vhd" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_ilmb_0_0_1/sim/jahwa_daq_system_ilmb_0_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_19  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/0b98/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_ilmb_bram_ctrl_0_0_1/sim/jahwa_daq_system_ilmb_bram_ctrl_0_0.vhd" \

vlog -work blk_mem_gen_v8_4_4  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_lmb_bram_0_0_1/sim/jahwa_daq_system_lmb_bram_0_0.v" \

vlog -work axi_protocol_converter_v2_1_22  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/ec67/hdl" "+incdir+../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ipshared/34f8/hdl" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_auto_pc_1_1/sim/jahwa_daq_system_auto_pc_1.v" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/ip/jahwa_daq_system_auto_pc_0_1/sim/jahwa_daq_system_auto_pc_0.v" \
"../../../../jahwa_daq_system.gen/sources_1/bd/jahwa_daq_system/sim/jahwa_daq_system.v" \

vlog -work xil_defaultlib \
"glbl.v"

