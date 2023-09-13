##################################################################################################
#                                         [ TCL Script ]                                         #
##################################################################################################
#
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : PYNQ Jahwa DAQ                                     
#                                                                                
# Create Date           : 07/31/2023
# File Name             : bd_script.tcl                                        
#                                                                                
# Target Device         : PYNQ-Z1                                                    
# Tool Version          : Vivado 2020.2                                          
#       
##################################################################################################
##################################################################################################
#                                    Initialize Block Design                                     #
##################################################################################################
create_bd_design "jahwa_daq_system_2"
update_compile_order -fileset sources_1
##################################################################################################

##################################################################################################
#                                    Add Custom IP Repository                                    #
##################################################################################################
set project_dir [get_property DIRECTORY [current_project]]
set_property ip_repo_paths \
"${project_dir}/jahwa_daq_system.ip_repo" \
[current_project]
update_ip_catalog
##################################################################################################

##################################################################################################
#                                        Create Top Design                                       #
##################################################################################################
# Create instance: Zynq PS
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0

# Apply board preset for Zynq PS
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config \
{make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" } \
[get_bd_cells processing_system7_0]

# Set Zynq PS configurations
set_property -dict [list \
   CONFIG.PCW_USE_FABRIC_INTERRUPT {1} \
   CONFIG.PCW_IRQ_F2P_INTR {1} \
   CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
   CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE {1} \
   CONFIG.PCW_GPIO_EMIO_GPIO_IO {2} \
] [get_bd_cells processing_system7_0]

# Create instance: AXI Interrupt Controller
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 axi_intc_0

# Create instanceL AXI IIC (Meissner)
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 axi_iic_0
set_property -dict [list \
    CONFIG.C_SDA_LEVEL {0} \
    CONFIG.IIC_FREQ_KHZ {1000} \
] [get_bd_cells axi_iic_0]

# Create instance: AXI Quad SPI (ADC and DAC)
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_quad_spi:3.2 axi_quad_spi_0
set_property -dict [list \
    CONFIG.C_USE_STARTUP {0} \
    CONFIG.C_USE_STARTUP_INT {0} \
    CONFIG.C_NUM_TRANSFER_BITS {16} \
    CONFIG.C_NUM_SS_BITS {2} \
    CONFIG.C_SCK_RATIO {4} \
] [get_bd_cells axi_quad_spi_0]

# Create instance AXI GPIO 0 (Debug LEDs)
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0
set_property -dict [list \
    CONFIG.C_GPIO_WIDTH {4} \
    CONFIG.C_ALL_OUTPUTS {1} \
] [get_bd_cells axi_gpio_0]

# Create instance AXI GPIO 1 (ADC I/O)
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_1
set_property -dict [list \
    CONFIG.C_GPIO_WIDTH {1} \
    CONFIG.C_ALL_OUTPUTS {1} \
] [get_bd_cells axi_gpio_1]

# Create instance AXI GPIO 2 (SDN 1 I/O)
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_2
set_property -dict [list \
    CONFIG.C_GPIO_WIDTH {1} \
    CONFIG.C_ALL_OUTPUTS {1} \
] [get_bd_cells axi_gpio_2]

# Create instance AXI GPIO 3 (SDN 2 I/O)
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_3
set_property -dict [list \
    CONFIG.C_GPIO_WIDTH {1} \
    CONFIG.C_ALL_OUTPUTS {1} \
] [get_bd_cells axi_gpio_3]

# Create instance AXI GPIO 4 (SDN 3 I/O)
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_4
set_property -dict [list \
    CONFIG.C_GPIO_WIDTH {1} \
    CONFIG.C_ALL_OUTPUTS {1} \
] [get_bd_cells axi_gpio_4]

# Create instance AXI GPIO 5 (Relay Switch)
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_5
set_property -dict [list \
	CONFIG.C_GPIO_WIDTH {1} \
	CONFIG.C_GPIO2_WIDTH {1} \
	CONFIG.C_IS_DUAL {1} \
	CONFIG.C_ALL_OUTPUTS {1} \
	CONFIG.C_ALL_OUTPUTS_2 {1}
] [get_bd_cells axi_gpio_5]

# Create instance AXI Clock Divider
create_bd_cell -type ip -vlnv xilinx.com:user:axi_clock_divider:1.0 axi_clock_divider_0

# Create instance: AXI Interconnect
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0
set_property -dict [ list \
   CONFIG.NUM_MI {2} \
] [get_bd_cells axi_interconnect_0]

# Create instance: Slice 0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0
set_property -dict [list \
   CONFIG.DIN_WIDTH {2} \
] [get_bd_cells xlslice_0]

# Create instance: Slice 1
create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_1
set_property -dict [list \
   CONFIG.DIN_WIDTH {2} \
   CONFIG.DIN_FROM {1} \
   CONFIG.DIN_TO {1} \
] [get_bd_cells xlslice_1]

# Create ports
create_bd_port -dir O RST_DEBUG
create_bd_port -dir O TRIG
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:spi_rtl:1.0 SPI
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 IIC
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 PYNQ_CNV
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 PYNQ_SDN1
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 PYNQ_SDN2
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 PYNQ_SDN3
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 REL1
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 REL2
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 PYNQ_MB_DEBUG
##################################################################################################

##################################################################################################
#                                 Create Microblaze Softprocessor                                #
##################################################################################################
# Create Microblaze Softprocessor
create_bd_cell -type hier mb_softprocessor_0

# Set variable name for Microblaze Softprocessor
set soft_processor [get_bd_cells mb_softprocessor_0]

# Create interface pin
# AXI slave interface
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 $soft_processor/S_AXI
# AXI master interface
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 $soft_processor/M05_AXI
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 $soft_processor/M06_AXI
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 $soft_processor/M07_AXI
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 $soft_processor/M08_AXI
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 $soft_processor/M09_AXI
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 $soft_processor/M10_AXI
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 $soft_processor/M11_AXI
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 $soft_processor/M12_AXI
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 $soft_processor/M13_AXI

# Create pin
# Input ports
create_bd_pin -dir I $soft_processor/RESET
create_bd_pin -dir I -type clk $soft_processor/CLK
create_bd_pin -dir I -type rst $soft_processor/AUX_RST_IN
create_bd_pin -dir I -type rst $soft_processor/S_AXI_ARESETN
# Output ports
create_bd_pin -dir O -from 0 -to 0 $soft_processor/Q
create_bd_pin -dir O -type rst $soft_processor/RST_DEBUG
create_bd_pin -dir O -from 0 -to 0 -type rst $soft_processor/PERIPHERAL_ARESETN

# Create instance: AXI BRAM Controller
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 $soft_processor/axi_bram_ctrl_0
set_property -dict [ list \
   CONFIG.READ_LATENCY {1} \
   CONFIG.SINGLE_PORT_BRAM {1} \
] [get_bd_cells $soft_processor/axi_bram_ctrl_0]

# Create instance: AXI GPIO (Microblaze LED debug signal)
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 $soft_processor/axi_gpio_0
set_property -dict [ list \
   CONFIG.C_GPIO_WIDTH {1} \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_IS_DUAL {0} \
] [get_bd_cells $soft_processor/axi_gpio_0]

# Create instance: AXI Timer 0
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 $soft_processor/axi_timer_0
set_property -dict [ list \
   CONFIG.enable_timer2 {1} \
] [get_bd_cells $soft_processor/axi_timer_0]

# Create instance: AXI Timer 1
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 $soft_processor/axi_timer_1
set_property -dict [ list \
   CONFIG.enable_timer2 {1} \
] [get_bd_cells $soft_processor/axi_timer_1]

# Create instance: AXI Timer 2 (global counter)
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 $soft_processor/axi_timer_2
set_property -dict [ list \
   CONFIG.enable_timer2 {1} \
   CONFIG.mode_64bit {1} \
] [get_bd_cells $soft_processor/axi_timer_2]

# Create instance: Concat (concatenate interrupt signals from AXI Timer)
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 $soft_processor/xlconcat_0
set_property -dict [ list \
   CONFIG.NUM_PORTS {3} \
] [get_bd_cells $soft_processor/xlconcat_0]

# Create instance: AXI Interrupt Controller
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 $soft_processor/axi_intc_0

# Create instance: AXI Interconnect
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 $soft_processor/axi_interconnect_0
set_property -dict [ list \
   CONFIG.NUM_MI {14} \
] [get_bd_cells $soft_processor/axi_interconnect_0]

# Create instance: Flip Flop (send interrupt signal from Microblaze to Zynq)
create_bd_cell -type ip -vlnv xilinx.com:user:dff_en_reset_vector:1.0 $soft_processor/dff_en_reset_vector_0
set_property -dict [ list \
   CONFIG.SIZE {1} \
] [get_bd_cells $soft_processor/dff_en_reset_vector_0]

# Create instance: MicroBlaze Debug Module (MDM)
create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 $soft_processor/mdm_0

# Create instance: MicroBlaze
create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:11.0 $soft_processor/microblaze_0
set_property -dict [ list \
   CONFIG.C_ADDR_TAG_BITS {0} \
   CONFIG.C_CACHE_BYTE_SIZE {8192} \
   CONFIG.C_DCACHE_ADDR_TAG {0} \
   CONFIG.C_DCACHE_BYTE_SIZE {8192} \
   CONFIG.C_DEBUG_ENABLED {1} \
   CONFIG.C_D_AXI {1} \
   CONFIG.C_D_LMB {1} \
   CONFIG.C_I_LMB {1} \
   CONFIG.C_USE_DCACHE {0} \
   CONFIG.C_USE_ICACHE {0} \
] [get_bd_cells $soft_processor/microblaze_0]

# Create instance: Processor System Reset
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 $soft_processor/rst_ps7_0_100M
set_property -dict [ list \
   CONFIG.C_AUX_RESET_HIGH {1} \
] [get_bd_cells $soft_processor/rst_ps7_0_100M]

# Create instance: Constant
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 $soft_processor/xlconstant_0
set_property -dict [ list \
   CONFIG.CONST_VAL {1} \
] [get_bd_cells $soft_processor/xlconstant_0]
##################################################################################################

##################################################################################################
#                               Create Local Memory for Microblaze                               #
##################################################################################################
# Create instance: Microblaze local mmemory
create_bd_cell -type hier $soft_processor/microblaze_local_memory_0

# Set variable name for Microblaze local memory
set local_memory [get_bd_cells $soft_processor/microblaze_local_memory_0]

# Create interface pin
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:bram_rtl:1.0 $local_memory/BRAM_PORTB
create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 $local_memory/DLMB
create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 $local_memory/ILMB

# Create pim
create_bd_pin -dir I -type clk $local_memory/LMB_CLK
create_bd_pin -dir I -type rst $local_memory/SYS_RST

# Create instance: Data LMB
create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 $local_memory/dlmb_0

# Create instance: Instruction LMB
create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 $local_memory/ilmb_0

# Create instance: Instruction LMB BRAM Controller
create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 $local_memory/ilmb_bram_ctrl_0
set_property -dict [ list \
   CONFIG.C_ECC {0} \
   CONFIG.C_NUM_LMB {2} \
] [get_bd_cells $local_memory/ilmb_bram_ctrl_0]

# Create instance: Block Memory Generator
create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 $local_memory/lmb_bram_0
set_property -dict [ list \
   CONFIG.Byte_Size {8} \
   CONFIG.EN_SAFETY_CKT {true} \
   CONFIG.Enable_32bit_Address {true} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {true} \
   CONFIG.Use_RSTA_Pin {true} \
   CONFIG.Use_RSTB_Pin {true} \
   CONFIG.use_bram_block {BRAM_Controller} \
] [get_bd_cells $local_memory/lmb_bram_0]

# Create interface connection
connect_bd_intf_net [get_bd_intf_pins $local_memory/ilmb_bram_ctrl_0/SLMB1] [get_bd_intf_pins $local_memory/ilmb_0/LMB_Sl_0]
connect_bd_intf_net [get_bd_intf_pins $local_memory/ilmb_bram_ctrl_0/SLMB] [get_bd_intf_pins $local_memory/dlmb_0/LMB_Sl_0]
connect_bd_intf_net [get_bd_intf_pins $local_memory/ilmb_bram_ctrl_0/BRAM_PORT] [get_bd_intf_pins $local_memory/lmb_bram_0/BRAM_PORTA]
connect_bd_intf_net [get_bd_intf_pins $local_memory/BRAM_PORTB] [get_bd_intf_pins $local_memory/lmb_bram_0/BRAM_PORTB]
connect_bd_intf_net [get_bd_intf_pins $local_memory/DLMB] [get_bd_intf_pins $local_memory/dlmb_0/LMB_M]
connect_bd_intf_net [get_bd_intf_pins $local_memory/ILMB] [get_bd_intf_pins $local_memory/ilmb_0/LMB_M]

# Create port connection
connect_bd_net -net microblaze_0_clk [get_bd_pins $local_memory/LMB_CLK] [get_bd_pins $local_memory/dlmb_0/LMB_CLK] [get_bd_pins $local_memory/ilmb_0/LMB_CLK] [get_bd_pins $local_memory/ilmb_bram_ctrl_0/LMB_Clk]
connect_bd_net -net sys_rst [get_bd_pins $local_memory/SYS_RST] [get_bd_pins $local_memory/dlmb_0/SYS_Rst] [get_bd_pins $local_memory/ilmb_0/SYS_Rst] [get_bd_pins $local_memory/ilmb_bram_ctrl_0/LMB_Rst]

##################################################################################################

##################################################################################################
#                             Create Connection for Microblaze Block                             #
##################################################################################################
# Create interface connection
# AXI interconnect to output Microblaze block output pin
connect_bd_intf_net -intf_net conn_m05_axi [get_bd_intf_pins $soft_processor/M05_AXI] [get_bd_intf_pins $soft_processor/axi_interconnect_0/M05_AXI]
connect_bd_intf_net -intf_net conn_m06_axi [get_bd_intf_pins $soft_processor/M06_AXI] [get_bd_intf_pins $soft_processor/axi_interconnect_0/M06_AXI]
connect_bd_intf_net -intf_net conn_m07_axi [get_bd_intf_pins $soft_processor/M07_AXI] [get_bd_intf_pins $soft_processor/axi_interconnect_0/M07_AXI]
connect_bd_intf_net -intf_net conn_m08_axi [get_bd_intf_pins $soft_processor/M08_AXI] [get_bd_intf_pins $soft_processor/axi_interconnect_0/M08_AXI]
connect_bd_intf_net -intf_net conn_m09_axi [get_bd_intf_pins $soft_processor/M09_AXI] [get_bd_intf_pins $soft_processor/axi_interconnect_0/M09_AXI]
connect_bd_intf_net -intf_net conn_m10_axi [get_bd_intf_pins $soft_processor/M10_AXI] [get_bd_intf_pins $soft_processor/axi_interconnect_0/M10_AXI]
connect_bd_intf_net -intf_net conn_m11_axi [get_bd_intf_pins $soft_processor/M11_AXI] [get_bd_intf_pins $soft_processor/axi_interconnect_0/M11_AXI]
connect_bd_intf_net -intf_net conn_m12_axi [get_bd_intf_pins $soft_processor/M12_AXI] [get_bd_intf_pins $soft_processor/axi_interconnect_0/M12_AXI]
connect_bd_intf_net -intf_net conn_m13_axi [get_bd_intf_pins $soft_processor/M13_AXI] [get_bd_intf_pins $soft_processor/axi_interconnect_0/M13_AXI]
# AXI interconnect to IP blocks in Microblaze block
connect_bd_intf_net -intf_net mb_M_AXI_DP [get_bd_intf_pins $soft_processor/microblaze_0/M_AXI_DP] [get_bd_intf_pins $soft_processor/axi_interconnect_0/S00_AXI]
connect_bd_intf_net -intf_net mb_axi_interconnect_0_M00_AXI [get_bd_intf_pins $soft_processor/axi_intc_0/s_axi] [get_bd_intf_pins $soft_processor/axi_interconnect_0/M00_AXI]
connect_bd_intf_net -intf_net mb_axi_interconnect_0_M01_AXI [get_bd_intf_pins $soft_processor/axi_gpio_0/S_AXI] [get_bd_intf_pins $soft_processor/axi_interconnect_0/M01_AXI]
connect_bd_intf_net -intf_net mb_axi_interconnect_0_M02_AXI [get_bd_intf_pins $soft_processor/axi_timer_0/S_AXI] [get_bd_intf_pins $soft_processor/axi_interconnect_0/M02_AXI]
connect_bd_intf_net -intf_net mb_axi_interconnect_0_M03_AXI [get_bd_intf_pins $soft_processor/axi_timer_1/S_AXI] [get_bd_intf_pins $soft_processor/axi_interconnect_0/M03_AXI]
connect_bd_intf_net -intf_net mb_axi_interconnect_0_M04_AXI [get_bd_intf_pins $soft_processor/axi_timer_2/S_AXI] [get_bd_intf_pins $soft_processor/axi_interconnect_0/M04_AXI]
# Microblaze IP to other IP blocks in Microblaze block
connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins $soft_processor/axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins $local_memory/BRAM_PORTB]
connect_bd_intf_net -intf_net axi_intc_0_interrupt [get_bd_intf_pins $soft_processor/axi_intc_0/interrupt] [get_bd_intf_pins $soft_processor/microblaze_0/INTERRUPT]
connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins $soft_processor/microblaze_0/DLMB] [get_bd_intf_pins $local_memory/DLMB]
connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins $soft_processor/microblaze_0/ILMB] [get_bd_intf_pins $local_memory/ILMB]
connect_bd_intf_net -intf_net microblaze_0_debug [get_bd_intf_pins $soft_processor/microblaze_0/DEBUG] [get_bd_intf_pins $soft_processor/mdm_0/MBDEBUG_0]
# Microblaze block input pin to IP blocks in Microblaze block
connect_bd_intf_net -intf_net zynq_axi_interconnect_0_M00_AXI [get_bd_intf_pins $soft_processor/S_AXI] [get_bd_intf_pins $soft_processor/axi_bram_ctrl_0/S_AXI]

# Create port connection
# Softprocessor clock signal
connect_bd_net -net softprocessor_clk [get_bd_pins $soft_processor/CLK] \
[get_bd_pins $soft_processor/axi_interconnect_0/ACLK] \
[get_bd_pins $soft_processor/axi_interconnect_0/S00_ACLK] \
[get_bd_pins $soft_processor/axi_interconnect_0/M00_ACLK] \
[get_bd_pins $soft_processor/axi_interconnect_0/M01_ACLK] \
[get_bd_pins $soft_processor/axi_interconnect_0/M02_ACLK] \
[get_bd_pins $soft_processor/axi_interconnect_0/M03_ACLK] \
[get_bd_pins $soft_processor/axi_interconnect_0/M04_ACLK] \
[get_bd_pins $soft_processor/axi_interconnect_0/M05_ACLK] \
[get_bd_pins $soft_processor/axi_interconnect_0/M06_ACLK] \
[get_bd_pins $soft_processor/axi_interconnect_0/M07_ACLK] \
[get_bd_pins $soft_processor/axi_interconnect_0/M08_ACLK] \
[get_bd_pins $soft_processor/axi_interconnect_0/M09_ACLK] \
[get_bd_pins $soft_processor/axi_interconnect_0/M10_ACLK] \
[get_bd_pins $soft_processor/axi_interconnect_0/M11_ACLK] \
[get_bd_pins $soft_processor/axi_interconnect_0/M12_ACLK] \
[get_bd_pins $soft_processor/axi_interconnect_0/M13_ACLK] \
[get_bd_pins $soft_processor/microblaze_0/Clk] \
[get_bd_pins $soft_processor/axi_timer_0/s_axi_aclk] \
[get_bd_pins $soft_processor/axi_timer_1/s_axi_aclk] \
[get_bd_pins $soft_processor/axi_timer_2/s_axi_aclk] \
[get_bd_pins $soft_processor/dff_en_reset_vector_0/clk] \
[get_bd_pins $soft_processor/axi_bram_ctrl_0/s_axi_aclk] \
[get_bd_pins $soft_processor/rst_ps7_0_100M/slowest_sync_clk] \
[get_bd_pins $soft_processor/microblaze_local_memory_0/LMB_CLK] \
[get_bd_pins $soft_processor/axi_gpio_0/s_axi_aclk] \
[get_bd_pins $soft_processor/axi_intc_0/s_axi_aclk]
# AXI reset signal
connect_bd_net -net axi_rstn [get_bd_pins $soft_processor/S_AXI_ARESETN] \
[get_bd_pins $soft_processor/axi_gpio_0/s_axi_aresetn] \
[get_bd_pins $soft_processor/axi_bram_ctrl_0/s_axi_aresetn]
# System reset signal
connect_bd_net -net sys_rst_1 [get_bd_pins $soft_processor/microblaze_local_memory_0/SYS_RST] \
[get_bd_pins $soft_processor/rst_ps7_0_100M/bus_struct_reset]
# Auxilliary reset signal
connect_bd_net -net aux_rst_in_1 [get_bd_pins $soft_processor/AUX_RST_IN] \
[get_bd_pins $soft_processor/rst_ps7_0_100M/aux_reset_in]
# Flip-flop related signal
connect_bd_net -net dff_en_reset_vector_0_en [get_bd_pins $soft_processor/dff_en_reset_vector_0/en] \
[get_bd_pins $soft_processor/axi_gpio_0/gpio_io_o]
connect_bd_net -net dff_en_reset_vector_0_q [get_bd_pins $soft_processor/Q] \
[get_bd_pins $soft_processor/dff_en_reset_vector_0/q]
connect_bd_net -net reset_1 [get_bd_pins $soft_processor/RESET] \
[get_bd_pins $soft_processor/dff_en_reset_vector_0/reset]
# Debug module signal
connect_bd_net -net mdm_debug_sys_rst_1 [get_bd_pins $soft_processor/mdm_0/Debug_SYS_Rst] \
[get_bd_pins $soft_processor/rst_ps7_0_100M/mb_debug_sys_rst]
# Reset IP related signal
connect_bd_net -net rst_ps7_0_100M_interconnect_aresetn [get_bd_pins $soft_processor/axi_interconnect_0/ARESETN] \
[get_bd_pins $soft_processor/rst_ps7_0_100M/interconnect_aresetn]
connect_bd_net -net rst_ps7_0_100M_mb_reset [get_bd_pins $soft_processor/RST_DEBUG] \
[get_bd_pins $soft_processor/rst_ps7_0_100M/mb_reset] \
[get_bd_pins $soft_processor/microblaze_0/Reset]
connect_bd_net -net rst_ps7_0_100M_peripheral_aresetn [get_bd_pins $soft_processor/PERIPHERAL_ARESETN] \
[get_bd_pins $soft_processor/axi_intc_0/s_axi_aresetn] \
[get_bd_pins $soft_processor/axi_interconnect_0/S00_ARESETN] \
[get_bd_pins $soft_processor/axi_interconnect_0/M00_ARESETN] \
[get_bd_pins $soft_processor/axi_interconnect_0/M01_ARESETN] \
[get_bd_pins $soft_processor/axi_interconnect_0/M02_ARESETN] \
[get_bd_pins $soft_processor/axi_interconnect_0/M03_ARESETN] \
[get_bd_pins $soft_processor/axi_interconnect_0/M04_ARESETN] \
[get_bd_pins $soft_processor/axi_interconnect_0/M05_ARESETN] \
[get_bd_pins $soft_processor/axi_interconnect_0/M06_ARESETN] \
[get_bd_pins $soft_processor/axi_interconnect_0/M07_ARESETN] \
[get_bd_pins $soft_processor/axi_interconnect_0/M08_ARESETN] \
[get_bd_pins $soft_processor/axi_interconnect_0/M09_ARESETN] \
[get_bd_pins $soft_processor/axi_interconnect_0/M10_ARESETN] \
[get_bd_pins $soft_processor/axi_interconnect_0/M11_ARESETN] \
[get_bd_pins $soft_processor/axi_interconnect_0/M12_ARESETN] \
[get_bd_pins $soft_processor/axi_interconnect_0/M13_ARESETN] \
[get_bd_pins $soft_processor/axi_timer_0/s_axi_aresetn] \
[get_bd_pins $soft_processor/axi_timer_1/s_axi_aresetn] \
[get_bd_pins $soft_processor/axi_timer_2/s_axi_aresetn] \
[get_bd_pins $soft_processor/rst_ps7_0_100M/peripheral_aresetn]  
# Timer related signal
connect_bd_net -net axi_timer_0_intr [get_bd_pins $soft_processor/axi_timer_0/interrupt] \
[get_bd_pins $soft_processor/xlconcat_0/In0]
connect_bd_net -net axi_timer_1_intr [get_bd_pins $soft_processor/axi_timer_1/interrupt] \
[get_bd_pins $soft_processor/xlconcat_0/In1]
connect_bd_net -net axi_timer_2_intr [get_bd_pins $soft_processor/axi_timer_2/interrupt] \
[get_bd_pins $soft_processor/xlconcat_0/In2]
connect_bd_net [get_bd_pins $soft_processor/xlconcat_0/dout] \
[get_bd_pins $soft_processor/axi_intc_0/intr]
# Constant IP related signal
connect_bd_net -net xlconstant_0_dout [get_bd_pins $soft_processor/xlconstant_0/dout] \
[get_bd_pins $soft_processor/dff_en_reset_vector_0/d] \
[get_bd_pins $soft_processor/rst_ps7_0_100M/ext_reset_in]
##################################################################################################

##################################################################################################
#                                Create Connection for Top Design                                #
##################################################################################################
# Softprocessor clock signal
connect_bd_net -net softprocessor_clk [get_bd_pins $soft_processor/CLK] \
[get_bd_pins axi_iic_0/s_axi_aclk] \
[get_bd_pins axi_intc_0/s_axi_aclk] \
[get_bd_pins axi_gpio_0/s_axi_aclk] \
[get_bd_pins axi_gpio_1/s_axi_aclk] \
[get_bd_pins axi_gpio_2/s_axi_aclk] \
[get_bd_pins axi_gpio_3/s_axi_aclk] \
[get_bd_pins axi_gpio_4/s_axi_aclk] \
[get_bd_pins axi_gpio_5/s_axi_aclk] \
[get_bd_pins axi_quad_spi_0/s_axi_aclk] \
[get_bd_pins axi_quad_spi_0/ext_spi_clk] \
[get_bd_pins axi_clock_divider_0/s00_axi_aclk] \
[get_bd_pins axi_interconnect_0/ACLK] \
[get_bd_pins axi_interconnect_0/M00_ACLK] \
[get_bd_pins axi_interconnect_0/M01_ACLK] \
[get_bd_pins axi_interconnect_0/S00_ACLK] \
[get_bd_pins processing_system7_0/FCLK_CLK0] \
[get_bd_pins processing_system7_0/M_AXI_GP0_ACLK]

# Create interface connection
# Microblaze AXI master to IP AXI slave 
connect_bd_intf_net -intf_net softprocessor_M05_axi [get_bd_intf_pins $soft_processor/M05_AXI] [get_bd_intf_pins axi_iic_0/S_AXI]
connect_bd_intf_net -intf_net softprocessor_M06_axi [get_bd_intf_pins $soft_processor/M06_AXI] [get_bd_intf_pins axi_quad_spi_0/AXI_LITE]
connect_bd_intf_net -intf_net softprocessor_M07_axi [get_bd_intf_pins $soft_processor/M07_AXI] [get_bd_intf_pins axi_clock_divider_0/S00_AXI]
connect_bd_intf_net -intf_net softprocessor_M08_axi [get_bd_intf_pins $soft_processor/M08_AXI] [get_bd_intf_pins axi_gpio_0/S_AXI]
connect_bd_intf_net -intf_net softprocessor_M09_axi [get_bd_intf_pins $soft_processor/M09_AXI] [get_bd_intf_pins axi_gpio_1/S_AXI]
connect_bd_intf_net -intf_net softprocessor_M10_axi [get_bd_intf_pins $soft_processor/M10_AXI] [get_bd_intf_pins axi_gpio_2/S_AXI]
connect_bd_intf_net -intf_net softprocessor_M11_axi [get_bd_intf_pins $soft_processor/M11_AXI] [get_bd_intf_pins axi_gpio_3/S_AXI]
connect_bd_intf_net -intf_net softprocessor_M12_axi [get_bd_intf_pins $soft_processor/M12_AXI] [get_bd_intf_pins axi_gpio_4/S_AXI]
connect_bd_intf_net -intf_net softprocessor_M13_axi [get_bd_intf_pins $soft_processor/M13_AXI] [get_bd_intf_pins axi_gpio_5/S_AXI]
# Zynq AXI Interconnect
connect_bd_intf_net -intf_net zynq_axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins $soft_processor/S_AXI]
connect_bd_intf_net -intf_net zynq_axi_interconnect_0_M01_AXI [get_bd_intf_pins axi_interconnect_0/M01_AXI] [get_bd_intf_pins axi_intc_0/s_axi]
# ZYNQ AXI Master
connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins processing_system7_0/M_AXI_GP0]
# IP block to Port
connect_bd_intf_net [get_bd_intf_ports IIC] [get_bd_intf_pins axi_iic_0/IIC]
connect_bd_intf_net [get_bd_intf_ports SPI] [get_bd_intf_pins axi_quad_spi_0/SPI_0]
connect_bd_intf_net [get_bd_intf_ports PYNQ_MB_DEBUG] [get_bd_intf_pins axi_gpio_0/GPIO]
connect_bd_intf_net [get_bd_intf_ports PYNQ_CNV] [get_bd_intf_pins axi_gpio_1/GPIO]
connect_bd_intf_net [get_bd_intf_ports PYNQ_SDN1] [get_bd_intf_pins axi_gpio_2/GPIO]
connect_bd_intf_net [get_bd_intf_ports PYNQ_SDN2] [get_bd_intf_pins axi_gpio_3/GPIO]
connect_bd_intf_net [get_bd_intf_ports PYNQ_SDN3] [get_bd_intf_pins axi_gpio_4/GPIO]
connect_bd_intf_net [get_bd_intf_ports REL1] [get_bd_intf_pins axi_gpio_5/GPIO]
connect_bd_intf_net [get_bd_intf_ports REL2] [get_bd_intf_pins axi_gpio_5/GPIO2]

# Create port connection
# IP block to Port
connect_bd_net [get_bd_ports RST_DEBUG] [get_bd_pins $soft_processor/RST_DEBUG]
connect_bd_net [get_bd_ports TRIG] [get_bd_pins axi_clock_divider_0/O_CLK_DIV]
# Peripheral reset
connect_bd_net [get_bd_pins $soft_processor/PERIPHERAL_ARESETN] \
[get_bd_pins axi_iic_0/s_axi_aresetn] \
[get_bd_pins axi_quad_spi_0/s_axi_aresetn] \
[get_bd_pins axi_clock_divider_0/s00_axi_aresetn] \
[get_bd_pins axi_gpio_0/s_axi_aresetn] \
[get_bd_pins axi_gpio_1/s_axi_aresetn] \
[get_bd_pins axi_gpio_2/s_axi_aresetn] \
[get_bd_pins axi_gpio_3/s_axi_aresetn] \
[get_bd_pins axi_gpio_4/s_axi_aresetn] \
[get_bd_pins axi_gpio_5/s_axi_aresetn]
# Microblaze related signal
connect_bd_net [get_bd_pins $soft_processor/Q] [get_bd_pins axi_intc_0/intr]
connect_bd_net [get_bd_pins xlslice_1/Dout] [get_bd_pins $soft_processor/RESET]
connect_bd_net [get_bd_pins xlslice_0/Dout] [get_bd_pins $soft_processor/AUX_RST_IN]
# Zynq related signal
connect_bd_net [get_bd_pins $soft_processor/s_axi_aresetn] \
[get_bd_pins axi_intc_0/s_axi_aresetn] \
[get_bd_pins axi_interconnect_0/ARESETN] \
[get_bd_pins axi_interconnect_0/M00_ARESETN] \
[get_bd_pins axi_interconnect_0/M01_ARESETN] \
[get_bd_pins axi_interconnect_0/S00_ARESETN] \
[get_bd_pins processing_system7_0/FCLK_RESET0_N]
connect_bd_net [get_bd_pins processing_system7_0/GPIO_O] \
[get_bd_pins xlslice_0/Din] \
[get_bd_pins xlslice_1/Din]
connect_bd_net [get_bd_pins axi_intc_0/irq] \
[get_bd_pins processing_system7_0/IRQ_F2P]
##################################################################################################

##################################################################################################
#                                     Set Memory Address Map                                     #
##################################################################################################
# Zynq memory address map
assign_bd_address -offset 0x41800000 -range 0x00010000 -target_address_space /processing_system7_0/Data \
[get_bd_addr_segs axi_intc_0/S_AXI/Reg] -force
assign_bd_address -offset 0x40000000 -range 0x00080000 -target_address_space /processing_system7_0/Data \
[get_bd_addr_segs $soft_processor/axi_bram_ctrl_0/S_AXI/Mem0] -force

# Microblaze instruction memory address map
assign_bd_address -offset 0x00000000 -range 0x00080000 -target_address_space $soft_processor/microblaze_0/Instruction \
[get_bd_addr_segs $soft_processor/microblaze_local_memory_0/ilmb_bram_ctrl_0/SLMB1/Mem] -force

# Microblaze data memory address map
assign_bd_address -offset 0x00000000 -range 0x00080000 -target_address_space $soft_processor/microblaze_0/Data \
[get_bd_addr_segs $soft_processor/microblaze_local_memory_0/ilmb_bram_ctrl_0/SLMB/Mem] -force

assign_bd_address -offset 0x40002800 -range 0x00000400 -target_address_space $soft_processor/microblaze_0/Data \
[get_bd_addr_segs axi_clock_divider_0/S00_AXI/S00_AXI_reg] -force

assign_bd_address -offset 0x40000000 -range 0x00000400 -target_address_space $soft_processor/microblaze_0/Data \
[get_bd_addr_segs axi_gpio_0/S_AXI/Reg] -force

assign_bd_address -offset 0x40000400 -range 0x00000400 -target_address_space $soft_processor/microblaze_0/Data \
[get_bd_addr_segs axi_gpio_1/S_AXI/Reg] -force

assign_bd_address -offset 0x40000800 -range 0x00000400 -target_address_space $soft_processor/microblaze_0/Data \
[get_bd_addr_segs axi_gpio_2/S_AXI/Reg] -force

assign_bd_address -offset 0x40000C00 -range 0x00000400 -target_address_space $soft_processor/microblaze_0/Data \
[get_bd_addr_segs axi_gpio_3/S_AXI/Reg] -force

assign_bd_address -offset 0x40001000 -range 0x00000400 -target_address_space $soft_processor/microblaze_0/Data \
[get_bd_addr_segs axi_gpio_4/S_AXI/Reg] -force

assign_bd_address -offset 0x40002C00 -range 0x00000400 -target_address_space $soft_processor/microblaze_0/Data \
[get_bd_addr_segs axi_gpio_5/S_AXI/Reg] -force

assign_bd_address -offset 0x40001400 -range 0x00000400 -target_address_space $soft_processor/microblaze_0/Data \
[get_bd_addr_segs $soft_processor/axi_intc_0/S_AXI/Reg] -force

assign_bd_address -offset 0x40001800 -range 0x00000400 -target_address_space $soft_processor/microblaze_0/Data \
[get_bd_addr_segs $soft_processor/axi_timer_0/S_AXI/Reg] -force

assign_bd_address -offset 0x40001C00 -range 0x00000400 -target_address_space $soft_processor/microblaze_0/Data \
[get_bd_addr_segs $soft_processor/axi_timer_1/S_AXI/Reg] -force

assign_bd_address -offset 0x40002000 -range 0x00000400 -target_address_space $soft_processor/microblaze_0/Data \
[get_bd_addr_segs $soft_processor/axi_timer_2/S_AXI/Reg] -force

assign_bd_address -offset 0x40002400 -range 0x00000400 -target_address_space $soft_processor/microblaze_0/Data \
[get_bd_addr_segs $soft_processor/axi_gpio_0/S_AXI/Reg] -force

assign_bd_address -offset 0x40800000 -range 0x00010000 -target_address_space $soft_processor/microblaze_0/Data \
[get_bd_addr_segs axi_iic_0/S_AXI/Reg] -force

assign_bd_address -offset 0x40810000 -range 0x00010000 -target_address_space $soft_processor/microblaze_0/Data \
[get_bd_addr_segs axi_quad_spi_0/AXI_LITE/Reg] -force
##################################################################################################

##################################################################################################
#                                       Validate Top Design                                      #
##################################################################################################
regenerate_bd_layout
validate_bd_design
save_bd_design