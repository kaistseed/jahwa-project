//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Mon Sep 11 11:37:21 2023
//Host        : DLT-SEED-PC running 64-bit major release  (build 9200)
//Command     : generate_target jahwa_daq_system.bd
//Design      : jahwa_daq_system
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "jahwa_daq_system,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=jahwa_daq_system,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=55,numReposBlks=33,numNonXlnxBlks=0,numHierBlks=22,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_ps7_cnt=3,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "jahwa_daq_system.hwdef" *) 
module jahwa_daq_system
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    IIC_scl_i,
    IIC_scl_o,
    IIC_scl_t,
    IIC_sda_i,
    IIC_sda_o,
    IIC_sda_t,
    PYNQ_CNV_tri_o,
    PYNQ_MB_DEBUG_tri_o,
    PYNQ_SDN1_tri_o,
    PYNQ_SDN2_tri_o,
    PYNQ_SDN3_tri_o,
    REL1_tri_o,
    REL2_tri_o,
    RST_DEBUG,
    SPI_io0_i,
    SPI_io0_o,
    SPI_io0_t,
    SPI_io1_i,
    SPI_io1_o,
    SPI_io1_t,
    SPI_sck_i,
    SPI_sck_o,
    SPI_sck_t,
    SPI_ss_i,
    SPI_ss_o,
    SPI_ss_t,
    TRIG);
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DDR, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) inout [14:0]DDR_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR BA" *) inout [2:0]DDR_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CAS_N" *) inout DDR_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_N" *) inout DDR_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_P" *) inout DDR_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CKE" *) inout DDR_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CS_N" *) inout DDR_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DM" *) inout [3:0]DDR_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQ" *) inout [31:0]DDR_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_N" *) inout [3:0]DDR_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_P" *) inout [3:0]DDR_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ODT" *) inout DDR_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RAS_N" *) inout DDR_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RESET_N" *) inout DDR_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR WE_N" *) inout DDR_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false" *) inout FIXED_IO_ddr_vrn;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP" *) inout FIXED_IO_ddr_vrp;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO" *) inout [53:0]FIXED_IO_mio;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK" *) inout FIXED_IO_ps_clk;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB" *) inout FIXED_IO_ps_porb;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB" *) inout FIXED_IO_ps_srstb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 IIC SCL_I" *) input IIC_scl_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 IIC SCL_O" *) output IIC_scl_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 IIC SCL_T" *) output IIC_scl_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 IIC SDA_I" *) input IIC_sda_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 IIC SDA_O" *) output IIC_sda_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 IIC SDA_T" *) output IIC_sda_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 PYNQ_CNV TRI_O" *) output [0:0]PYNQ_CNV_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 PYNQ_MB_DEBUG TRI_O" *) output [3:0]PYNQ_MB_DEBUG_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 PYNQ_SDN1 TRI_O" *) output [0:0]PYNQ_SDN1_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 PYNQ_SDN2 TRI_O" *) output [0:0]PYNQ_SDN2_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 PYNQ_SDN3 TRI_O" *) output [0:0]PYNQ_SDN3_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 REL1 TRI_O" *) output [0:0]REL1_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 REL2 TRI_O" *) output [0:0]REL2_tri_o;
  output RST_DEBUG;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI IO0_I" *) input SPI_io0_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI IO0_O" *) output SPI_io0_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI IO0_T" *) output SPI_io0_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI IO1_I" *) input SPI_io1_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI IO1_O" *) output SPI_io1_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI IO1_T" *) output SPI_io1_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI SCK_I" *) input SPI_sck_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI SCK_O" *) output SPI_sck_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI SCK_T" *) output SPI_sck_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI SS_I" *) input [1:0]SPI_ss_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI SS_O" *) output [1:0]SPI_ss_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI SS_T" *) output SPI_ss_t;
  output TRIG;

  wire S_AXI_ARESETN_1;
  wire axi_clock_divider_0_O_CLK_DIV;
  wire [3:0]axi_gpio_0_GPIO_TRI_O;
  wire [0:0]axi_gpio_1_GPIO_TRI_O;
  wire [0:0]axi_gpio_2_GPIO_TRI_O;
  wire [0:0]axi_gpio_3_GPIO_TRI_O;
  wire [0:0]axi_gpio_4_GPIO_TRI_O;
  wire [0:0]axi_gpio_5_GPIO2_TRI_O;
  wire [0:0]axi_gpio_5_GPIO_TRI_O;
  wire axi_iic_0_IIC_SCL_I;
  wire axi_iic_0_IIC_SCL_O;
  wire axi_iic_0_IIC_SCL_T;
  wire axi_iic_0_IIC_SDA_I;
  wire axi_iic_0_IIC_SDA_O;
  wire axi_iic_0_IIC_SDA_T;
  wire axi_intc_0_irq;
  wire axi_quad_spi_0_SPI_0_IO0_I;
  wire axi_quad_spi_0_SPI_0_IO0_O;
  wire axi_quad_spi_0_SPI_0_IO0_T;
  wire axi_quad_spi_0_SPI_0_IO1_I;
  wire axi_quad_spi_0_SPI_0_IO1_O;
  wire axi_quad_spi_0_SPI_0_IO1_T;
  wire axi_quad_spi_0_SPI_0_SCK_I;
  wire axi_quad_spi_0_SPI_0_SCK_O;
  wire axi_quad_spi_0_SPI_0_SCK_T;
  wire [1:0]axi_quad_spi_0_SPI_0_SS_I;
  wire [1:0]axi_quad_spi_0_SPI_0_SS_O;
  wire axi_quad_spi_0_SPI_0_SS_T;
  wire [0:0]mb_softprocessor_0_PERIPHERAL_ARESETN;
  wire [0:0]mb_softprocessor_0_Q;
  wire mb_softprocessor_0_RST_DEBUG;
  wire [14:0]processing_system7_0_DDR_ADDR;
  wire [2:0]processing_system7_0_DDR_BA;
  wire processing_system7_0_DDR_CAS_N;
  wire processing_system7_0_DDR_CKE;
  wire processing_system7_0_DDR_CK_N;
  wire processing_system7_0_DDR_CK_P;
  wire processing_system7_0_DDR_CS_N;
  wire [3:0]processing_system7_0_DDR_DM;
  wire [31:0]processing_system7_0_DDR_DQ;
  wire [3:0]processing_system7_0_DDR_DQS_N;
  wire [3:0]processing_system7_0_DDR_DQS_P;
  wire processing_system7_0_DDR_ODT;
  wire processing_system7_0_DDR_RAS_N;
  wire processing_system7_0_DDR_RESET_N;
  wire processing_system7_0_DDR_WE_N;
  wire processing_system7_0_FIXED_IO_DDR_VRN;
  wire processing_system7_0_FIXED_IO_DDR_VRP;
  wire [53:0]processing_system7_0_FIXED_IO_MIO;
  wire processing_system7_0_FIXED_IO_PS_CLK;
  wire processing_system7_0_FIXED_IO_PS_PORB;
  wire processing_system7_0_FIXED_IO_PS_SRSTB;
  wire [1:0]processing_system7_0_GPIO_O;
  wire [31:0]processing_system7_0_M_AXI_GP0_ARADDR;
  wire [1:0]processing_system7_0_M_AXI_GP0_ARBURST;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARCACHE;
  wire [11:0]processing_system7_0_M_AXI_GP0_ARID;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARLEN;
  wire [1:0]processing_system7_0_M_AXI_GP0_ARLOCK;
  wire [2:0]processing_system7_0_M_AXI_GP0_ARPROT;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARQOS;
  wire processing_system7_0_M_AXI_GP0_ARREADY;
  wire [2:0]processing_system7_0_M_AXI_GP0_ARSIZE;
  wire processing_system7_0_M_AXI_GP0_ARVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_AWADDR;
  wire [1:0]processing_system7_0_M_AXI_GP0_AWBURST;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWCACHE;
  wire [11:0]processing_system7_0_M_AXI_GP0_AWID;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWLEN;
  wire [1:0]processing_system7_0_M_AXI_GP0_AWLOCK;
  wire [2:0]processing_system7_0_M_AXI_GP0_AWPROT;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWQOS;
  wire processing_system7_0_M_AXI_GP0_AWREADY;
  wire [2:0]processing_system7_0_M_AXI_GP0_AWSIZE;
  wire processing_system7_0_M_AXI_GP0_AWVALID;
  wire [11:0]processing_system7_0_M_AXI_GP0_BID;
  wire processing_system7_0_M_AXI_GP0_BREADY;
  wire [1:0]processing_system7_0_M_AXI_GP0_BRESP;
  wire processing_system7_0_M_AXI_GP0_BVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_RDATA;
  wire [11:0]processing_system7_0_M_AXI_GP0_RID;
  wire processing_system7_0_M_AXI_GP0_RLAST;
  wire processing_system7_0_M_AXI_GP0_RREADY;
  wire [1:0]processing_system7_0_M_AXI_GP0_RRESP;
  wire processing_system7_0_M_AXI_GP0_RVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_WDATA;
  wire [11:0]processing_system7_0_M_AXI_GP0_WID;
  wire processing_system7_0_M_AXI_GP0_WLAST;
  wire processing_system7_0_M_AXI_GP0_WREADY;
  wire [3:0]processing_system7_0_M_AXI_GP0_WSTRB;
  wire processing_system7_0_M_AXI_GP0_WVALID;
  wire [31:0]softprocessor_M05_axi_ARADDR;
  wire softprocessor_M05_axi_ARREADY;
  wire [0:0]softprocessor_M05_axi_ARVALID;
  wire [31:0]softprocessor_M05_axi_AWADDR;
  wire softprocessor_M05_axi_AWREADY;
  wire [0:0]softprocessor_M05_axi_AWVALID;
  wire [0:0]softprocessor_M05_axi_BREADY;
  wire [1:0]softprocessor_M05_axi_BRESP;
  wire softprocessor_M05_axi_BVALID;
  wire [31:0]softprocessor_M05_axi_RDATA;
  wire [0:0]softprocessor_M05_axi_RREADY;
  wire [1:0]softprocessor_M05_axi_RRESP;
  wire softprocessor_M05_axi_RVALID;
  wire [31:0]softprocessor_M05_axi_WDATA;
  wire softprocessor_M05_axi_WREADY;
  wire [3:0]softprocessor_M05_axi_WSTRB;
  wire [0:0]softprocessor_M05_axi_WVALID;
  wire [31:0]softprocessor_M06_axi_ARADDR;
  wire softprocessor_M06_axi_ARREADY;
  wire [0:0]softprocessor_M06_axi_ARVALID;
  wire [31:0]softprocessor_M06_axi_AWADDR;
  wire softprocessor_M06_axi_AWREADY;
  wire [0:0]softprocessor_M06_axi_AWVALID;
  wire [0:0]softprocessor_M06_axi_BREADY;
  wire [1:0]softprocessor_M06_axi_BRESP;
  wire softprocessor_M06_axi_BVALID;
  wire [31:0]softprocessor_M06_axi_RDATA;
  wire [0:0]softprocessor_M06_axi_RREADY;
  wire [1:0]softprocessor_M06_axi_RRESP;
  wire softprocessor_M06_axi_RVALID;
  wire [31:0]softprocessor_M06_axi_WDATA;
  wire softprocessor_M06_axi_WREADY;
  wire [3:0]softprocessor_M06_axi_WSTRB;
  wire [0:0]softprocessor_M06_axi_WVALID;
  wire [31:0]softprocessor_M07_axi_ARADDR;
  wire [2:0]softprocessor_M07_axi_ARPROT;
  wire softprocessor_M07_axi_ARREADY;
  wire [0:0]softprocessor_M07_axi_ARVALID;
  wire [31:0]softprocessor_M07_axi_AWADDR;
  wire [2:0]softprocessor_M07_axi_AWPROT;
  wire softprocessor_M07_axi_AWREADY;
  wire [0:0]softprocessor_M07_axi_AWVALID;
  wire [0:0]softprocessor_M07_axi_BREADY;
  wire [1:0]softprocessor_M07_axi_BRESP;
  wire softprocessor_M07_axi_BVALID;
  wire [31:0]softprocessor_M07_axi_RDATA;
  wire [0:0]softprocessor_M07_axi_RREADY;
  wire [1:0]softprocessor_M07_axi_RRESP;
  wire softprocessor_M07_axi_RVALID;
  wire [31:0]softprocessor_M07_axi_WDATA;
  wire softprocessor_M07_axi_WREADY;
  wire [3:0]softprocessor_M07_axi_WSTRB;
  wire [0:0]softprocessor_M07_axi_WVALID;
  wire [31:0]softprocessor_M08_axi_ARADDR;
  wire softprocessor_M08_axi_ARREADY;
  wire [0:0]softprocessor_M08_axi_ARVALID;
  wire [31:0]softprocessor_M08_axi_AWADDR;
  wire softprocessor_M08_axi_AWREADY;
  wire [0:0]softprocessor_M08_axi_AWVALID;
  wire [0:0]softprocessor_M08_axi_BREADY;
  wire [1:0]softprocessor_M08_axi_BRESP;
  wire softprocessor_M08_axi_BVALID;
  wire [31:0]softprocessor_M08_axi_RDATA;
  wire [0:0]softprocessor_M08_axi_RREADY;
  wire [1:0]softprocessor_M08_axi_RRESP;
  wire softprocessor_M08_axi_RVALID;
  wire [31:0]softprocessor_M08_axi_WDATA;
  wire softprocessor_M08_axi_WREADY;
  wire [3:0]softprocessor_M08_axi_WSTRB;
  wire [0:0]softprocessor_M08_axi_WVALID;
  wire [31:0]softprocessor_M09_axi_ARADDR;
  wire softprocessor_M09_axi_ARREADY;
  wire [0:0]softprocessor_M09_axi_ARVALID;
  wire [31:0]softprocessor_M09_axi_AWADDR;
  wire softprocessor_M09_axi_AWREADY;
  wire [0:0]softprocessor_M09_axi_AWVALID;
  wire [0:0]softprocessor_M09_axi_BREADY;
  wire [1:0]softprocessor_M09_axi_BRESP;
  wire softprocessor_M09_axi_BVALID;
  wire [31:0]softprocessor_M09_axi_RDATA;
  wire [0:0]softprocessor_M09_axi_RREADY;
  wire [1:0]softprocessor_M09_axi_RRESP;
  wire softprocessor_M09_axi_RVALID;
  wire [31:0]softprocessor_M09_axi_WDATA;
  wire softprocessor_M09_axi_WREADY;
  wire [3:0]softprocessor_M09_axi_WSTRB;
  wire [0:0]softprocessor_M09_axi_WVALID;
  wire [31:0]softprocessor_M10_axi_ARADDR;
  wire softprocessor_M10_axi_ARREADY;
  wire [0:0]softprocessor_M10_axi_ARVALID;
  wire [31:0]softprocessor_M10_axi_AWADDR;
  wire softprocessor_M10_axi_AWREADY;
  wire [0:0]softprocessor_M10_axi_AWVALID;
  wire [0:0]softprocessor_M10_axi_BREADY;
  wire [1:0]softprocessor_M10_axi_BRESP;
  wire softprocessor_M10_axi_BVALID;
  wire [31:0]softprocessor_M10_axi_RDATA;
  wire [0:0]softprocessor_M10_axi_RREADY;
  wire [1:0]softprocessor_M10_axi_RRESP;
  wire softprocessor_M10_axi_RVALID;
  wire [31:0]softprocessor_M10_axi_WDATA;
  wire softprocessor_M10_axi_WREADY;
  wire [3:0]softprocessor_M10_axi_WSTRB;
  wire [0:0]softprocessor_M10_axi_WVALID;
  wire [31:0]softprocessor_M11_axi_ARADDR;
  wire softprocessor_M11_axi_ARREADY;
  wire [0:0]softprocessor_M11_axi_ARVALID;
  wire [31:0]softprocessor_M11_axi_AWADDR;
  wire softprocessor_M11_axi_AWREADY;
  wire [0:0]softprocessor_M11_axi_AWVALID;
  wire [0:0]softprocessor_M11_axi_BREADY;
  wire [1:0]softprocessor_M11_axi_BRESP;
  wire softprocessor_M11_axi_BVALID;
  wire [31:0]softprocessor_M11_axi_RDATA;
  wire [0:0]softprocessor_M11_axi_RREADY;
  wire [1:0]softprocessor_M11_axi_RRESP;
  wire softprocessor_M11_axi_RVALID;
  wire [31:0]softprocessor_M11_axi_WDATA;
  wire softprocessor_M11_axi_WREADY;
  wire [3:0]softprocessor_M11_axi_WSTRB;
  wire [0:0]softprocessor_M11_axi_WVALID;
  wire [31:0]softprocessor_M12_axi_ARADDR;
  wire softprocessor_M12_axi_ARREADY;
  wire [0:0]softprocessor_M12_axi_ARVALID;
  wire [31:0]softprocessor_M12_axi_AWADDR;
  wire softprocessor_M12_axi_AWREADY;
  wire [0:0]softprocessor_M12_axi_AWVALID;
  wire [0:0]softprocessor_M12_axi_BREADY;
  wire [1:0]softprocessor_M12_axi_BRESP;
  wire softprocessor_M12_axi_BVALID;
  wire [31:0]softprocessor_M12_axi_RDATA;
  wire [0:0]softprocessor_M12_axi_RREADY;
  wire [1:0]softprocessor_M12_axi_RRESP;
  wire softprocessor_M12_axi_RVALID;
  wire [31:0]softprocessor_M12_axi_WDATA;
  wire softprocessor_M12_axi_WREADY;
  wire [3:0]softprocessor_M12_axi_WSTRB;
  wire [0:0]softprocessor_M12_axi_WVALID;
  wire [31:0]softprocessor_M13_axi_ARADDR;
  wire softprocessor_M13_axi_ARREADY;
  wire [0:0]softprocessor_M13_axi_ARVALID;
  wire [31:0]softprocessor_M13_axi_AWADDR;
  wire softprocessor_M13_axi_AWREADY;
  wire [0:0]softprocessor_M13_axi_AWVALID;
  wire [0:0]softprocessor_M13_axi_BREADY;
  wire [1:0]softprocessor_M13_axi_BRESP;
  wire softprocessor_M13_axi_BVALID;
  wire [31:0]softprocessor_M13_axi_RDATA;
  wire [0:0]softprocessor_M13_axi_RREADY;
  wire [1:0]softprocessor_M13_axi_RRESP;
  wire softprocessor_M13_axi_RVALID;
  wire [31:0]softprocessor_M13_axi_WDATA;
  wire softprocessor_M13_axi_WREADY;
  wire [3:0]softprocessor_M13_axi_WSTRB;
  wire [0:0]softprocessor_M13_axi_WVALID;
  wire softprocessor_clk;
  wire [0:0]xlslice_0_Dout;
  wire [0:0]xlslice_1_Dout;
  wire [31:0]zynq_axi_interconnect_0_M00_AXI_ARADDR;
  wire [1:0]zynq_axi_interconnect_0_M00_AXI_ARBURST;
  wire [3:0]zynq_axi_interconnect_0_M00_AXI_ARCACHE;
  wire [11:0]zynq_axi_interconnect_0_M00_AXI_ARID;
  wire [7:0]zynq_axi_interconnect_0_M00_AXI_ARLEN;
  wire zynq_axi_interconnect_0_M00_AXI_ARLOCK;
  wire [2:0]zynq_axi_interconnect_0_M00_AXI_ARPROT;
  wire zynq_axi_interconnect_0_M00_AXI_ARREADY;
  wire [2:0]zynq_axi_interconnect_0_M00_AXI_ARSIZE;
  wire zynq_axi_interconnect_0_M00_AXI_ARVALID;
  wire [31:0]zynq_axi_interconnect_0_M00_AXI_AWADDR;
  wire [1:0]zynq_axi_interconnect_0_M00_AXI_AWBURST;
  wire [3:0]zynq_axi_interconnect_0_M00_AXI_AWCACHE;
  wire [11:0]zynq_axi_interconnect_0_M00_AXI_AWID;
  wire [7:0]zynq_axi_interconnect_0_M00_AXI_AWLEN;
  wire zynq_axi_interconnect_0_M00_AXI_AWLOCK;
  wire [2:0]zynq_axi_interconnect_0_M00_AXI_AWPROT;
  wire zynq_axi_interconnect_0_M00_AXI_AWREADY;
  wire [2:0]zynq_axi_interconnect_0_M00_AXI_AWSIZE;
  wire zynq_axi_interconnect_0_M00_AXI_AWVALID;
  wire [11:0]zynq_axi_interconnect_0_M00_AXI_BID;
  wire zynq_axi_interconnect_0_M00_AXI_BREADY;
  wire [1:0]zynq_axi_interconnect_0_M00_AXI_BRESP;
  wire zynq_axi_interconnect_0_M00_AXI_BVALID;
  wire [31:0]zynq_axi_interconnect_0_M00_AXI_RDATA;
  wire [11:0]zynq_axi_interconnect_0_M00_AXI_RID;
  wire zynq_axi_interconnect_0_M00_AXI_RLAST;
  wire zynq_axi_interconnect_0_M00_AXI_RREADY;
  wire [1:0]zynq_axi_interconnect_0_M00_AXI_RRESP;
  wire zynq_axi_interconnect_0_M00_AXI_RVALID;
  wire [31:0]zynq_axi_interconnect_0_M00_AXI_WDATA;
  wire zynq_axi_interconnect_0_M00_AXI_WLAST;
  wire zynq_axi_interconnect_0_M00_AXI_WREADY;
  wire [3:0]zynq_axi_interconnect_0_M00_AXI_WSTRB;
  wire zynq_axi_interconnect_0_M00_AXI_WVALID;
  wire [31:0]zynq_axi_interconnect_0_M01_AXI_ARADDR;
  wire zynq_axi_interconnect_0_M01_AXI_ARREADY;
  wire zynq_axi_interconnect_0_M01_AXI_ARVALID;
  wire [31:0]zynq_axi_interconnect_0_M01_AXI_AWADDR;
  wire zynq_axi_interconnect_0_M01_AXI_AWREADY;
  wire zynq_axi_interconnect_0_M01_AXI_AWVALID;
  wire zynq_axi_interconnect_0_M01_AXI_BREADY;
  wire [1:0]zynq_axi_interconnect_0_M01_AXI_BRESP;
  wire zynq_axi_interconnect_0_M01_AXI_BVALID;
  wire [31:0]zynq_axi_interconnect_0_M01_AXI_RDATA;
  wire zynq_axi_interconnect_0_M01_AXI_RREADY;
  wire [1:0]zynq_axi_interconnect_0_M01_AXI_RRESP;
  wire zynq_axi_interconnect_0_M01_AXI_RVALID;
  wire [31:0]zynq_axi_interconnect_0_M01_AXI_WDATA;
  wire zynq_axi_interconnect_0_M01_AXI_WREADY;
  wire [3:0]zynq_axi_interconnect_0_M01_AXI_WSTRB;
  wire zynq_axi_interconnect_0_M01_AXI_WVALID;

  assign IIC_scl_o = axi_iic_0_IIC_SCL_O;
  assign IIC_scl_t = axi_iic_0_IIC_SCL_T;
  assign IIC_sda_o = axi_iic_0_IIC_SDA_O;
  assign IIC_sda_t = axi_iic_0_IIC_SDA_T;
  assign PYNQ_CNV_tri_o[0] = axi_gpio_1_GPIO_TRI_O;
  assign PYNQ_MB_DEBUG_tri_o[3:0] = axi_gpio_0_GPIO_TRI_O;
  assign PYNQ_SDN1_tri_o[0] = axi_gpio_2_GPIO_TRI_O;
  assign PYNQ_SDN2_tri_o[0] = axi_gpio_3_GPIO_TRI_O;
  assign PYNQ_SDN3_tri_o[0] = axi_gpio_4_GPIO_TRI_O;
  assign REL1_tri_o[0] = axi_gpio_5_GPIO_TRI_O;
  assign REL2_tri_o[0] = axi_gpio_5_GPIO2_TRI_O;
  assign RST_DEBUG = mb_softprocessor_0_RST_DEBUG;
  assign SPI_io0_o = axi_quad_spi_0_SPI_0_IO0_O;
  assign SPI_io0_t = axi_quad_spi_0_SPI_0_IO0_T;
  assign SPI_io1_o = axi_quad_spi_0_SPI_0_IO1_O;
  assign SPI_io1_t = axi_quad_spi_0_SPI_0_IO1_T;
  assign SPI_sck_o = axi_quad_spi_0_SPI_0_SCK_O;
  assign SPI_sck_t = axi_quad_spi_0_SPI_0_SCK_T;
  assign SPI_ss_o[1:0] = axi_quad_spi_0_SPI_0_SS_O;
  assign SPI_ss_t = axi_quad_spi_0_SPI_0_SS_T;
  assign TRIG = axi_clock_divider_0_O_CLK_DIV;
  assign axi_iic_0_IIC_SCL_I = IIC_scl_i;
  assign axi_iic_0_IIC_SDA_I = IIC_sda_i;
  assign axi_quad_spi_0_SPI_0_IO0_I = SPI_io0_i;
  assign axi_quad_spi_0_SPI_0_IO1_I = SPI_io1_i;
  assign axi_quad_spi_0_SPI_0_SCK_I = SPI_sck_i;
  assign axi_quad_spi_0_SPI_0_SS_I = SPI_ss_i[1:0];
  jahwa_daq_system_axi_clock_divider_0_0 axi_clock_divider_0
       (.O_CLK_DIV(axi_clock_divider_0_O_CLK_DIV),
        .s00_axi_aclk(softprocessor_clk),
        .s00_axi_araddr(softprocessor_M07_axi_ARADDR[4:0]),
        .s00_axi_aresetn(mb_softprocessor_0_PERIPHERAL_ARESETN),
        .s00_axi_arprot(softprocessor_M07_axi_ARPROT),
        .s00_axi_arready(softprocessor_M07_axi_ARREADY),
        .s00_axi_arvalid(softprocessor_M07_axi_ARVALID),
        .s00_axi_awaddr(softprocessor_M07_axi_AWADDR[4:0]),
        .s00_axi_awprot(softprocessor_M07_axi_AWPROT),
        .s00_axi_awready(softprocessor_M07_axi_AWREADY),
        .s00_axi_awvalid(softprocessor_M07_axi_AWVALID),
        .s00_axi_bready(softprocessor_M07_axi_BREADY),
        .s00_axi_bresp(softprocessor_M07_axi_BRESP),
        .s00_axi_bvalid(softprocessor_M07_axi_BVALID),
        .s00_axi_rdata(softprocessor_M07_axi_RDATA),
        .s00_axi_rready(softprocessor_M07_axi_RREADY),
        .s00_axi_rresp(softprocessor_M07_axi_RRESP),
        .s00_axi_rvalid(softprocessor_M07_axi_RVALID),
        .s00_axi_wdata(softprocessor_M07_axi_WDATA),
        .s00_axi_wready(softprocessor_M07_axi_WREADY),
        .s00_axi_wstrb(softprocessor_M07_axi_WSTRB),
        .s00_axi_wvalid(softprocessor_M07_axi_WVALID));
  jahwa_daq_system_axi_gpio_0_0 axi_gpio_0
       (.gpio_io_o(axi_gpio_0_GPIO_TRI_O),
        .s_axi_aclk(softprocessor_clk),
        .s_axi_araddr(softprocessor_M08_axi_ARADDR[8:0]),
        .s_axi_aresetn(mb_softprocessor_0_PERIPHERAL_ARESETN),
        .s_axi_arready(softprocessor_M08_axi_ARREADY),
        .s_axi_arvalid(softprocessor_M08_axi_ARVALID),
        .s_axi_awaddr(softprocessor_M08_axi_AWADDR[8:0]),
        .s_axi_awready(softprocessor_M08_axi_AWREADY),
        .s_axi_awvalid(softprocessor_M08_axi_AWVALID),
        .s_axi_bready(softprocessor_M08_axi_BREADY),
        .s_axi_bresp(softprocessor_M08_axi_BRESP),
        .s_axi_bvalid(softprocessor_M08_axi_BVALID),
        .s_axi_rdata(softprocessor_M08_axi_RDATA),
        .s_axi_rready(softprocessor_M08_axi_RREADY),
        .s_axi_rresp(softprocessor_M08_axi_RRESP),
        .s_axi_rvalid(softprocessor_M08_axi_RVALID),
        .s_axi_wdata(softprocessor_M08_axi_WDATA),
        .s_axi_wready(softprocessor_M08_axi_WREADY),
        .s_axi_wstrb(softprocessor_M08_axi_WSTRB),
        .s_axi_wvalid(softprocessor_M08_axi_WVALID));
  jahwa_daq_system_axi_gpio_1_0 axi_gpio_1
       (.gpio_io_o(axi_gpio_1_GPIO_TRI_O),
        .s_axi_aclk(softprocessor_clk),
        .s_axi_araddr(softprocessor_M09_axi_ARADDR[8:0]),
        .s_axi_aresetn(mb_softprocessor_0_PERIPHERAL_ARESETN),
        .s_axi_arready(softprocessor_M09_axi_ARREADY),
        .s_axi_arvalid(softprocessor_M09_axi_ARVALID),
        .s_axi_awaddr(softprocessor_M09_axi_AWADDR[8:0]),
        .s_axi_awready(softprocessor_M09_axi_AWREADY),
        .s_axi_awvalid(softprocessor_M09_axi_AWVALID),
        .s_axi_bready(softprocessor_M09_axi_BREADY),
        .s_axi_bresp(softprocessor_M09_axi_BRESP),
        .s_axi_bvalid(softprocessor_M09_axi_BVALID),
        .s_axi_rdata(softprocessor_M09_axi_RDATA),
        .s_axi_rready(softprocessor_M09_axi_RREADY),
        .s_axi_rresp(softprocessor_M09_axi_RRESP),
        .s_axi_rvalid(softprocessor_M09_axi_RVALID),
        .s_axi_wdata(softprocessor_M09_axi_WDATA),
        .s_axi_wready(softprocessor_M09_axi_WREADY),
        .s_axi_wstrb(softprocessor_M09_axi_WSTRB),
        .s_axi_wvalid(softprocessor_M09_axi_WVALID));
  jahwa_daq_system_axi_gpio_2_0 axi_gpio_2
       (.gpio_io_o(axi_gpio_2_GPIO_TRI_O),
        .s_axi_aclk(softprocessor_clk),
        .s_axi_araddr(softprocessor_M10_axi_ARADDR[8:0]),
        .s_axi_aresetn(mb_softprocessor_0_PERIPHERAL_ARESETN),
        .s_axi_arready(softprocessor_M10_axi_ARREADY),
        .s_axi_arvalid(softprocessor_M10_axi_ARVALID),
        .s_axi_awaddr(softprocessor_M10_axi_AWADDR[8:0]),
        .s_axi_awready(softprocessor_M10_axi_AWREADY),
        .s_axi_awvalid(softprocessor_M10_axi_AWVALID),
        .s_axi_bready(softprocessor_M10_axi_BREADY),
        .s_axi_bresp(softprocessor_M10_axi_BRESP),
        .s_axi_bvalid(softprocessor_M10_axi_BVALID),
        .s_axi_rdata(softprocessor_M10_axi_RDATA),
        .s_axi_rready(softprocessor_M10_axi_RREADY),
        .s_axi_rresp(softprocessor_M10_axi_RRESP),
        .s_axi_rvalid(softprocessor_M10_axi_RVALID),
        .s_axi_wdata(softprocessor_M10_axi_WDATA),
        .s_axi_wready(softprocessor_M10_axi_WREADY),
        .s_axi_wstrb(softprocessor_M10_axi_WSTRB),
        .s_axi_wvalid(softprocessor_M10_axi_WVALID));
  jahwa_daq_system_axi_gpio_3_0 axi_gpio_3
       (.gpio_io_o(axi_gpio_3_GPIO_TRI_O),
        .s_axi_aclk(softprocessor_clk),
        .s_axi_araddr(softprocessor_M11_axi_ARADDR[8:0]),
        .s_axi_aresetn(mb_softprocessor_0_PERIPHERAL_ARESETN),
        .s_axi_arready(softprocessor_M11_axi_ARREADY),
        .s_axi_arvalid(softprocessor_M11_axi_ARVALID),
        .s_axi_awaddr(softprocessor_M11_axi_AWADDR[8:0]),
        .s_axi_awready(softprocessor_M11_axi_AWREADY),
        .s_axi_awvalid(softprocessor_M11_axi_AWVALID),
        .s_axi_bready(softprocessor_M11_axi_BREADY),
        .s_axi_bresp(softprocessor_M11_axi_BRESP),
        .s_axi_bvalid(softprocessor_M11_axi_BVALID),
        .s_axi_rdata(softprocessor_M11_axi_RDATA),
        .s_axi_rready(softprocessor_M11_axi_RREADY),
        .s_axi_rresp(softprocessor_M11_axi_RRESP),
        .s_axi_rvalid(softprocessor_M11_axi_RVALID),
        .s_axi_wdata(softprocessor_M11_axi_WDATA),
        .s_axi_wready(softprocessor_M11_axi_WREADY),
        .s_axi_wstrb(softprocessor_M11_axi_WSTRB),
        .s_axi_wvalid(softprocessor_M11_axi_WVALID));
  jahwa_daq_system_axi_gpio_4_0 axi_gpio_4
       (.gpio_io_o(axi_gpio_4_GPIO_TRI_O),
        .s_axi_aclk(softprocessor_clk),
        .s_axi_araddr(softprocessor_M12_axi_ARADDR[8:0]),
        .s_axi_aresetn(mb_softprocessor_0_PERIPHERAL_ARESETN),
        .s_axi_arready(softprocessor_M12_axi_ARREADY),
        .s_axi_arvalid(softprocessor_M12_axi_ARVALID),
        .s_axi_awaddr(softprocessor_M12_axi_AWADDR[8:0]),
        .s_axi_awready(softprocessor_M12_axi_AWREADY),
        .s_axi_awvalid(softprocessor_M12_axi_AWVALID),
        .s_axi_bready(softprocessor_M12_axi_BREADY),
        .s_axi_bresp(softprocessor_M12_axi_BRESP),
        .s_axi_bvalid(softprocessor_M12_axi_BVALID),
        .s_axi_rdata(softprocessor_M12_axi_RDATA),
        .s_axi_rready(softprocessor_M12_axi_RREADY),
        .s_axi_rresp(softprocessor_M12_axi_RRESP),
        .s_axi_rvalid(softprocessor_M12_axi_RVALID),
        .s_axi_wdata(softprocessor_M12_axi_WDATA),
        .s_axi_wready(softprocessor_M12_axi_WREADY),
        .s_axi_wstrb(softprocessor_M12_axi_WSTRB),
        .s_axi_wvalid(softprocessor_M12_axi_WVALID));
  jahwa_daq_system_axi_gpio_5_0 axi_gpio_5
       (.gpio2_io_o(axi_gpio_5_GPIO2_TRI_O),
        .gpio_io_o(axi_gpio_5_GPIO_TRI_O),
        .s_axi_aclk(softprocessor_clk),
        .s_axi_araddr(softprocessor_M13_axi_ARADDR[8:0]),
        .s_axi_aresetn(mb_softprocessor_0_PERIPHERAL_ARESETN),
        .s_axi_arready(softprocessor_M13_axi_ARREADY),
        .s_axi_arvalid(softprocessor_M13_axi_ARVALID),
        .s_axi_awaddr(softprocessor_M13_axi_AWADDR[8:0]),
        .s_axi_awready(softprocessor_M13_axi_AWREADY),
        .s_axi_awvalid(softprocessor_M13_axi_AWVALID),
        .s_axi_bready(softprocessor_M13_axi_BREADY),
        .s_axi_bresp(softprocessor_M13_axi_BRESP),
        .s_axi_bvalid(softprocessor_M13_axi_BVALID),
        .s_axi_rdata(softprocessor_M13_axi_RDATA),
        .s_axi_rready(softprocessor_M13_axi_RREADY),
        .s_axi_rresp(softprocessor_M13_axi_RRESP),
        .s_axi_rvalid(softprocessor_M13_axi_RVALID),
        .s_axi_wdata(softprocessor_M13_axi_WDATA),
        .s_axi_wready(softprocessor_M13_axi_WREADY),
        .s_axi_wstrb(softprocessor_M13_axi_WSTRB),
        .s_axi_wvalid(softprocessor_M13_axi_WVALID));
  jahwa_daq_system_axi_iic_0_0 axi_iic_0
       (.s_axi_aclk(softprocessor_clk),
        .s_axi_araddr(softprocessor_M05_axi_ARADDR[8:0]),
        .s_axi_aresetn(mb_softprocessor_0_PERIPHERAL_ARESETN),
        .s_axi_arready(softprocessor_M05_axi_ARREADY),
        .s_axi_arvalid(softprocessor_M05_axi_ARVALID),
        .s_axi_awaddr(softprocessor_M05_axi_AWADDR[8:0]),
        .s_axi_awready(softprocessor_M05_axi_AWREADY),
        .s_axi_awvalid(softprocessor_M05_axi_AWVALID),
        .s_axi_bready(softprocessor_M05_axi_BREADY),
        .s_axi_bresp(softprocessor_M05_axi_BRESP),
        .s_axi_bvalid(softprocessor_M05_axi_BVALID),
        .s_axi_rdata(softprocessor_M05_axi_RDATA),
        .s_axi_rready(softprocessor_M05_axi_RREADY),
        .s_axi_rresp(softprocessor_M05_axi_RRESP),
        .s_axi_rvalid(softprocessor_M05_axi_RVALID),
        .s_axi_wdata(softprocessor_M05_axi_WDATA),
        .s_axi_wready(softprocessor_M05_axi_WREADY),
        .s_axi_wstrb(softprocessor_M05_axi_WSTRB),
        .s_axi_wvalid(softprocessor_M05_axi_WVALID),
        .scl_i(axi_iic_0_IIC_SCL_I),
        .scl_o(axi_iic_0_IIC_SCL_O),
        .scl_t(axi_iic_0_IIC_SCL_T),
        .sda_i(axi_iic_0_IIC_SDA_I),
        .sda_o(axi_iic_0_IIC_SDA_O),
        .sda_t(axi_iic_0_IIC_SDA_T));
  jahwa_daq_system_axi_intc_0_0 axi_intc_0
       (.intr(mb_softprocessor_0_Q),
        .irq(axi_intc_0_irq),
        .s_axi_aclk(softprocessor_clk),
        .s_axi_araddr(zynq_axi_interconnect_0_M01_AXI_ARADDR[8:0]),
        .s_axi_aresetn(S_AXI_ARESETN_1),
        .s_axi_arready(zynq_axi_interconnect_0_M01_AXI_ARREADY),
        .s_axi_arvalid(zynq_axi_interconnect_0_M01_AXI_ARVALID),
        .s_axi_awaddr(zynq_axi_interconnect_0_M01_AXI_AWADDR[8:0]),
        .s_axi_awready(zynq_axi_interconnect_0_M01_AXI_AWREADY),
        .s_axi_awvalid(zynq_axi_interconnect_0_M01_AXI_AWVALID),
        .s_axi_bready(zynq_axi_interconnect_0_M01_AXI_BREADY),
        .s_axi_bresp(zynq_axi_interconnect_0_M01_AXI_BRESP),
        .s_axi_bvalid(zynq_axi_interconnect_0_M01_AXI_BVALID),
        .s_axi_rdata(zynq_axi_interconnect_0_M01_AXI_RDATA),
        .s_axi_rready(zynq_axi_interconnect_0_M01_AXI_RREADY),
        .s_axi_rresp(zynq_axi_interconnect_0_M01_AXI_RRESP),
        .s_axi_rvalid(zynq_axi_interconnect_0_M01_AXI_RVALID),
        .s_axi_wdata(zynq_axi_interconnect_0_M01_AXI_WDATA),
        .s_axi_wready(zynq_axi_interconnect_0_M01_AXI_WREADY),
        .s_axi_wstrb(zynq_axi_interconnect_0_M01_AXI_WSTRB),
        .s_axi_wvalid(zynq_axi_interconnect_0_M01_AXI_WVALID));
  jahwa_daq_system_axi_interconnect_0_0 axi_interconnect_0
       (.ACLK(softprocessor_clk),
        .ARESETN(S_AXI_ARESETN_1),
        .M00_ACLK(softprocessor_clk),
        .M00_ARESETN(S_AXI_ARESETN_1),
        .M00_AXI_araddr(zynq_axi_interconnect_0_M00_AXI_ARADDR),
        .M00_AXI_arburst(zynq_axi_interconnect_0_M00_AXI_ARBURST),
        .M00_AXI_arcache(zynq_axi_interconnect_0_M00_AXI_ARCACHE),
        .M00_AXI_arid(zynq_axi_interconnect_0_M00_AXI_ARID),
        .M00_AXI_arlen(zynq_axi_interconnect_0_M00_AXI_ARLEN),
        .M00_AXI_arlock(zynq_axi_interconnect_0_M00_AXI_ARLOCK),
        .M00_AXI_arprot(zynq_axi_interconnect_0_M00_AXI_ARPROT),
        .M00_AXI_arready(zynq_axi_interconnect_0_M00_AXI_ARREADY),
        .M00_AXI_arsize(zynq_axi_interconnect_0_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(zynq_axi_interconnect_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(zynq_axi_interconnect_0_M00_AXI_AWADDR),
        .M00_AXI_awburst(zynq_axi_interconnect_0_M00_AXI_AWBURST),
        .M00_AXI_awcache(zynq_axi_interconnect_0_M00_AXI_AWCACHE),
        .M00_AXI_awid(zynq_axi_interconnect_0_M00_AXI_AWID),
        .M00_AXI_awlen(zynq_axi_interconnect_0_M00_AXI_AWLEN),
        .M00_AXI_awlock(zynq_axi_interconnect_0_M00_AXI_AWLOCK),
        .M00_AXI_awprot(zynq_axi_interconnect_0_M00_AXI_AWPROT),
        .M00_AXI_awready(zynq_axi_interconnect_0_M00_AXI_AWREADY),
        .M00_AXI_awsize(zynq_axi_interconnect_0_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(zynq_axi_interconnect_0_M00_AXI_AWVALID),
        .M00_AXI_bid(zynq_axi_interconnect_0_M00_AXI_BID),
        .M00_AXI_bready(zynq_axi_interconnect_0_M00_AXI_BREADY),
        .M00_AXI_bresp(zynq_axi_interconnect_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(zynq_axi_interconnect_0_M00_AXI_BVALID),
        .M00_AXI_rdata(zynq_axi_interconnect_0_M00_AXI_RDATA),
        .M00_AXI_rid(zynq_axi_interconnect_0_M00_AXI_RID),
        .M00_AXI_rlast(zynq_axi_interconnect_0_M00_AXI_RLAST),
        .M00_AXI_rready(zynq_axi_interconnect_0_M00_AXI_RREADY),
        .M00_AXI_rresp(zynq_axi_interconnect_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(zynq_axi_interconnect_0_M00_AXI_RVALID),
        .M00_AXI_wdata(zynq_axi_interconnect_0_M00_AXI_WDATA),
        .M00_AXI_wlast(zynq_axi_interconnect_0_M00_AXI_WLAST),
        .M00_AXI_wready(zynq_axi_interconnect_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(zynq_axi_interconnect_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(zynq_axi_interconnect_0_M00_AXI_WVALID),
        .M01_ACLK(softprocessor_clk),
        .M01_ARESETN(S_AXI_ARESETN_1),
        .M01_AXI_araddr(zynq_axi_interconnect_0_M01_AXI_ARADDR),
        .M01_AXI_arready(zynq_axi_interconnect_0_M01_AXI_ARREADY),
        .M01_AXI_arvalid(zynq_axi_interconnect_0_M01_AXI_ARVALID),
        .M01_AXI_awaddr(zynq_axi_interconnect_0_M01_AXI_AWADDR),
        .M01_AXI_awready(zynq_axi_interconnect_0_M01_AXI_AWREADY),
        .M01_AXI_awvalid(zynq_axi_interconnect_0_M01_AXI_AWVALID),
        .M01_AXI_bready(zynq_axi_interconnect_0_M01_AXI_BREADY),
        .M01_AXI_bresp(zynq_axi_interconnect_0_M01_AXI_BRESP),
        .M01_AXI_bvalid(zynq_axi_interconnect_0_M01_AXI_BVALID),
        .M01_AXI_rdata(zynq_axi_interconnect_0_M01_AXI_RDATA),
        .M01_AXI_rready(zynq_axi_interconnect_0_M01_AXI_RREADY),
        .M01_AXI_rresp(zynq_axi_interconnect_0_M01_AXI_RRESP),
        .M01_AXI_rvalid(zynq_axi_interconnect_0_M01_AXI_RVALID),
        .M01_AXI_wdata(zynq_axi_interconnect_0_M01_AXI_WDATA),
        .M01_AXI_wready(zynq_axi_interconnect_0_M01_AXI_WREADY),
        .M01_AXI_wstrb(zynq_axi_interconnect_0_M01_AXI_WSTRB),
        .M01_AXI_wvalid(zynq_axi_interconnect_0_M01_AXI_WVALID),
        .S00_ACLK(softprocessor_clk),
        .S00_ARESETN(S_AXI_ARESETN_1),
        .S00_AXI_araddr(processing_system7_0_M_AXI_GP0_ARADDR),
        .S00_AXI_arburst(processing_system7_0_M_AXI_GP0_ARBURST),
        .S00_AXI_arcache(processing_system7_0_M_AXI_GP0_ARCACHE),
        .S00_AXI_arid(processing_system7_0_M_AXI_GP0_ARID),
        .S00_AXI_arlen(processing_system7_0_M_AXI_GP0_ARLEN),
        .S00_AXI_arlock(processing_system7_0_M_AXI_GP0_ARLOCK),
        .S00_AXI_arprot(processing_system7_0_M_AXI_GP0_ARPROT),
        .S00_AXI_arqos(processing_system7_0_M_AXI_GP0_ARQOS),
        .S00_AXI_arready(processing_system7_0_M_AXI_GP0_ARREADY),
        .S00_AXI_arsize(processing_system7_0_M_AXI_GP0_ARSIZE),
        .S00_AXI_arvalid(processing_system7_0_M_AXI_GP0_ARVALID),
        .S00_AXI_awaddr(processing_system7_0_M_AXI_GP0_AWADDR),
        .S00_AXI_awburst(processing_system7_0_M_AXI_GP0_AWBURST),
        .S00_AXI_awcache(processing_system7_0_M_AXI_GP0_AWCACHE),
        .S00_AXI_awid(processing_system7_0_M_AXI_GP0_AWID),
        .S00_AXI_awlen(processing_system7_0_M_AXI_GP0_AWLEN),
        .S00_AXI_awlock(processing_system7_0_M_AXI_GP0_AWLOCK),
        .S00_AXI_awprot(processing_system7_0_M_AXI_GP0_AWPROT),
        .S00_AXI_awqos(processing_system7_0_M_AXI_GP0_AWQOS),
        .S00_AXI_awready(processing_system7_0_M_AXI_GP0_AWREADY),
        .S00_AXI_awsize(processing_system7_0_M_AXI_GP0_AWSIZE),
        .S00_AXI_awvalid(processing_system7_0_M_AXI_GP0_AWVALID),
        .S00_AXI_bid(processing_system7_0_M_AXI_GP0_BID),
        .S00_AXI_bready(processing_system7_0_M_AXI_GP0_BREADY),
        .S00_AXI_bresp(processing_system7_0_M_AXI_GP0_BRESP),
        .S00_AXI_bvalid(processing_system7_0_M_AXI_GP0_BVALID),
        .S00_AXI_rdata(processing_system7_0_M_AXI_GP0_RDATA),
        .S00_AXI_rid(processing_system7_0_M_AXI_GP0_RID),
        .S00_AXI_rlast(processing_system7_0_M_AXI_GP0_RLAST),
        .S00_AXI_rready(processing_system7_0_M_AXI_GP0_RREADY),
        .S00_AXI_rresp(processing_system7_0_M_AXI_GP0_RRESP),
        .S00_AXI_rvalid(processing_system7_0_M_AXI_GP0_RVALID),
        .S00_AXI_wdata(processing_system7_0_M_AXI_GP0_WDATA),
        .S00_AXI_wid(processing_system7_0_M_AXI_GP0_WID),
        .S00_AXI_wlast(processing_system7_0_M_AXI_GP0_WLAST),
        .S00_AXI_wready(processing_system7_0_M_AXI_GP0_WREADY),
        .S00_AXI_wstrb(processing_system7_0_M_AXI_GP0_WSTRB),
        .S00_AXI_wvalid(processing_system7_0_M_AXI_GP0_WVALID));
  jahwa_daq_system_axi_quad_spi_0_0 axi_quad_spi_0
       (.ext_spi_clk(softprocessor_clk),
        .io0_i(axi_quad_spi_0_SPI_0_IO0_I),
        .io0_o(axi_quad_spi_0_SPI_0_IO0_O),
        .io0_t(axi_quad_spi_0_SPI_0_IO0_T),
        .io1_i(axi_quad_spi_0_SPI_0_IO1_I),
        .io1_o(axi_quad_spi_0_SPI_0_IO1_O),
        .io1_t(axi_quad_spi_0_SPI_0_IO1_T),
        .s_axi_aclk(softprocessor_clk),
        .s_axi_araddr(softprocessor_M06_axi_ARADDR[6:0]),
        .s_axi_aresetn(mb_softprocessor_0_PERIPHERAL_ARESETN),
        .s_axi_arready(softprocessor_M06_axi_ARREADY),
        .s_axi_arvalid(softprocessor_M06_axi_ARVALID),
        .s_axi_awaddr(softprocessor_M06_axi_AWADDR[6:0]),
        .s_axi_awready(softprocessor_M06_axi_AWREADY),
        .s_axi_awvalid(softprocessor_M06_axi_AWVALID),
        .s_axi_bready(softprocessor_M06_axi_BREADY),
        .s_axi_bresp(softprocessor_M06_axi_BRESP),
        .s_axi_bvalid(softprocessor_M06_axi_BVALID),
        .s_axi_rdata(softprocessor_M06_axi_RDATA),
        .s_axi_rready(softprocessor_M06_axi_RREADY),
        .s_axi_rresp(softprocessor_M06_axi_RRESP),
        .s_axi_rvalid(softprocessor_M06_axi_RVALID),
        .s_axi_wdata(softprocessor_M06_axi_WDATA),
        .s_axi_wready(softprocessor_M06_axi_WREADY),
        .s_axi_wstrb(softprocessor_M06_axi_WSTRB),
        .s_axi_wvalid(softprocessor_M06_axi_WVALID),
        .sck_i(axi_quad_spi_0_SPI_0_SCK_I),
        .sck_o(axi_quad_spi_0_SPI_0_SCK_O),
        .sck_t(axi_quad_spi_0_SPI_0_SCK_T),
        .ss_i(axi_quad_spi_0_SPI_0_SS_I),
        .ss_o(axi_quad_spi_0_SPI_0_SS_O),
        .ss_t(axi_quad_spi_0_SPI_0_SS_T));
  mb_softprocessor_0_imp_NVDXSR mb_softprocessor_0
       (.AUX_RST_IN(xlslice_0_Dout),
        .CLK(softprocessor_clk),
        .M05_AXI_araddr(softprocessor_M05_axi_ARADDR),
        .M05_AXI_arready(softprocessor_M05_axi_ARREADY),
        .M05_AXI_arvalid(softprocessor_M05_axi_ARVALID),
        .M05_AXI_awaddr(softprocessor_M05_axi_AWADDR),
        .M05_AXI_awready(softprocessor_M05_axi_AWREADY),
        .M05_AXI_awvalid(softprocessor_M05_axi_AWVALID),
        .M05_AXI_bready(softprocessor_M05_axi_BREADY),
        .M05_AXI_bresp(softprocessor_M05_axi_BRESP),
        .M05_AXI_bvalid(softprocessor_M05_axi_BVALID),
        .M05_AXI_rdata(softprocessor_M05_axi_RDATA),
        .M05_AXI_rready(softprocessor_M05_axi_RREADY),
        .M05_AXI_rresp(softprocessor_M05_axi_RRESP),
        .M05_AXI_rvalid(softprocessor_M05_axi_RVALID),
        .M05_AXI_wdata(softprocessor_M05_axi_WDATA),
        .M05_AXI_wready(softprocessor_M05_axi_WREADY),
        .M05_AXI_wstrb(softprocessor_M05_axi_WSTRB),
        .M05_AXI_wvalid(softprocessor_M05_axi_WVALID),
        .M06_AXI_araddr(softprocessor_M06_axi_ARADDR),
        .M06_AXI_arready(softprocessor_M06_axi_ARREADY),
        .M06_AXI_arvalid(softprocessor_M06_axi_ARVALID),
        .M06_AXI_awaddr(softprocessor_M06_axi_AWADDR),
        .M06_AXI_awready(softprocessor_M06_axi_AWREADY),
        .M06_AXI_awvalid(softprocessor_M06_axi_AWVALID),
        .M06_AXI_bready(softprocessor_M06_axi_BREADY),
        .M06_AXI_bresp(softprocessor_M06_axi_BRESP),
        .M06_AXI_bvalid(softprocessor_M06_axi_BVALID),
        .M06_AXI_rdata(softprocessor_M06_axi_RDATA),
        .M06_AXI_rready(softprocessor_M06_axi_RREADY),
        .M06_AXI_rresp(softprocessor_M06_axi_RRESP),
        .M06_AXI_rvalid(softprocessor_M06_axi_RVALID),
        .M06_AXI_wdata(softprocessor_M06_axi_WDATA),
        .M06_AXI_wready(softprocessor_M06_axi_WREADY),
        .M06_AXI_wstrb(softprocessor_M06_axi_WSTRB),
        .M06_AXI_wvalid(softprocessor_M06_axi_WVALID),
        .M07_AXI_araddr(softprocessor_M07_axi_ARADDR),
        .M07_AXI_arprot(softprocessor_M07_axi_ARPROT),
        .M07_AXI_arready(softprocessor_M07_axi_ARREADY),
        .M07_AXI_arvalid(softprocessor_M07_axi_ARVALID),
        .M07_AXI_awaddr(softprocessor_M07_axi_AWADDR),
        .M07_AXI_awprot(softprocessor_M07_axi_AWPROT),
        .M07_AXI_awready(softprocessor_M07_axi_AWREADY),
        .M07_AXI_awvalid(softprocessor_M07_axi_AWVALID),
        .M07_AXI_bready(softprocessor_M07_axi_BREADY),
        .M07_AXI_bresp(softprocessor_M07_axi_BRESP),
        .M07_AXI_bvalid(softprocessor_M07_axi_BVALID),
        .M07_AXI_rdata(softprocessor_M07_axi_RDATA),
        .M07_AXI_rready(softprocessor_M07_axi_RREADY),
        .M07_AXI_rresp(softprocessor_M07_axi_RRESP),
        .M07_AXI_rvalid(softprocessor_M07_axi_RVALID),
        .M07_AXI_wdata(softprocessor_M07_axi_WDATA),
        .M07_AXI_wready(softprocessor_M07_axi_WREADY),
        .M07_AXI_wstrb(softprocessor_M07_axi_WSTRB),
        .M07_AXI_wvalid(softprocessor_M07_axi_WVALID),
        .M08_AXI_araddr(softprocessor_M08_axi_ARADDR),
        .M08_AXI_arready(softprocessor_M08_axi_ARREADY),
        .M08_AXI_arvalid(softprocessor_M08_axi_ARVALID),
        .M08_AXI_awaddr(softprocessor_M08_axi_AWADDR),
        .M08_AXI_awready(softprocessor_M08_axi_AWREADY),
        .M08_AXI_awvalid(softprocessor_M08_axi_AWVALID),
        .M08_AXI_bready(softprocessor_M08_axi_BREADY),
        .M08_AXI_bresp(softprocessor_M08_axi_BRESP),
        .M08_AXI_bvalid(softprocessor_M08_axi_BVALID),
        .M08_AXI_rdata(softprocessor_M08_axi_RDATA),
        .M08_AXI_rready(softprocessor_M08_axi_RREADY),
        .M08_AXI_rresp(softprocessor_M08_axi_RRESP),
        .M08_AXI_rvalid(softprocessor_M08_axi_RVALID),
        .M08_AXI_wdata(softprocessor_M08_axi_WDATA),
        .M08_AXI_wready(softprocessor_M08_axi_WREADY),
        .M08_AXI_wstrb(softprocessor_M08_axi_WSTRB),
        .M08_AXI_wvalid(softprocessor_M08_axi_WVALID),
        .M09_AXI_araddr(softprocessor_M09_axi_ARADDR),
        .M09_AXI_arready(softprocessor_M09_axi_ARREADY),
        .M09_AXI_arvalid(softprocessor_M09_axi_ARVALID),
        .M09_AXI_awaddr(softprocessor_M09_axi_AWADDR),
        .M09_AXI_awready(softprocessor_M09_axi_AWREADY),
        .M09_AXI_awvalid(softprocessor_M09_axi_AWVALID),
        .M09_AXI_bready(softprocessor_M09_axi_BREADY),
        .M09_AXI_bresp(softprocessor_M09_axi_BRESP),
        .M09_AXI_bvalid(softprocessor_M09_axi_BVALID),
        .M09_AXI_rdata(softprocessor_M09_axi_RDATA),
        .M09_AXI_rready(softprocessor_M09_axi_RREADY),
        .M09_AXI_rresp(softprocessor_M09_axi_RRESP),
        .M09_AXI_rvalid(softprocessor_M09_axi_RVALID),
        .M09_AXI_wdata(softprocessor_M09_axi_WDATA),
        .M09_AXI_wready(softprocessor_M09_axi_WREADY),
        .M09_AXI_wstrb(softprocessor_M09_axi_WSTRB),
        .M09_AXI_wvalid(softprocessor_M09_axi_WVALID),
        .M10_AXI_araddr(softprocessor_M10_axi_ARADDR),
        .M10_AXI_arready(softprocessor_M10_axi_ARREADY),
        .M10_AXI_arvalid(softprocessor_M10_axi_ARVALID),
        .M10_AXI_awaddr(softprocessor_M10_axi_AWADDR),
        .M10_AXI_awready(softprocessor_M10_axi_AWREADY),
        .M10_AXI_awvalid(softprocessor_M10_axi_AWVALID),
        .M10_AXI_bready(softprocessor_M10_axi_BREADY),
        .M10_AXI_bresp(softprocessor_M10_axi_BRESP),
        .M10_AXI_bvalid(softprocessor_M10_axi_BVALID),
        .M10_AXI_rdata(softprocessor_M10_axi_RDATA),
        .M10_AXI_rready(softprocessor_M10_axi_RREADY),
        .M10_AXI_rresp(softprocessor_M10_axi_RRESP),
        .M10_AXI_rvalid(softprocessor_M10_axi_RVALID),
        .M10_AXI_wdata(softprocessor_M10_axi_WDATA),
        .M10_AXI_wready(softprocessor_M10_axi_WREADY),
        .M10_AXI_wstrb(softprocessor_M10_axi_WSTRB),
        .M10_AXI_wvalid(softprocessor_M10_axi_WVALID),
        .M11_AXI_araddr(softprocessor_M11_axi_ARADDR),
        .M11_AXI_arready(softprocessor_M11_axi_ARREADY),
        .M11_AXI_arvalid(softprocessor_M11_axi_ARVALID),
        .M11_AXI_awaddr(softprocessor_M11_axi_AWADDR),
        .M11_AXI_awready(softprocessor_M11_axi_AWREADY),
        .M11_AXI_awvalid(softprocessor_M11_axi_AWVALID),
        .M11_AXI_bready(softprocessor_M11_axi_BREADY),
        .M11_AXI_bresp(softprocessor_M11_axi_BRESP),
        .M11_AXI_bvalid(softprocessor_M11_axi_BVALID),
        .M11_AXI_rdata(softprocessor_M11_axi_RDATA),
        .M11_AXI_rready(softprocessor_M11_axi_RREADY),
        .M11_AXI_rresp(softprocessor_M11_axi_RRESP),
        .M11_AXI_rvalid(softprocessor_M11_axi_RVALID),
        .M11_AXI_wdata(softprocessor_M11_axi_WDATA),
        .M11_AXI_wready(softprocessor_M11_axi_WREADY),
        .M11_AXI_wstrb(softprocessor_M11_axi_WSTRB),
        .M11_AXI_wvalid(softprocessor_M11_axi_WVALID),
        .M12_AXI_araddr(softprocessor_M12_axi_ARADDR),
        .M12_AXI_arready(softprocessor_M12_axi_ARREADY),
        .M12_AXI_arvalid(softprocessor_M12_axi_ARVALID),
        .M12_AXI_awaddr(softprocessor_M12_axi_AWADDR),
        .M12_AXI_awready(softprocessor_M12_axi_AWREADY),
        .M12_AXI_awvalid(softprocessor_M12_axi_AWVALID),
        .M12_AXI_bready(softprocessor_M12_axi_BREADY),
        .M12_AXI_bresp(softprocessor_M12_axi_BRESP),
        .M12_AXI_bvalid(softprocessor_M12_axi_BVALID),
        .M12_AXI_rdata(softprocessor_M12_axi_RDATA),
        .M12_AXI_rready(softprocessor_M12_axi_RREADY),
        .M12_AXI_rresp(softprocessor_M12_axi_RRESP),
        .M12_AXI_rvalid(softprocessor_M12_axi_RVALID),
        .M12_AXI_wdata(softprocessor_M12_axi_WDATA),
        .M12_AXI_wready(softprocessor_M12_axi_WREADY),
        .M12_AXI_wstrb(softprocessor_M12_axi_WSTRB),
        .M12_AXI_wvalid(softprocessor_M12_axi_WVALID),
        .M13_AXI_araddr(softprocessor_M13_axi_ARADDR),
        .M13_AXI_arready(softprocessor_M13_axi_ARREADY),
        .M13_AXI_arvalid(softprocessor_M13_axi_ARVALID),
        .M13_AXI_awaddr(softprocessor_M13_axi_AWADDR),
        .M13_AXI_awready(softprocessor_M13_axi_AWREADY),
        .M13_AXI_awvalid(softprocessor_M13_axi_AWVALID),
        .M13_AXI_bready(softprocessor_M13_axi_BREADY),
        .M13_AXI_bresp(softprocessor_M13_axi_BRESP),
        .M13_AXI_bvalid(softprocessor_M13_axi_BVALID),
        .M13_AXI_rdata(softprocessor_M13_axi_RDATA),
        .M13_AXI_rready(softprocessor_M13_axi_RREADY),
        .M13_AXI_rresp(softprocessor_M13_axi_RRESP),
        .M13_AXI_rvalid(softprocessor_M13_axi_RVALID),
        .M13_AXI_wdata(softprocessor_M13_axi_WDATA),
        .M13_AXI_wready(softprocessor_M13_axi_WREADY),
        .M13_AXI_wstrb(softprocessor_M13_axi_WSTRB),
        .M13_AXI_wvalid(softprocessor_M13_axi_WVALID),
        .PERIPHERAL_ARESETN(mb_softprocessor_0_PERIPHERAL_ARESETN),
        .Q(mb_softprocessor_0_Q),
        .RESET(xlslice_1_Dout),
        .RST_DEBUG(mb_softprocessor_0_RST_DEBUG),
        .S_AXI_ARESETN(S_AXI_ARESETN_1),
        .S_AXI_araddr(zynq_axi_interconnect_0_M00_AXI_ARADDR),
        .S_AXI_arburst(zynq_axi_interconnect_0_M00_AXI_ARBURST),
        .S_AXI_arcache(zynq_axi_interconnect_0_M00_AXI_ARCACHE),
        .S_AXI_arid(zynq_axi_interconnect_0_M00_AXI_ARID),
        .S_AXI_arlen(zynq_axi_interconnect_0_M00_AXI_ARLEN),
        .S_AXI_arlock(zynq_axi_interconnect_0_M00_AXI_ARLOCK),
        .S_AXI_arprot(zynq_axi_interconnect_0_M00_AXI_ARPROT),
        .S_AXI_arready(zynq_axi_interconnect_0_M00_AXI_ARREADY),
        .S_AXI_arsize(zynq_axi_interconnect_0_M00_AXI_ARSIZE),
        .S_AXI_arvalid(zynq_axi_interconnect_0_M00_AXI_ARVALID),
        .S_AXI_awaddr(zynq_axi_interconnect_0_M00_AXI_AWADDR),
        .S_AXI_awburst(zynq_axi_interconnect_0_M00_AXI_AWBURST),
        .S_AXI_awcache(zynq_axi_interconnect_0_M00_AXI_AWCACHE),
        .S_AXI_awid(zynq_axi_interconnect_0_M00_AXI_AWID),
        .S_AXI_awlen(zynq_axi_interconnect_0_M00_AXI_AWLEN),
        .S_AXI_awlock(zynq_axi_interconnect_0_M00_AXI_AWLOCK),
        .S_AXI_awprot(zynq_axi_interconnect_0_M00_AXI_AWPROT),
        .S_AXI_awready(zynq_axi_interconnect_0_M00_AXI_AWREADY),
        .S_AXI_awsize(zynq_axi_interconnect_0_M00_AXI_AWSIZE),
        .S_AXI_awvalid(zynq_axi_interconnect_0_M00_AXI_AWVALID),
        .S_AXI_bid(zynq_axi_interconnect_0_M00_AXI_BID),
        .S_AXI_bready(zynq_axi_interconnect_0_M00_AXI_BREADY),
        .S_AXI_bresp(zynq_axi_interconnect_0_M00_AXI_BRESP),
        .S_AXI_bvalid(zynq_axi_interconnect_0_M00_AXI_BVALID),
        .S_AXI_rdata(zynq_axi_interconnect_0_M00_AXI_RDATA),
        .S_AXI_rid(zynq_axi_interconnect_0_M00_AXI_RID),
        .S_AXI_rlast(zynq_axi_interconnect_0_M00_AXI_RLAST),
        .S_AXI_rready(zynq_axi_interconnect_0_M00_AXI_RREADY),
        .S_AXI_rresp(zynq_axi_interconnect_0_M00_AXI_RRESP),
        .S_AXI_rvalid(zynq_axi_interconnect_0_M00_AXI_RVALID),
        .S_AXI_wdata(zynq_axi_interconnect_0_M00_AXI_WDATA),
        .S_AXI_wlast(zynq_axi_interconnect_0_M00_AXI_WLAST),
        .S_AXI_wready(zynq_axi_interconnect_0_M00_AXI_WREADY),
        .S_AXI_wstrb(zynq_axi_interconnect_0_M00_AXI_WSTRB),
        .S_AXI_wvalid(zynq_axi_interconnect_0_M00_AXI_WVALID));
  (* BMM_INFO_PROCESSOR = "arm > jahwa_daq_system mb_softprocessor_0/axi_bram_ctrl_0" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  jahwa_daq_system_processing_system7_0_0 processing_system7_0
       (.DDR_Addr(DDR_addr[14:0]),
        .DDR_BankAddr(DDR_ba[2:0]),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm[3:0]),
        .DDR_DQ(DDR_dq[31:0]),
        .DDR_DQS(DDR_dqs_p[3:0]),
        .DDR_DQS_n(DDR_dqs_n[3:0]),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .FCLK_CLK0(softprocessor_clk),
        .FCLK_RESET0_N(S_AXI_ARESETN_1),
        .GPIO_I({1'b0,1'b0}),
        .GPIO_O(processing_system7_0_GPIO_O),
        .IRQ_F2P(axi_intc_0_irq),
        .MIO(FIXED_IO_mio[53:0]),
        .M_AXI_GP0_ACLK(softprocessor_clk),
        .M_AXI_GP0_ARADDR(processing_system7_0_M_AXI_GP0_ARADDR),
        .M_AXI_GP0_ARBURST(processing_system7_0_M_AXI_GP0_ARBURST),
        .M_AXI_GP0_ARCACHE(processing_system7_0_M_AXI_GP0_ARCACHE),
        .M_AXI_GP0_ARID(processing_system7_0_M_AXI_GP0_ARID),
        .M_AXI_GP0_ARLEN(processing_system7_0_M_AXI_GP0_ARLEN),
        .M_AXI_GP0_ARLOCK(processing_system7_0_M_AXI_GP0_ARLOCK),
        .M_AXI_GP0_ARPROT(processing_system7_0_M_AXI_GP0_ARPROT),
        .M_AXI_GP0_ARQOS(processing_system7_0_M_AXI_GP0_ARQOS),
        .M_AXI_GP0_ARREADY(processing_system7_0_M_AXI_GP0_ARREADY),
        .M_AXI_GP0_ARSIZE(processing_system7_0_M_AXI_GP0_ARSIZE),
        .M_AXI_GP0_ARVALID(processing_system7_0_M_AXI_GP0_ARVALID),
        .M_AXI_GP0_AWADDR(processing_system7_0_M_AXI_GP0_AWADDR),
        .M_AXI_GP0_AWBURST(processing_system7_0_M_AXI_GP0_AWBURST),
        .M_AXI_GP0_AWCACHE(processing_system7_0_M_AXI_GP0_AWCACHE),
        .M_AXI_GP0_AWID(processing_system7_0_M_AXI_GP0_AWID),
        .M_AXI_GP0_AWLEN(processing_system7_0_M_AXI_GP0_AWLEN),
        .M_AXI_GP0_AWLOCK(processing_system7_0_M_AXI_GP0_AWLOCK),
        .M_AXI_GP0_AWPROT(processing_system7_0_M_AXI_GP0_AWPROT),
        .M_AXI_GP0_AWQOS(processing_system7_0_M_AXI_GP0_AWQOS),
        .M_AXI_GP0_AWREADY(processing_system7_0_M_AXI_GP0_AWREADY),
        .M_AXI_GP0_AWSIZE(processing_system7_0_M_AXI_GP0_AWSIZE),
        .M_AXI_GP0_AWVALID(processing_system7_0_M_AXI_GP0_AWVALID),
        .M_AXI_GP0_BID(processing_system7_0_M_AXI_GP0_BID),
        .M_AXI_GP0_BREADY(processing_system7_0_M_AXI_GP0_BREADY),
        .M_AXI_GP0_BRESP(processing_system7_0_M_AXI_GP0_BRESP),
        .M_AXI_GP0_BVALID(processing_system7_0_M_AXI_GP0_BVALID),
        .M_AXI_GP0_RDATA(processing_system7_0_M_AXI_GP0_RDATA),
        .M_AXI_GP0_RID(processing_system7_0_M_AXI_GP0_RID),
        .M_AXI_GP0_RLAST(processing_system7_0_M_AXI_GP0_RLAST),
        .M_AXI_GP0_RREADY(processing_system7_0_M_AXI_GP0_RREADY),
        .M_AXI_GP0_RRESP(processing_system7_0_M_AXI_GP0_RRESP),
        .M_AXI_GP0_RVALID(processing_system7_0_M_AXI_GP0_RVALID),
        .M_AXI_GP0_WDATA(processing_system7_0_M_AXI_GP0_WDATA),
        .M_AXI_GP0_WID(processing_system7_0_M_AXI_GP0_WID),
        .M_AXI_GP0_WLAST(processing_system7_0_M_AXI_GP0_WLAST),
        .M_AXI_GP0_WREADY(processing_system7_0_M_AXI_GP0_WREADY),
        .M_AXI_GP0_WSTRB(processing_system7_0_M_AXI_GP0_WSTRB),
        .M_AXI_GP0_WVALID(processing_system7_0_M_AXI_GP0_WVALID),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .USB0_VBUS_PWRFAULT(1'b0));
  jahwa_daq_system_xlslice_0_0 xlslice_0
       (.Din(processing_system7_0_GPIO_O),
        .Dout(xlslice_0_Dout));
  jahwa_daq_system_xlslice_1_0 xlslice_1
       (.Din(processing_system7_0_GPIO_O),
        .Dout(xlslice_1_Dout));
endmodule

module jahwa_daq_system_axi_interconnect_0_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arid,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awid,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rid,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wid,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [11:0]M00_AXI_arid;
  output [7:0]M00_AXI_arlen;
  output M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [11:0]M00_AXI_awid;
  output [7:0]M00_AXI_awlen;
  output M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  input [11:0]M00_AXI_bid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  input [11:0]M00_AXI_rid;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [31:0]M01_AXI_araddr;
  input M01_AXI_arready;
  output M01_AXI_arvalid;
  output [31:0]M01_AXI_awaddr;
  input M01_AXI_awready;
  output M01_AXI_awvalid;
  output M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output M01_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [11:0]S00_AXI_arid;
  input [3:0]S00_AXI_arlen;
  input [1:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [11:0]S00_AXI_awid;
  input [3:0]S00_AXI_awlen;
  input [1:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [11:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [11:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input [11:0]S00_AXI_wid;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire axi_interconnect_0_ACLK_net;
  wire axi_interconnect_0_ARESETN_net;
  wire [31:0]axi_interconnect_0_to_s00_couplers_ARADDR;
  wire [1:0]axi_interconnect_0_to_s00_couplers_ARBURST;
  wire [3:0]axi_interconnect_0_to_s00_couplers_ARCACHE;
  wire [11:0]axi_interconnect_0_to_s00_couplers_ARID;
  wire [3:0]axi_interconnect_0_to_s00_couplers_ARLEN;
  wire [1:0]axi_interconnect_0_to_s00_couplers_ARLOCK;
  wire [2:0]axi_interconnect_0_to_s00_couplers_ARPROT;
  wire [3:0]axi_interconnect_0_to_s00_couplers_ARQOS;
  wire axi_interconnect_0_to_s00_couplers_ARREADY;
  wire [2:0]axi_interconnect_0_to_s00_couplers_ARSIZE;
  wire axi_interconnect_0_to_s00_couplers_ARVALID;
  wire [31:0]axi_interconnect_0_to_s00_couplers_AWADDR;
  wire [1:0]axi_interconnect_0_to_s00_couplers_AWBURST;
  wire [3:0]axi_interconnect_0_to_s00_couplers_AWCACHE;
  wire [11:0]axi_interconnect_0_to_s00_couplers_AWID;
  wire [3:0]axi_interconnect_0_to_s00_couplers_AWLEN;
  wire [1:0]axi_interconnect_0_to_s00_couplers_AWLOCK;
  wire [2:0]axi_interconnect_0_to_s00_couplers_AWPROT;
  wire [3:0]axi_interconnect_0_to_s00_couplers_AWQOS;
  wire axi_interconnect_0_to_s00_couplers_AWREADY;
  wire [2:0]axi_interconnect_0_to_s00_couplers_AWSIZE;
  wire axi_interconnect_0_to_s00_couplers_AWVALID;
  wire [11:0]axi_interconnect_0_to_s00_couplers_BID;
  wire axi_interconnect_0_to_s00_couplers_BREADY;
  wire [1:0]axi_interconnect_0_to_s00_couplers_BRESP;
  wire axi_interconnect_0_to_s00_couplers_BVALID;
  wire [31:0]axi_interconnect_0_to_s00_couplers_RDATA;
  wire [11:0]axi_interconnect_0_to_s00_couplers_RID;
  wire axi_interconnect_0_to_s00_couplers_RLAST;
  wire axi_interconnect_0_to_s00_couplers_RREADY;
  wire [1:0]axi_interconnect_0_to_s00_couplers_RRESP;
  wire axi_interconnect_0_to_s00_couplers_RVALID;
  wire [31:0]axi_interconnect_0_to_s00_couplers_WDATA;
  wire [11:0]axi_interconnect_0_to_s00_couplers_WID;
  wire axi_interconnect_0_to_s00_couplers_WLAST;
  wire axi_interconnect_0_to_s00_couplers_WREADY;
  wire [3:0]axi_interconnect_0_to_s00_couplers_WSTRB;
  wire axi_interconnect_0_to_s00_couplers_WVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_0_ARADDR;
  wire [1:0]m00_couplers_to_axi_interconnect_0_ARBURST;
  wire [3:0]m00_couplers_to_axi_interconnect_0_ARCACHE;
  wire [11:0]m00_couplers_to_axi_interconnect_0_ARID;
  wire [7:0]m00_couplers_to_axi_interconnect_0_ARLEN;
  wire m00_couplers_to_axi_interconnect_0_ARLOCK;
  wire [2:0]m00_couplers_to_axi_interconnect_0_ARPROT;
  wire m00_couplers_to_axi_interconnect_0_ARREADY;
  wire [2:0]m00_couplers_to_axi_interconnect_0_ARSIZE;
  wire m00_couplers_to_axi_interconnect_0_ARVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_0_AWADDR;
  wire [1:0]m00_couplers_to_axi_interconnect_0_AWBURST;
  wire [3:0]m00_couplers_to_axi_interconnect_0_AWCACHE;
  wire [11:0]m00_couplers_to_axi_interconnect_0_AWID;
  wire [7:0]m00_couplers_to_axi_interconnect_0_AWLEN;
  wire m00_couplers_to_axi_interconnect_0_AWLOCK;
  wire [2:0]m00_couplers_to_axi_interconnect_0_AWPROT;
  wire m00_couplers_to_axi_interconnect_0_AWREADY;
  wire [2:0]m00_couplers_to_axi_interconnect_0_AWSIZE;
  wire m00_couplers_to_axi_interconnect_0_AWVALID;
  wire [11:0]m00_couplers_to_axi_interconnect_0_BID;
  wire m00_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m00_couplers_to_axi_interconnect_0_BRESP;
  wire m00_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_0_RDATA;
  wire [11:0]m00_couplers_to_axi_interconnect_0_RID;
  wire m00_couplers_to_axi_interconnect_0_RLAST;
  wire m00_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m00_couplers_to_axi_interconnect_0_RRESP;
  wire m00_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_0_WDATA;
  wire m00_couplers_to_axi_interconnect_0_WLAST;
  wire m00_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m00_couplers_to_axi_interconnect_0_WSTRB;
  wire m00_couplers_to_axi_interconnect_0_WVALID;
  wire [31:0]m01_couplers_to_axi_interconnect_0_ARADDR;
  wire m01_couplers_to_axi_interconnect_0_ARREADY;
  wire m01_couplers_to_axi_interconnect_0_ARVALID;
  wire [31:0]m01_couplers_to_axi_interconnect_0_AWADDR;
  wire m01_couplers_to_axi_interconnect_0_AWREADY;
  wire m01_couplers_to_axi_interconnect_0_AWVALID;
  wire m01_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m01_couplers_to_axi_interconnect_0_BRESP;
  wire m01_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m01_couplers_to_axi_interconnect_0_RDATA;
  wire m01_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m01_couplers_to_axi_interconnect_0_RRESP;
  wire m01_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m01_couplers_to_axi_interconnect_0_WDATA;
  wire m01_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m01_couplers_to_axi_interconnect_0_WSTRB;
  wire m01_couplers_to_axi_interconnect_0_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [1:0]s00_couplers_to_xbar_ARBURST;
  wire [3:0]s00_couplers_to_xbar_ARCACHE;
  wire [11:0]s00_couplers_to_xbar_ARID;
  wire [7:0]s00_couplers_to_xbar_ARLEN;
  wire [0:0]s00_couplers_to_xbar_ARLOCK;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [3:0]s00_couplers_to_xbar_ARQOS;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire [2:0]s00_couplers_to_xbar_ARSIZE;
  wire s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [1:0]s00_couplers_to_xbar_AWBURST;
  wire [3:0]s00_couplers_to_xbar_AWCACHE;
  wire [11:0]s00_couplers_to_xbar_AWID;
  wire [7:0]s00_couplers_to_xbar_AWLEN;
  wire [0:0]s00_couplers_to_xbar_AWLOCK;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [3:0]s00_couplers_to_xbar_AWQOS;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire [2:0]s00_couplers_to_xbar_AWSIZE;
  wire s00_couplers_to_xbar_AWVALID;
  wire [11:0]s00_couplers_to_xbar_BID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire [11:0]s00_couplers_to_xbar_RID;
  wire [0:0]s00_couplers_to_xbar_RLAST;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire s00_couplers_to_xbar_WLAST;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire s00_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [1:0]xbar_to_m00_couplers_ARBURST;
  wire [3:0]xbar_to_m00_couplers_ARCACHE;
  wire [11:0]xbar_to_m00_couplers_ARID;
  wire [7:0]xbar_to_m00_couplers_ARLEN;
  wire [0:0]xbar_to_m00_couplers_ARLOCK;
  wire [2:0]xbar_to_m00_couplers_ARPROT;
  wire xbar_to_m00_couplers_ARREADY;
  wire [2:0]xbar_to_m00_couplers_ARSIZE;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [1:0]xbar_to_m00_couplers_AWBURST;
  wire [3:0]xbar_to_m00_couplers_AWCACHE;
  wire [11:0]xbar_to_m00_couplers_AWID;
  wire [7:0]xbar_to_m00_couplers_AWLEN;
  wire [0:0]xbar_to_m00_couplers_AWLOCK;
  wire [2:0]xbar_to_m00_couplers_AWPROT;
  wire xbar_to_m00_couplers_AWREADY;
  wire [2:0]xbar_to_m00_couplers_AWSIZE;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [11:0]xbar_to_m00_couplers_BID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [11:0]xbar_to_m00_couplers_RID;
  wire xbar_to_m00_couplers_RLAST;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WLAST;
  wire xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [63:32]xbar_to_m01_couplers_ARADDR;
  wire [3:2]xbar_to_m01_couplers_ARBURST;
  wire [7:4]xbar_to_m01_couplers_ARCACHE;
  wire [23:12]xbar_to_m01_couplers_ARID;
  wire [15:8]xbar_to_m01_couplers_ARLEN;
  wire [1:1]xbar_to_m01_couplers_ARLOCK;
  wire [5:3]xbar_to_m01_couplers_ARPROT;
  wire [7:4]xbar_to_m01_couplers_ARQOS;
  wire xbar_to_m01_couplers_ARREADY;
  wire [7:4]xbar_to_m01_couplers_ARREGION;
  wire [5:3]xbar_to_m01_couplers_ARSIZE;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [63:32]xbar_to_m01_couplers_AWADDR;
  wire [3:2]xbar_to_m01_couplers_AWBURST;
  wire [7:4]xbar_to_m01_couplers_AWCACHE;
  wire [23:12]xbar_to_m01_couplers_AWID;
  wire [15:8]xbar_to_m01_couplers_AWLEN;
  wire [1:1]xbar_to_m01_couplers_AWLOCK;
  wire [5:3]xbar_to_m01_couplers_AWPROT;
  wire [7:4]xbar_to_m01_couplers_AWQOS;
  wire xbar_to_m01_couplers_AWREADY;
  wire [7:4]xbar_to_m01_couplers_AWREGION;
  wire [5:3]xbar_to_m01_couplers_AWSIZE;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [11:0]xbar_to_m01_couplers_BID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [11:0]xbar_to_m01_couplers_RID;
  wire xbar_to_m01_couplers_RLAST;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire [1:1]xbar_to_m01_couplers_WLAST;
  wire xbar_to_m01_couplers_WREADY;
  wire [7:4]xbar_to_m01_couplers_WSTRB;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [7:0]NLW_xbar_m_axi_arqos_UNCONNECTED;
  wire [7:0]NLW_xbar_m_axi_arregion_UNCONNECTED;
  wire [7:0]NLW_xbar_m_axi_awqos_UNCONNECTED;
  wire [7:0]NLW_xbar_m_axi_awregion_UNCONNECTED;

  assign M00_AXI_araddr[31:0] = m00_couplers_to_axi_interconnect_0_ARADDR;
  assign M00_AXI_arburst[1:0] = m00_couplers_to_axi_interconnect_0_ARBURST;
  assign M00_AXI_arcache[3:0] = m00_couplers_to_axi_interconnect_0_ARCACHE;
  assign M00_AXI_arid[11:0] = m00_couplers_to_axi_interconnect_0_ARID;
  assign M00_AXI_arlen[7:0] = m00_couplers_to_axi_interconnect_0_ARLEN;
  assign M00_AXI_arlock = m00_couplers_to_axi_interconnect_0_ARLOCK;
  assign M00_AXI_arprot[2:0] = m00_couplers_to_axi_interconnect_0_ARPROT;
  assign M00_AXI_arsize[2:0] = m00_couplers_to_axi_interconnect_0_ARSIZE;
  assign M00_AXI_arvalid = m00_couplers_to_axi_interconnect_0_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_couplers_to_axi_interconnect_0_AWADDR;
  assign M00_AXI_awburst[1:0] = m00_couplers_to_axi_interconnect_0_AWBURST;
  assign M00_AXI_awcache[3:0] = m00_couplers_to_axi_interconnect_0_AWCACHE;
  assign M00_AXI_awid[11:0] = m00_couplers_to_axi_interconnect_0_AWID;
  assign M00_AXI_awlen[7:0] = m00_couplers_to_axi_interconnect_0_AWLEN;
  assign M00_AXI_awlock = m00_couplers_to_axi_interconnect_0_AWLOCK;
  assign M00_AXI_awprot[2:0] = m00_couplers_to_axi_interconnect_0_AWPROT;
  assign M00_AXI_awsize[2:0] = m00_couplers_to_axi_interconnect_0_AWSIZE;
  assign M00_AXI_awvalid = m00_couplers_to_axi_interconnect_0_AWVALID;
  assign M00_AXI_bready = m00_couplers_to_axi_interconnect_0_BREADY;
  assign M00_AXI_rready = m00_couplers_to_axi_interconnect_0_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_axi_interconnect_0_WDATA;
  assign M00_AXI_wlast = m00_couplers_to_axi_interconnect_0_WLAST;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_axi_interconnect_0_WSTRB;
  assign M00_AXI_wvalid = m00_couplers_to_axi_interconnect_0_WVALID;
  assign M01_AXI_araddr[31:0] = m01_couplers_to_axi_interconnect_0_ARADDR;
  assign M01_AXI_arvalid = m01_couplers_to_axi_interconnect_0_ARVALID;
  assign M01_AXI_awaddr[31:0] = m01_couplers_to_axi_interconnect_0_AWADDR;
  assign M01_AXI_awvalid = m01_couplers_to_axi_interconnect_0_AWVALID;
  assign M01_AXI_bready = m01_couplers_to_axi_interconnect_0_BREADY;
  assign M01_AXI_rready = m01_couplers_to_axi_interconnect_0_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_axi_interconnect_0_WDATA;
  assign M01_AXI_wstrb[3:0] = m01_couplers_to_axi_interconnect_0_WSTRB;
  assign M01_AXI_wvalid = m01_couplers_to_axi_interconnect_0_WVALID;
  assign S00_AXI_arready = axi_interconnect_0_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = axi_interconnect_0_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[11:0] = axi_interconnect_0_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = axi_interconnect_0_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = axi_interconnect_0_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = axi_interconnect_0_to_s00_couplers_RDATA;
  assign S00_AXI_rid[11:0] = axi_interconnect_0_to_s00_couplers_RID;
  assign S00_AXI_rlast = axi_interconnect_0_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = axi_interconnect_0_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = axi_interconnect_0_to_s00_couplers_RVALID;
  assign S00_AXI_wready = axi_interconnect_0_to_s00_couplers_WREADY;
  assign axi_interconnect_0_ACLK_net = ACLK;
  assign axi_interconnect_0_ARESETN_net = ARESETN;
  assign axi_interconnect_0_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign axi_interconnect_0_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign axi_interconnect_0_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign axi_interconnect_0_to_s00_couplers_ARID = S00_AXI_arid[11:0];
  assign axi_interconnect_0_to_s00_couplers_ARLEN = S00_AXI_arlen[3:0];
  assign axi_interconnect_0_to_s00_couplers_ARLOCK = S00_AXI_arlock[1:0];
  assign axi_interconnect_0_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_interconnect_0_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign axi_interconnect_0_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign axi_interconnect_0_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign axi_interconnect_0_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign axi_interconnect_0_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign axi_interconnect_0_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign axi_interconnect_0_to_s00_couplers_AWID = S00_AXI_awid[11:0];
  assign axi_interconnect_0_to_s00_couplers_AWLEN = S00_AXI_awlen[3:0];
  assign axi_interconnect_0_to_s00_couplers_AWLOCK = S00_AXI_awlock[1:0];
  assign axi_interconnect_0_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign axi_interconnect_0_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign axi_interconnect_0_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign axi_interconnect_0_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign axi_interconnect_0_to_s00_couplers_BREADY = S00_AXI_bready;
  assign axi_interconnect_0_to_s00_couplers_RREADY = S00_AXI_rready;
  assign axi_interconnect_0_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign axi_interconnect_0_to_s00_couplers_WID = S00_AXI_wid[11:0];
  assign axi_interconnect_0_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign axi_interconnect_0_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign axi_interconnect_0_to_s00_couplers_WVALID = S00_AXI_wvalid;
  assign m00_couplers_to_axi_interconnect_0_ARREADY = M00_AXI_arready;
  assign m00_couplers_to_axi_interconnect_0_AWREADY = M00_AXI_awready;
  assign m00_couplers_to_axi_interconnect_0_BID = M00_AXI_bid[11:0];
  assign m00_couplers_to_axi_interconnect_0_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_axi_interconnect_0_BVALID = M00_AXI_bvalid;
  assign m00_couplers_to_axi_interconnect_0_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_axi_interconnect_0_RID = M00_AXI_rid[11:0];
  assign m00_couplers_to_axi_interconnect_0_RLAST = M00_AXI_rlast;
  assign m00_couplers_to_axi_interconnect_0_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_axi_interconnect_0_RVALID = M00_AXI_rvalid;
  assign m00_couplers_to_axi_interconnect_0_WREADY = M00_AXI_wready;
  assign m01_couplers_to_axi_interconnect_0_ARREADY = M01_AXI_arready;
  assign m01_couplers_to_axi_interconnect_0_AWREADY = M01_AXI_awready;
  assign m01_couplers_to_axi_interconnect_0_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_axi_interconnect_0_BVALID = M01_AXI_bvalid;
  assign m01_couplers_to_axi_interconnect_0_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_axi_interconnect_0_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_axi_interconnect_0_RVALID = M01_AXI_rvalid;
  assign m01_couplers_to_axi_interconnect_0_WREADY = M01_AXI_wready;
  m00_couplers_imp_GJWGDZ m00_couplers
       (.M_ACLK(axi_interconnect_0_ACLK_net),
        .M_ARESETN(axi_interconnect_0_ARESETN_net),
        .M_AXI_araddr(m00_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arburst(m00_couplers_to_axi_interconnect_0_ARBURST),
        .M_AXI_arcache(m00_couplers_to_axi_interconnect_0_ARCACHE),
        .M_AXI_arid(m00_couplers_to_axi_interconnect_0_ARID),
        .M_AXI_arlen(m00_couplers_to_axi_interconnect_0_ARLEN),
        .M_AXI_arlock(m00_couplers_to_axi_interconnect_0_ARLOCK),
        .M_AXI_arprot(m00_couplers_to_axi_interconnect_0_ARPROT),
        .M_AXI_arready(m00_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arsize(m00_couplers_to_axi_interconnect_0_ARSIZE),
        .M_AXI_arvalid(m00_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awburst(m00_couplers_to_axi_interconnect_0_AWBURST),
        .M_AXI_awcache(m00_couplers_to_axi_interconnect_0_AWCACHE),
        .M_AXI_awid(m00_couplers_to_axi_interconnect_0_AWID),
        .M_AXI_awlen(m00_couplers_to_axi_interconnect_0_AWLEN),
        .M_AXI_awlock(m00_couplers_to_axi_interconnect_0_AWLOCK),
        .M_AXI_awprot(m00_couplers_to_axi_interconnect_0_AWPROT),
        .M_AXI_awready(m00_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awsize(m00_couplers_to_axi_interconnect_0_AWSIZE),
        .M_AXI_awvalid(m00_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bid(m00_couplers_to_axi_interconnect_0_BID),
        .M_AXI_bready(m00_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m00_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m00_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m00_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rid(m00_couplers_to_axi_interconnect_0_RID),
        .M_AXI_rlast(m00_couplers_to_axi_interconnect_0_RLAST),
        .M_AXI_rready(m00_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m00_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m00_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m00_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wlast(m00_couplers_to_axi_interconnect_0_WLAST),
        .M_AXI_wready(m00_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m00_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m00_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m00_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m00_couplers_ARID),
        .S_AXI_arlen(xbar_to_m00_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m00_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m00_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arsize(xbar_to_m00_couplers_ARSIZE),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m00_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m00_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m00_couplers_AWID),
        .S_AXI_awlen(xbar_to_m00_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m00_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m00_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awsize(xbar_to_m00_couplers_AWSIZE),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m00_couplers_BID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rid(xbar_to_m00_couplers_RID),
        .S_AXI_rlast(xbar_to_m00_couplers_RLAST),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m00_couplers_WLAST),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_1P8M7HC m01_couplers
       (.M_ACLK(axi_interconnect_0_ACLK_net),
        .M_ARESETN(axi_interconnect_0_ARESETN_net),
        .M_AXI_araddr(m01_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arready(m01_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awready(m01_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m01_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m01_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m01_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m01_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m01_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m01_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m01_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m01_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m01_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m01_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m01_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m01_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m01_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m01_couplers_ARID),
        .S_AXI_arlen(xbar_to_m01_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m01_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m01_couplers_ARPROT),
        .S_AXI_arqos(xbar_to_m01_couplers_ARQOS),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m01_couplers_ARREGION),
        .S_AXI_arsize(xbar_to_m01_couplers_ARSIZE),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m01_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m01_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m01_couplers_AWID),
        .S_AXI_awlen(xbar_to_m01_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m01_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m01_couplers_AWPROT),
        .S_AXI_awqos(xbar_to_m01_couplers_AWQOS),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m01_couplers_AWREGION),
        .S_AXI_awsize(xbar_to_m01_couplers_AWSIZE),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m01_couplers_BID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rid(xbar_to_m01_couplers_RID),
        .S_AXI_rlast(xbar_to_m01_couplers_RLAST),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m01_couplers_WLAST),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m01_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  s00_couplers_imp_BCGOZL s00_couplers
       (.M_ACLK(axi_interconnect_0_ACLK_net),
        .M_ARESETN(axi_interconnect_0_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arburst(s00_couplers_to_xbar_ARBURST),
        .M_AXI_arcache(s00_couplers_to_xbar_ARCACHE),
        .M_AXI_arid(s00_couplers_to_xbar_ARID),
        .M_AXI_arlen(s00_couplers_to_xbar_ARLEN),
        .M_AXI_arlock(s00_couplers_to_xbar_ARLOCK),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arqos(s00_couplers_to_xbar_ARQOS),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arsize(s00_couplers_to_xbar_ARSIZE),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awburst(s00_couplers_to_xbar_AWBURST),
        .M_AXI_awcache(s00_couplers_to_xbar_AWCACHE),
        .M_AXI_awid(s00_couplers_to_xbar_AWID),
        .M_AXI_awlen(s00_couplers_to_xbar_AWLEN),
        .M_AXI_awlock(s00_couplers_to_xbar_AWLOCK),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awqos(s00_couplers_to_xbar_AWQOS),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awsize(s00_couplers_to_xbar_AWSIZE),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bid(s00_couplers_to_xbar_BID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rid(s00_couplers_to_xbar_RID),
        .M_AXI_rlast(s00_couplers_to_xbar_RLAST),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wlast(s00_couplers_to_xbar_WLAST),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(axi_interconnect_0_to_s00_couplers_ARADDR),
        .S_AXI_arburst(axi_interconnect_0_to_s00_couplers_ARBURST),
        .S_AXI_arcache(axi_interconnect_0_to_s00_couplers_ARCACHE),
        .S_AXI_arid(axi_interconnect_0_to_s00_couplers_ARID),
        .S_AXI_arlen(axi_interconnect_0_to_s00_couplers_ARLEN),
        .S_AXI_arlock(axi_interconnect_0_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(axi_interconnect_0_to_s00_couplers_ARPROT),
        .S_AXI_arqos(axi_interconnect_0_to_s00_couplers_ARQOS),
        .S_AXI_arready(axi_interconnect_0_to_s00_couplers_ARREADY),
        .S_AXI_arsize(axi_interconnect_0_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(axi_interconnect_0_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(axi_interconnect_0_to_s00_couplers_AWADDR),
        .S_AXI_awburst(axi_interconnect_0_to_s00_couplers_AWBURST),
        .S_AXI_awcache(axi_interconnect_0_to_s00_couplers_AWCACHE),
        .S_AXI_awid(axi_interconnect_0_to_s00_couplers_AWID),
        .S_AXI_awlen(axi_interconnect_0_to_s00_couplers_AWLEN),
        .S_AXI_awlock(axi_interconnect_0_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(axi_interconnect_0_to_s00_couplers_AWPROT),
        .S_AXI_awqos(axi_interconnect_0_to_s00_couplers_AWQOS),
        .S_AXI_awready(axi_interconnect_0_to_s00_couplers_AWREADY),
        .S_AXI_awsize(axi_interconnect_0_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(axi_interconnect_0_to_s00_couplers_AWVALID),
        .S_AXI_bid(axi_interconnect_0_to_s00_couplers_BID),
        .S_AXI_bready(axi_interconnect_0_to_s00_couplers_BREADY),
        .S_AXI_bresp(axi_interconnect_0_to_s00_couplers_BRESP),
        .S_AXI_bvalid(axi_interconnect_0_to_s00_couplers_BVALID),
        .S_AXI_rdata(axi_interconnect_0_to_s00_couplers_RDATA),
        .S_AXI_rid(axi_interconnect_0_to_s00_couplers_RID),
        .S_AXI_rlast(axi_interconnect_0_to_s00_couplers_RLAST),
        .S_AXI_rready(axi_interconnect_0_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_interconnect_0_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_interconnect_0_to_s00_couplers_RVALID),
        .S_AXI_wdata(axi_interconnect_0_to_s00_couplers_WDATA),
        .S_AXI_wid(axi_interconnect_0_to_s00_couplers_WID),
        .S_AXI_wlast(axi_interconnect_0_to_s00_couplers_WLAST),
        .S_AXI_wready(axi_interconnect_0_to_s00_couplers_WREADY),
        .S_AXI_wstrb(axi_interconnect_0_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(axi_interconnect_0_to_s00_couplers_WVALID));
  jahwa_daq_system_xbar_0 xbar
       (.aclk(axi_interconnect_0_ACLK_net),
        .aresetn(axi_interconnect_0_ARESETN_net),
        .m_axi_araddr({xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arburst({xbar_to_m01_couplers_ARBURST,xbar_to_m00_couplers_ARBURST}),
        .m_axi_arcache({xbar_to_m01_couplers_ARCACHE,xbar_to_m00_couplers_ARCACHE}),
        .m_axi_arid({xbar_to_m01_couplers_ARID,xbar_to_m00_couplers_ARID}),
        .m_axi_arlen({xbar_to_m01_couplers_ARLEN,xbar_to_m00_couplers_ARLEN}),
        .m_axi_arlock({xbar_to_m01_couplers_ARLOCK,xbar_to_m00_couplers_ARLOCK}),
        .m_axi_arprot({xbar_to_m01_couplers_ARPROT,xbar_to_m00_couplers_ARPROT}),
        .m_axi_arqos({xbar_to_m01_couplers_ARQOS,NLW_xbar_m_axi_arqos_UNCONNECTED[3:0]}),
        .m_axi_arready({xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arregion({xbar_to_m01_couplers_ARREGION,NLW_xbar_m_axi_arregion_UNCONNECTED[3:0]}),
        .m_axi_arsize({xbar_to_m01_couplers_ARSIZE,xbar_to_m00_couplers_ARSIZE}),
        .m_axi_arvalid({xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awburst({xbar_to_m01_couplers_AWBURST,xbar_to_m00_couplers_AWBURST}),
        .m_axi_awcache({xbar_to_m01_couplers_AWCACHE,xbar_to_m00_couplers_AWCACHE}),
        .m_axi_awid({xbar_to_m01_couplers_AWID,xbar_to_m00_couplers_AWID}),
        .m_axi_awlen({xbar_to_m01_couplers_AWLEN,xbar_to_m00_couplers_AWLEN}),
        .m_axi_awlock({xbar_to_m01_couplers_AWLOCK,xbar_to_m00_couplers_AWLOCK}),
        .m_axi_awprot({xbar_to_m01_couplers_AWPROT,xbar_to_m00_couplers_AWPROT}),
        .m_axi_awqos({xbar_to_m01_couplers_AWQOS,NLW_xbar_m_axi_awqos_UNCONNECTED[3:0]}),
        .m_axi_awready({xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awregion({xbar_to_m01_couplers_AWREGION,NLW_xbar_m_axi_awregion_UNCONNECTED[3:0]}),
        .m_axi_awsize({xbar_to_m01_couplers_AWSIZE,xbar_to_m00_couplers_AWSIZE}),
        .m_axi_awvalid({xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bid({xbar_to_m01_couplers_BID,xbar_to_m00_couplers_BID}),
        .m_axi_bready({xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rid({xbar_to_m01_couplers_RID,xbar_to_m00_couplers_RID}),
        .m_axi_rlast({xbar_to_m01_couplers_RLAST,xbar_to_m00_couplers_RLAST}),
        .m_axi_rready({xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wlast({xbar_to_m01_couplers_WLAST,xbar_to_m00_couplers_WLAST}),
        .m_axi_wready({xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m01_couplers_WSTRB,xbar_to_m00_couplers_WSTRB}),
        .m_axi_wvalid({xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arburst(s00_couplers_to_xbar_ARBURST),
        .s_axi_arcache(s00_couplers_to_xbar_ARCACHE),
        .s_axi_arid(s00_couplers_to_xbar_ARID),
        .s_axi_arlen(s00_couplers_to_xbar_ARLEN),
        .s_axi_arlock(s00_couplers_to_xbar_ARLOCK),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arqos(s00_couplers_to_xbar_ARQOS),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arsize(s00_couplers_to_xbar_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awburst(s00_couplers_to_xbar_AWBURST),
        .s_axi_awcache(s00_couplers_to_xbar_AWCACHE),
        .s_axi_awid(s00_couplers_to_xbar_AWID),
        .s_axi_awlen(s00_couplers_to_xbar_AWLEN),
        .s_axi_awlock(s00_couplers_to_xbar_AWLOCK),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awqos(s00_couplers_to_xbar_AWQOS),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awsize(s00_couplers_to_xbar_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bid(s00_couplers_to_xbar_BID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rid(s00_couplers_to_xbar_RID),
        .s_axi_rlast(s00_couplers_to_xbar_RLAST),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wlast(s00_couplers_to_xbar_WLAST),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule

module jahwa_daq_system_axi_interconnect_0_1
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    M02_ACLK,
    M02_ARESETN,
    M02_AXI_araddr,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wstrb,
    M02_AXI_wvalid,
    M03_ACLK,
    M03_ARESETN,
    M03_AXI_araddr,
    M03_AXI_arready,
    M03_AXI_arvalid,
    M03_AXI_awaddr,
    M03_AXI_awready,
    M03_AXI_awvalid,
    M03_AXI_bready,
    M03_AXI_bresp,
    M03_AXI_bvalid,
    M03_AXI_rdata,
    M03_AXI_rready,
    M03_AXI_rresp,
    M03_AXI_rvalid,
    M03_AXI_wdata,
    M03_AXI_wready,
    M03_AXI_wstrb,
    M03_AXI_wvalid,
    M04_ACLK,
    M04_ARESETN,
    M04_AXI_araddr,
    M04_AXI_arready,
    M04_AXI_arvalid,
    M04_AXI_awaddr,
    M04_AXI_awready,
    M04_AXI_awvalid,
    M04_AXI_bready,
    M04_AXI_bresp,
    M04_AXI_bvalid,
    M04_AXI_rdata,
    M04_AXI_rready,
    M04_AXI_rresp,
    M04_AXI_rvalid,
    M04_AXI_wdata,
    M04_AXI_wready,
    M04_AXI_wstrb,
    M04_AXI_wvalid,
    M05_ACLK,
    M05_ARESETN,
    M05_AXI_araddr,
    M05_AXI_arready,
    M05_AXI_arvalid,
    M05_AXI_awaddr,
    M05_AXI_awready,
    M05_AXI_awvalid,
    M05_AXI_bready,
    M05_AXI_bresp,
    M05_AXI_bvalid,
    M05_AXI_rdata,
    M05_AXI_rready,
    M05_AXI_rresp,
    M05_AXI_rvalid,
    M05_AXI_wdata,
    M05_AXI_wready,
    M05_AXI_wstrb,
    M05_AXI_wvalid,
    M06_ACLK,
    M06_ARESETN,
    M06_AXI_araddr,
    M06_AXI_arready,
    M06_AXI_arvalid,
    M06_AXI_awaddr,
    M06_AXI_awready,
    M06_AXI_awvalid,
    M06_AXI_bready,
    M06_AXI_bresp,
    M06_AXI_bvalid,
    M06_AXI_rdata,
    M06_AXI_rready,
    M06_AXI_rresp,
    M06_AXI_rvalid,
    M06_AXI_wdata,
    M06_AXI_wready,
    M06_AXI_wstrb,
    M06_AXI_wvalid,
    M07_ACLK,
    M07_ARESETN,
    M07_AXI_araddr,
    M07_AXI_arprot,
    M07_AXI_arready,
    M07_AXI_arvalid,
    M07_AXI_awaddr,
    M07_AXI_awprot,
    M07_AXI_awready,
    M07_AXI_awvalid,
    M07_AXI_bready,
    M07_AXI_bresp,
    M07_AXI_bvalid,
    M07_AXI_rdata,
    M07_AXI_rready,
    M07_AXI_rresp,
    M07_AXI_rvalid,
    M07_AXI_wdata,
    M07_AXI_wready,
    M07_AXI_wstrb,
    M07_AXI_wvalid,
    M08_ACLK,
    M08_ARESETN,
    M08_AXI_araddr,
    M08_AXI_arready,
    M08_AXI_arvalid,
    M08_AXI_awaddr,
    M08_AXI_awready,
    M08_AXI_awvalid,
    M08_AXI_bready,
    M08_AXI_bresp,
    M08_AXI_bvalid,
    M08_AXI_rdata,
    M08_AXI_rready,
    M08_AXI_rresp,
    M08_AXI_rvalid,
    M08_AXI_wdata,
    M08_AXI_wready,
    M08_AXI_wstrb,
    M08_AXI_wvalid,
    M09_ACLK,
    M09_ARESETN,
    M09_AXI_araddr,
    M09_AXI_arready,
    M09_AXI_arvalid,
    M09_AXI_awaddr,
    M09_AXI_awready,
    M09_AXI_awvalid,
    M09_AXI_bready,
    M09_AXI_bresp,
    M09_AXI_bvalid,
    M09_AXI_rdata,
    M09_AXI_rready,
    M09_AXI_rresp,
    M09_AXI_rvalid,
    M09_AXI_wdata,
    M09_AXI_wready,
    M09_AXI_wstrb,
    M09_AXI_wvalid,
    M10_ACLK,
    M10_ARESETN,
    M10_AXI_araddr,
    M10_AXI_arready,
    M10_AXI_arvalid,
    M10_AXI_awaddr,
    M10_AXI_awready,
    M10_AXI_awvalid,
    M10_AXI_bready,
    M10_AXI_bresp,
    M10_AXI_bvalid,
    M10_AXI_rdata,
    M10_AXI_rready,
    M10_AXI_rresp,
    M10_AXI_rvalid,
    M10_AXI_wdata,
    M10_AXI_wready,
    M10_AXI_wstrb,
    M10_AXI_wvalid,
    M11_ACLK,
    M11_ARESETN,
    M11_AXI_araddr,
    M11_AXI_arready,
    M11_AXI_arvalid,
    M11_AXI_awaddr,
    M11_AXI_awready,
    M11_AXI_awvalid,
    M11_AXI_bready,
    M11_AXI_bresp,
    M11_AXI_bvalid,
    M11_AXI_rdata,
    M11_AXI_rready,
    M11_AXI_rresp,
    M11_AXI_rvalid,
    M11_AXI_wdata,
    M11_AXI_wready,
    M11_AXI_wstrb,
    M11_AXI_wvalid,
    M12_ACLK,
    M12_ARESETN,
    M12_AXI_araddr,
    M12_AXI_arready,
    M12_AXI_arvalid,
    M12_AXI_awaddr,
    M12_AXI_awready,
    M12_AXI_awvalid,
    M12_AXI_bready,
    M12_AXI_bresp,
    M12_AXI_bvalid,
    M12_AXI_rdata,
    M12_AXI_rready,
    M12_AXI_rresp,
    M12_AXI_rvalid,
    M12_AXI_wdata,
    M12_AXI_wready,
    M12_AXI_wstrb,
    M12_AXI_wvalid,
    M13_ACLK,
    M13_ARESETN,
    M13_AXI_araddr,
    M13_AXI_arready,
    M13_AXI_arvalid,
    M13_AXI_awaddr,
    M13_AXI_awready,
    M13_AXI_awvalid,
    M13_AXI_bready,
    M13_AXI_bresp,
    M13_AXI_bvalid,
    M13_AXI_rdata,
    M13_AXI_rready,
    M13_AXI_rresp,
    M13_AXI_rvalid,
    M13_AXI_wdata,
    M13_AXI_wready,
    M13_AXI_wstrb,
    M13_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awprot,
    S00_AXI_awready,
    S00_AXI_awvalid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  input [0:0]M00_AXI_arready;
  output [0:0]M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  input [0:0]M00_AXI_awready;
  output [0:0]M00_AXI_awvalid;
  output [0:0]M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input [0:0]M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output [0:0]M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input [0:0]M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input [0:0]M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output [0:0]M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [31:0]M01_AXI_araddr;
  input [0:0]M01_AXI_arready;
  output [0:0]M01_AXI_arvalid;
  output [31:0]M01_AXI_awaddr;
  input [0:0]M01_AXI_awready;
  output [0:0]M01_AXI_awvalid;
  output [0:0]M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input [0:0]M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output [0:0]M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input [0:0]M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input [0:0]M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output [0:0]M01_AXI_wvalid;
  input M02_ACLK;
  input M02_ARESETN;
  output [31:0]M02_AXI_araddr;
  input [0:0]M02_AXI_arready;
  output [0:0]M02_AXI_arvalid;
  output [31:0]M02_AXI_awaddr;
  input [0:0]M02_AXI_awready;
  output [0:0]M02_AXI_awvalid;
  output [0:0]M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input [0:0]M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output [0:0]M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input [0:0]M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input [0:0]M02_AXI_wready;
  output [3:0]M02_AXI_wstrb;
  output [0:0]M02_AXI_wvalid;
  input M03_ACLK;
  input M03_ARESETN;
  output [31:0]M03_AXI_araddr;
  input [0:0]M03_AXI_arready;
  output [0:0]M03_AXI_arvalid;
  output [31:0]M03_AXI_awaddr;
  input [0:0]M03_AXI_awready;
  output [0:0]M03_AXI_awvalid;
  output [0:0]M03_AXI_bready;
  input [1:0]M03_AXI_bresp;
  input [0:0]M03_AXI_bvalid;
  input [31:0]M03_AXI_rdata;
  output [0:0]M03_AXI_rready;
  input [1:0]M03_AXI_rresp;
  input [0:0]M03_AXI_rvalid;
  output [31:0]M03_AXI_wdata;
  input [0:0]M03_AXI_wready;
  output [3:0]M03_AXI_wstrb;
  output [0:0]M03_AXI_wvalid;
  input M04_ACLK;
  input M04_ARESETN;
  output [31:0]M04_AXI_araddr;
  input [0:0]M04_AXI_arready;
  output [0:0]M04_AXI_arvalid;
  output [31:0]M04_AXI_awaddr;
  input [0:0]M04_AXI_awready;
  output [0:0]M04_AXI_awvalid;
  output [0:0]M04_AXI_bready;
  input [1:0]M04_AXI_bresp;
  input [0:0]M04_AXI_bvalid;
  input [31:0]M04_AXI_rdata;
  output [0:0]M04_AXI_rready;
  input [1:0]M04_AXI_rresp;
  input [0:0]M04_AXI_rvalid;
  output [31:0]M04_AXI_wdata;
  input [0:0]M04_AXI_wready;
  output [3:0]M04_AXI_wstrb;
  output [0:0]M04_AXI_wvalid;
  input M05_ACLK;
  input M05_ARESETN;
  output [31:0]M05_AXI_araddr;
  input [0:0]M05_AXI_arready;
  output [0:0]M05_AXI_arvalid;
  output [31:0]M05_AXI_awaddr;
  input [0:0]M05_AXI_awready;
  output [0:0]M05_AXI_awvalid;
  output [0:0]M05_AXI_bready;
  input [1:0]M05_AXI_bresp;
  input [0:0]M05_AXI_bvalid;
  input [31:0]M05_AXI_rdata;
  output [0:0]M05_AXI_rready;
  input [1:0]M05_AXI_rresp;
  input [0:0]M05_AXI_rvalid;
  output [31:0]M05_AXI_wdata;
  input [0:0]M05_AXI_wready;
  output [3:0]M05_AXI_wstrb;
  output [0:0]M05_AXI_wvalid;
  input M06_ACLK;
  input M06_ARESETN;
  output [31:0]M06_AXI_araddr;
  input [0:0]M06_AXI_arready;
  output [0:0]M06_AXI_arvalid;
  output [31:0]M06_AXI_awaddr;
  input [0:0]M06_AXI_awready;
  output [0:0]M06_AXI_awvalid;
  output [0:0]M06_AXI_bready;
  input [1:0]M06_AXI_bresp;
  input [0:0]M06_AXI_bvalid;
  input [31:0]M06_AXI_rdata;
  output [0:0]M06_AXI_rready;
  input [1:0]M06_AXI_rresp;
  input [0:0]M06_AXI_rvalid;
  output [31:0]M06_AXI_wdata;
  input [0:0]M06_AXI_wready;
  output [3:0]M06_AXI_wstrb;
  output [0:0]M06_AXI_wvalid;
  input M07_ACLK;
  input M07_ARESETN;
  output [31:0]M07_AXI_araddr;
  output [2:0]M07_AXI_arprot;
  input [0:0]M07_AXI_arready;
  output [0:0]M07_AXI_arvalid;
  output [31:0]M07_AXI_awaddr;
  output [2:0]M07_AXI_awprot;
  input [0:0]M07_AXI_awready;
  output [0:0]M07_AXI_awvalid;
  output [0:0]M07_AXI_bready;
  input [1:0]M07_AXI_bresp;
  input [0:0]M07_AXI_bvalid;
  input [31:0]M07_AXI_rdata;
  output [0:0]M07_AXI_rready;
  input [1:0]M07_AXI_rresp;
  input [0:0]M07_AXI_rvalid;
  output [31:0]M07_AXI_wdata;
  input [0:0]M07_AXI_wready;
  output [3:0]M07_AXI_wstrb;
  output [0:0]M07_AXI_wvalid;
  input M08_ACLK;
  input M08_ARESETN;
  output [31:0]M08_AXI_araddr;
  input [0:0]M08_AXI_arready;
  output [0:0]M08_AXI_arvalid;
  output [31:0]M08_AXI_awaddr;
  input [0:0]M08_AXI_awready;
  output [0:0]M08_AXI_awvalid;
  output [0:0]M08_AXI_bready;
  input [1:0]M08_AXI_bresp;
  input [0:0]M08_AXI_bvalid;
  input [31:0]M08_AXI_rdata;
  output [0:0]M08_AXI_rready;
  input [1:0]M08_AXI_rresp;
  input [0:0]M08_AXI_rvalid;
  output [31:0]M08_AXI_wdata;
  input [0:0]M08_AXI_wready;
  output [3:0]M08_AXI_wstrb;
  output [0:0]M08_AXI_wvalid;
  input M09_ACLK;
  input M09_ARESETN;
  output [31:0]M09_AXI_araddr;
  input [0:0]M09_AXI_arready;
  output [0:0]M09_AXI_arvalid;
  output [31:0]M09_AXI_awaddr;
  input [0:0]M09_AXI_awready;
  output [0:0]M09_AXI_awvalid;
  output [0:0]M09_AXI_bready;
  input [1:0]M09_AXI_bresp;
  input [0:0]M09_AXI_bvalid;
  input [31:0]M09_AXI_rdata;
  output [0:0]M09_AXI_rready;
  input [1:0]M09_AXI_rresp;
  input [0:0]M09_AXI_rvalid;
  output [31:0]M09_AXI_wdata;
  input [0:0]M09_AXI_wready;
  output [3:0]M09_AXI_wstrb;
  output [0:0]M09_AXI_wvalid;
  input M10_ACLK;
  input M10_ARESETN;
  output [31:0]M10_AXI_araddr;
  input [0:0]M10_AXI_arready;
  output [0:0]M10_AXI_arvalid;
  output [31:0]M10_AXI_awaddr;
  input [0:0]M10_AXI_awready;
  output [0:0]M10_AXI_awvalid;
  output [0:0]M10_AXI_bready;
  input [1:0]M10_AXI_bresp;
  input [0:0]M10_AXI_bvalid;
  input [31:0]M10_AXI_rdata;
  output [0:0]M10_AXI_rready;
  input [1:0]M10_AXI_rresp;
  input [0:0]M10_AXI_rvalid;
  output [31:0]M10_AXI_wdata;
  input [0:0]M10_AXI_wready;
  output [3:0]M10_AXI_wstrb;
  output [0:0]M10_AXI_wvalid;
  input M11_ACLK;
  input M11_ARESETN;
  output [31:0]M11_AXI_araddr;
  input [0:0]M11_AXI_arready;
  output [0:0]M11_AXI_arvalid;
  output [31:0]M11_AXI_awaddr;
  input [0:0]M11_AXI_awready;
  output [0:0]M11_AXI_awvalid;
  output [0:0]M11_AXI_bready;
  input [1:0]M11_AXI_bresp;
  input [0:0]M11_AXI_bvalid;
  input [31:0]M11_AXI_rdata;
  output [0:0]M11_AXI_rready;
  input [1:0]M11_AXI_rresp;
  input [0:0]M11_AXI_rvalid;
  output [31:0]M11_AXI_wdata;
  input [0:0]M11_AXI_wready;
  output [3:0]M11_AXI_wstrb;
  output [0:0]M11_AXI_wvalid;
  input M12_ACLK;
  input M12_ARESETN;
  output [31:0]M12_AXI_araddr;
  input [0:0]M12_AXI_arready;
  output [0:0]M12_AXI_arvalid;
  output [31:0]M12_AXI_awaddr;
  input [0:0]M12_AXI_awready;
  output [0:0]M12_AXI_awvalid;
  output [0:0]M12_AXI_bready;
  input [1:0]M12_AXI_bresp;
  input [0:0]M12_AXI_bvalid;
  input [31:0]M12_AXI_rdata;
  output [0:0]M12_AXI_rready;
  input [1:0]M12_AXI_rresp;
  input [0:0]M12_AXI_rvalid;
  output [31:0]M12_AXI_wdata;
  input [0:0]M12_AXI_wready;
  output [3:0]M12_AXI_wstrb;
  output [0:0]M12_AXI_wvalid;
  input M13_ACLK;
  input M13_ARESETN;
  output [31:0]M13_AXI_araddr;
  input [0:0]M13_AXI_arready;
  output [0:0]M13_AXI_arvalid;
  output [31:0]M13_AXI_awaddr;
  input [0:0]M13_AXI_awready;
  output [0:0]M13_AXI_awvalid;
  output [0:0]M13_AXI_bready;
  input [1:0]M13_AXI_bresp;
  input [0:0]M13_AXI_bvalid;
  input [31:0]M13_AXI_rdata;
  output [0:0]M13_AXI_rready;
  input [1:0]M13_AXI_rresp;
  input [0:0]M13_AXI_rvalid;
  output [31:0]M13_AXI_wdata;
  input [0:0]M13_AXI_wready;
  output [3:0]M13_AXI_wstrb;
  output [0:0]M13_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [2:0]S00_AXI_arprot;
  output S00_AXI_arready;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [2:0]S00_AXI_awprot;
  output S00_AXI_awready;
  input S00_AXI_awvalid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire M00_ACLK_1;
  wire M00_ARESETN_1;
  wire M01_ACLK_1;
  wire M01_ARESETN_1;
  wire M02_ACLK_1;
  wire M02_ARESETN_1;
  wire M03_ACLK_1;
  wire M03_ARESETN_1;
  wire M04_ACLK_1;
  wire M04_ARESETN_1;
  wire M05_ACLK_1;
  wire M05_ARESETN_1;
  wire M06_ACLK_1;
  wire M06_ARESETN_1;
  wire M07_ACLK_1;
  wire M07_ARESETN_1;
  wire M08_ACLK_1;
  wire M08_ARESETN_1;
  wire M09_ACLK_1;
  wire M09_ARESETN_1;
  wire M10_ACLK_1;
  wire M10_ARESETN_1;
  wire M11_ACLK_1;
  wire M11_ARESETN_1;
  wire M12_ACLK_1;
  wire M12_ARESETN_1;
  wire M13_ACLK_1;
  wire M13_ARESETN_1;
  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire axi_interconnect_0_ACLK_net;
  wire axi_interconnect_0_ARESETN_net;
  wire [31:0]axi_interconnect_0_to_s00_couplers_ARADDR;
  wire [2:0]axi_interconnect_0_to_s00_couplers_ARPROT;
  wire axi_interconnect_0_to_s00_couplers_ARREADY;
  wire axi_interconnect_0_to_s00_couplers_ARVALID;
  wire [31:0]axi_interconnect_0_to_s00_couplers_AWADDR;
  wire [2:0]axi_interconnect_0_to_s00_couplers_AWPROT;
  wire axi_interconnect_0_to_s00_couplers_AWREADY;
  wire axi_interconnect_0_to_s00_couplers_AWVALID;
  wire axi_interconnect_0_to_s00_couplers_BREADY;
  wire [1:0]axi_interconnect_0_to_s00_couplers_BRESP;
  wire axi_interconnect_0_to_s00_couplers_BVALID;
  wire [31:0]axi_interconnect_0_to_s00_couplers_RDATA;
  wire axi_interconnect_0_to_s00_couplers_RREADY;
  wire [1:0]axi_interconnect_0_to_s00_couplers_RRESP;
  wire axi_interconnect_0_to_s00_couplers_RVALID;
  wire [31:0]axi_interconnect_0_to_s00_couplers_WDATA;
  wire axi_interconnect_0_to_s00_couplers_WREADY;
  wire [3:0]axi_interconnect_0_to_s00_couplers_WSTRB;
  wire axi_interconnect_0_to_s00_couplers_WVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_0_ARADDR;
  wire [0:0]m00_couplers_to_axi_interconnect_0_ARREADY;
  wire [0:0]m00_couplers_to_axi_interconnect_0_ARVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_0_AWADDR;
  wire [0:0]m00_couplers_to_axi_interconnect_0_AWREADY;
  wire [0:0]m00_couplers_to_axi_interconnect_0_AWVALID;
  wire [0:0]m00_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m00_couplers_to_axi_interconnect_0_BRESP;
  wire [0:0]m00_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_0_RDATA;
  wire [0:0]m00_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m00_couplers_to_axi_interconnect_0_RRESP;
  wire [0:0]m00_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_0_WDATA;
  wire [0:0]m00_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m00_couplers_to_axi_interconnect_0_WSTRB;
  wire [0:0]m00_couplers_to_axi_interconnect_0_WVALID;
  wire [31:0]m01_couplers_to_axi_interconnect_0_ARADDR;
  wire [0:0]m01_couplers_to_axi_interconnect_0_ARREADY;
  wire [0:0]m01_couplers_to_axi_interconnect_0_ARVALID;
  wire [31:0]m01_couplers_to_axi_interconnect_0_AWADDR;
  wire [0:0]m01_couplers_to_axi_interconnect_0_AWREADY;
  wire [0:0]m01_couplers_to_axi_interconnect_0_AWVALID;
  wire [0:0]m01_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m01_couplers_to_axi_interconnect_0_BRESP;
  wire [0:0]m01_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m01_couplers_to_axi_interconnect_0_RDATA;
  wire [0:0]m01_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m01_couplers_to_axi_interconnect_0_RRESP;
  wire [0:0]m01_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m01_couplers_to_axi_interconnect_0_WDATA;
  wire [0:0]m01_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m01_couplers_to_axi_interconnect_0_WSTRB;
  wire [0:0]m01_couplers_to_axi_interconnect_0_WVALID;
  wire [31:0]m02_couplers_to_axi_interconnect_0_ARADDR;
  wire [0:0]m02_couplers_to_axi_interconnect_0_ARREADY;
  wire [0:0]m02_couplers_to_axi_interconnect_0_ARVALID;
  wire [31:0]m02_couplers_to_axi_interconnect_0_AWADDR;
  wire [0:0]m02_couplers_to_axi_interconnect_0_AWREADY;
  wire [0:0]m02_couplers_to_axi_interconnect_0_AWVALID;
  wire [0:0]m02_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m02_couplers_to_axi_interconnect_0_BRESP;
  wire [0:0]m02_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m02_couplers_to_axi_interconnect_0_RDATA;
  wire [0:0]m02_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m02_couplers_to_axi_interconnect_0_RRESP;
  wire [0:0]m02_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m02_couplers_to_axi_interconnect_0_WDATA;
  wire [0:0]m02_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m02_couplers_to_axi_interconnect_0_WSTRB;
  wire [0:0]m02_couplers_to_axi_interconnect_0_WVALID;
  wire [31:0]m03_couplers_to_axi_interconnect_0_ARADDR;
  wire [0:0]m03_couplers_to_axi_interconnect_0_ARREADY;
  wire [0:0]m03_couplers_to_axi_interconnect_0_ARVALID;
  wire [31:0]m03_couplers_to_axi_interconnect_0_AWADDR;
  wire [0:0]m03_couplers_to_axi_interconnect_0_AWREADY;
  wire [0:0]m03_couplers_to_axi_interconnect_0_AWVALID;
  wire [0:0]m03_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m03_couplers_to_axi_interconnect_0_BRESP;
  wire [0:0]m03_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m03_couplers_to_axi_interconnect_0_RDATA;
  wire [0:0]m03_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m03_couplers_to_axi_interconnect_0_RRESP;
  wire [0:0]m03_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m03_couplers_to_axi_interconnect_0_WDATA;
  wire [0:0]m03_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m03_couplers_to_axi_interconnect_0_WSTRB;
  wire [0:0]m03_couplers_to_axi_interconnect_0_WVALID;
  wire [31:0]m04_couplers_to_axi_interconnect_0_ARADDR;
  wire [0:0]m04_couplers_to_axi_interconnect_0_ARREADY;
  wire [0:0]m04_couplers_to_axi_interconnect_0_ARVALID;
  wire [31:0]m04_couplers_to_axi_interconnect_0_AWADDR;
  wire [0:0]m04_couplers_to_axi_interconnect_0_AWREADY;
  wire [0:0]m04_couplers_to_axi_interconnect_0_AWVALID;
  wire [0:0]m04_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m04_couplers_to_axi_interconnect_0_BRESP;
  wire [0:0]m04_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m04_couplers_to_axi_interconnect_0_RDATA;
  wire [0:0]m04_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m04_couplers_to_axi_interconnect_0_RRESP;
  wire [0:0]m04_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m04_couplers_to_axi_interconnect_0_WDATA;
  wire [0:0]m04_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m04_couplers_to_axi_interconnect_0_WSTRB;
  wire [0:0]m04_couplers_to_axi_interconnect_0_WVALID;
  wire [31:0]m05_couplers_to_axi_interconnect_0_ARADDR;
  wire [0:0]m05_couplers_to_axi_interconnect_0_ARREADY;
  wire [0:0]m05_couplers_to_axi_interconnect_0_ARVALID;
  wire [31:0]m05_couplers_to_axi_interconnect_0_AWADDR;
  wire [0:0]m05_couplers_to_axi_interconnect_0_AWREADY;
  wire [0:0]m05_couplers_to_axi_interconnect_0_AWVALID;
  wire [0:0]m05_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m05_couplers_to_axi_interconnect_0_BRESP;
  wire [0:0]m05_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m05_couplers_to_axi_interconnect_0_RDATA;
  wire [0:0]m05_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m05_couplers_to_axi_interconnect_0_RRESP;
  wire [0:0]m05_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m05_couplers_to_axi_interconnect_0_WDATA;
  wire [0:0]m05_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m05_couplers_to_axi_interconnect_0_WSTRB;
  wire [0:0]m05_couplers_to_axi_interconnect_0_WVALID;
  wire [31:0]m06_couplers_to_axi_interconnect_0_ARADDR;
  wire [0:0]m06_couplers_to_axi_interconnect_0_ARREADY;
  wire [0:0]m06_couplers_to_axi_interconnect_0_ARVALID;
  wire [31:0]m06_couplers_to_axi_interconnect_0_AWADDR;
  wire [0:0]m06_couplers_to_axi_interconnect_0_AWREADY;
  wire [0:0]m06_couplers_to_axi_interconnect_0_AWVALID;
  wire [0:0]m06_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m06_couplers_to_axi_interconnect_0_BRESP;
  wire [0:0]m06_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m06_couplers_to_axi_interconnect_0_RDATA;
  wire [0:0]m06_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m06_couplers_to_axi_interconnect_0_RRESP;
  wire [0:0]m06_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m06_couplers_to_axi_interconnect_0_WDATA;
  wire [0:0]m06_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m06_couplers_to_axi_interconnect_0_WSTRB;
  wire [0:0]m06_couplers_to_axi_interconnect_0_WVALID;
  wire [31:0]m07_couplers_to_axi_interconnect_0_ARADDR;
  wire [2:0]m07_couplers_to_axi_interconnect_0_ARPROT;
  wire [0:0]m07_couplers_to_axi_interconnect_0_ARREADY;
  wire [0:0]m07_couplers_to_axi_interconnect_0_ARVALID;
  wire [31:0]m07_couplers_to_axi_interconnect_0_AWADDR;
  wire [2:0]m07_couplers_to_axi_interconnect_0_AWPROT;
  wire [0:0]m07_couplers_to_axi_interconnect_0_AWREADY;
  wire [0:0]m07_couplers_to_axi_interconnect_0_AWVALID;
  wire [0:0]m07_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m07_couplers_to_axi_interconnect_0_BRESP;
  wire [0:0]m07_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m07_couplers_to_axi_interconnect_0_RDATA;
  wire [0:0]m07_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m07_couplers_to_axi_interconnect_0_RRESP;
  wire [0:0]m07_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m07_couplers_to_axi_interconnect_0_WDATA;
  wire [0:0]m07_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m07_couplers_to_axi_interconnect_0_WSTRB;
  wire [0:0]m07_couplers_to_axi_interconnect_0_WVALID;
  wire [31:0]m08_couplers_to_axi_interconnect_0_ARADDR;
  wire [0:0]m08_couplers_to_axi_interconnect_0_ARREADY;
  wire [0:0]m08_couplers_to_axi_interconnect_0_ARVALID;
  wire [31:0]m08_couplers_to_axi_interconnect_0_AWADDR;
  wire [0:0]m08_couplers_to_axi_interconnect_0_AWREADY;
  wire [0:0]m08_couplers_to_axi_interconnect_0_AWVALID;
  wire [0:0]m08_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m08_couplers_to_axi_interconnect_0_BRESP;
  wire [0:0]m08_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m08_couplers_to_axi_interconnect_0_RDATA;
  wire [0:0]m08_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m08_couplers_to_axi_interconnect_0_RRESP;
  wire [0:0]m08_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m08_couplers_to_axi_interconnect_0_WDATA;
  wire [0:0]m08_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m08_couplers_to_axi_interconnect_0_WSTRB;
  wire [0:0]m08_couplers_to_axi_interconnect_0_WVALID;
  wire [31:0]m09_couplers_to_axi_interconnect_0_ARADDR;
  wire [0:0]m09_couplers_to_axi_interconnect_0_ARREADY;
  wire [0:0]m09_couplers_to_axi_interconnect_0_ARVALID;
  wire [31:0]m09_couplers_to_axi_interconnect_0_AWADDR;
  wire [0:0]m09_couplers_to_axi_interconnect_0_AWREADY;
  wire [0:0]m09_couplers_to_axi_interconnect_0_AWVALID;
  wire [0:0]m09_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m09_couplers_to_axi_interconnect_0_BRESP;
  wire [0:0]m09_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m09_couplers_to_axi_interconnect_0_RDATA;
  wire [0:0]m09_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m09_couplers_to_axi_interconnect_0_RRESP;
  wire [0:0]m09_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m09_couplers_to_axi_interconnect_0_WDATA;
  wire [0:0]m09_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m09_couplers_to_axi_interconnect_0_WSTRB;
  wire [0:0]m09_couplers_to_axi_interconnect_0_WVALID;
  wire [31:0]m10_couplers_to_axi_interconnect_0_ARADDR;
  wire [0:0]m10_couplers_to_axi_interconnect_0_ARREADY;
  wire [0:0]m10_couplers_to_axi_interconnect_0_ARVALID;
  wire [31:0]m10_couplers_to_axi_interconnect_0_AWADDR;
  wire [0:0]m10_couplers_to_axi_interconnect_0_AWREADY;
  wire [0:0]m10_couplers_to_axi_interconnect_0_AWVALID;
  wire [0:0]m10_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m10_couplers_to_axi_interconnect_0_BRESP;
  wire [0:0]m10_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m10_couplers_to_axi_interconnect_0_RDATA;
  wire [0:0]m10_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m10_couplers_to_axi_interconnect_0_RRESP;
  wire [0:0]m10_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m10_couplers_to_axi_interconnect_0_WDATA;
  wire [0:0]m10_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m10_couplers_to_axi_interconnect_0_WSTRB;
  wire [0:0]m10_couplers_to_axi_interconnect_0_WVALID;
  wire [31:0]m11_couplers_to_axi_interconnect_0_ARADDR;
  wire [0:0]m11_couplers_to_axi_interconnect_0_ARREADY;
  wire [0:0]m11_couplers_to_axi_interconnect_0_ARVALID;
  wire [31:0]m11_couplers_to_axi_interconnect_0_AWADDR;
  wire [0:0]m11_couplers_to_axi_interconnect_0_AWREADY;
  wire [0:0]m11_couplers_to_axi_interconnect_0_AWVALID;
  wire [0:0]m11_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m11_couplers_to_axi_interconnect_0_BRESP;
  wire [0:0]m11_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m11_couplers_to_axi_interconnect_0_RDATA;
  wire [0:0]m11_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m11_couplers_to_axi_interconnect_0_RRESP;
  wire [0:0]m11_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m11_couplers_to_axi_interconnect_0_WDATA;
  wire [0:0]m11_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m11_couplers_to_axi_interconnect_0_WSTRB;
  wire [0:0]m11_couplers_to_axi_interconnect_0_WVALID;
  wire [31:0]m12_couplers_to_axi_interconnect_0_ARADDR;
  wire [0:0]m12_couplers_to_axi_interconnect_0_ARREADY;
  wire [0:0]m12_couplers_to_axi_interconnect_0_ARVALID;
  wire [31:0]m12_couplers_to_axi_interconnect_0_AWADDR;
  wire [0:0]m12_couplers_to_axi_interconnect_0_AWREADY;
  wire [0:0]m12_couplers_to_axi_interconnect_0_AWVALID;
  wire [0:0]m12_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m12_couplers_to_axi_interconnect_0_BRESP;
  wire [0:0]m12_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m12_couplers_to_axi_interconnect_0_RDATA;
  wire [0:0]m12_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m12_couplers_to_axi_interconnect_0_RRESP;
  wire [0:0]m12_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m12_couplers_to_axi_interconnect_0_WDATA;
  wire [0:0]m12_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m12_couplers_to_axi_interconnect_0_WSTRB;
  wire [0:0]m12_couplers_to_axi_interconnect_0_WVALID;
  wire [31:0]m13_couplers_to_axi_interconnect_0_ARADDR;
  wire [0:0]m13_couplers_to_axi_interconnect_0_ARREADY;
  wire [0:0]m13_couplers_to_axi_interconnect_0_ARVALID;
  wire [31:0]m13_couplers_to_axi_interconnect_0_AWADDR;
  wire [0:0]m13_couplers_to_axi_interconnect_0_AWREADY;
  wire [0:0]m13_couplers_to_axi_interconnect_0_AWVALID;
  wire [0:0]m13_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m13_couplers_to_axi_interconnect_0_BRESP;
  wire [0:0]m13_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m13_couplers_to_axi_interconnect_0_RDATA;
  wire [0:0]m13_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m13_couplers_to_axi_interconnect_0_RRESP;
  wire [0:0]m13_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m13_couplers_to_axi_interconnect_0_WDATA;
  wire [0:0]m13_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m13_couplers_to_axi_interconnect_0_WSTRB;
  wire [0:0]m13_couplers_to_axi_interconnect_0_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire s00_couplers_to_xbar_AWVALID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire s00_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [0:0]xbar_to_m00_couplers_ARREADY;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [0:0]xbar_to_m00_couplers_AWREADY;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire [0:0]xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire [0:0]xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [63:32]xbar_to_m01_couplers_ARADDR;
  wire [0:0]xbar_to_m01_couplers_ARREADY;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [63:32]xbar_to_m01_couplers_AWADDR;
  wire [0:0]xbar_to_m01_couplers_AWREADY;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire [0:0]xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire [0:0]xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire [0:0]xbar_to_m01_couplers_WREADY;
  wire [7:4]xbar_to_m01_couplers_WSTRB;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [95:64]xbar_to_m02_couplers_ARADDR;
  wire [0:0]xbar_to_m02_couplers_ARREADY;
  wire [2:2]xbar_to_m02_couplers_ARVALID;
  wire [95:64]xbar_to_m02_couplers_AWADDR;
  wire [0:0]xbar_to_m02_couplers_AWREADY;
  wire [2:2]xbar_to_m02_couplers_AWVALID;
  wire [2:2]xbar_to_m02_couplers_BREADY;
  wire [1:0]xbar_to_m02_couplers_BRESP;
  wire [0:0]xbar_to_m02_couplers_BVALID;
  wire [31:0]xbar_to_m02_couplers_RDATA;
  wire [2:2]xbar_to_m02_couplers_RREADY;
  wire [1:0]xbar_to_m02_couplers_RRESP;
  wire [0:0]xbar_to_m02_couplers_RVALID;
  wire [95:64]xbar_to_m02_couplers_WDATA;
  wire [0:0]xbar_to_m02_couplers_WREADY;
  wire [11:8]xbar_to_m02_couplers_WSTRB;
  wire [2:2]xbar_to_m02_couplers_WVALID;
  wire [127:96]xbar_to_m03_couplers_ARADDR;
  wire [0:0]xbar_to_m03_couplers_ARREADY;
  wire [3:3]xbar_to_m03_couplers_ARVALID;
  wire [127:96]xbar_to_m03_couplers_AWADDR;
  wire [0:0]xbar_to_m03_couplers_AWREADY;
  wire [3:3]xbar_to_m03_couplers_AWVALID;
  wire [3:3]xbar_to_m03_couplers_BREADY;
  wire [1:0]xbar_to_m03_couplers_BRESP;
  wire [0:0]xbar_to_m03_couplers_BVALID;
  wire [31:0]xbar_to_m03_couplers_RDATA;
  wire [3:3]xbar_to_m03_couplers_RREADY;
  wire [1:0]xbar_to_m03_couplers_RRESP;
  wire [0:0]xbar_to_m03_couplers_RVALID;
  wire [127:96]xbar_to_m03_couplers_WDATA;
  wire [0:0]xbar_to_m03_couplers_WREADY;
  wire [15:12]xbar_to_m03_couplers_WSTRB;
  wire [3:3]xbar_to_m03_couplers_WVALID;
  wire [159:128]xbar_to_m04_couplers_ARADDR;
  wire [0:0]xbar_to_m04_couplers_ARREADY;
  wire [4:4]xbar_to_m04_couplers_ARVALID;
  wire [159:128]xbar_to_m04_couplers_AWADDR;
  wire [0:0]xbar_to_m04_couplers_AWREADY;
  wire [4:4]xbar_to_m04_couplers_AWVALID;
  wire [4:4]xbar_to_m04_couplers_BREADY;
  wire [1:0]xbar_to_m04_couplers_BRESP;
  wire [0:0]xbar_to_m04_couplers_BVALID;
  wire [31:0]xbar_to_m04_couplers_RDATA;
  wire [4:4]xbar_to_m04_couplers_RREADY;
  wire [1:0]xbar_to_m04_couplers_RRESP;
  wire [0:0]xbar_to_m04_couplers_RVALID;
  wire [159:128]xbar_to_m04_couplers_WDATA;
  wire [0:0]xbar_to_m04_couplers_WREADY;
  wire [19:16]xbar_to_m04_couplers_WSTRB;
  wire [4:4]xbar_to_m04_couplers_WVALID;
  wire [191:160]xbar_to_m05_couplers_ARADDR;
  wire [0:0]xbar_to_m05_couplers_ARREADY;
  wire [5:5]xbar_to_m05_couplers_ARVALID;
  wire [191:160]xbar_to_m05_couplers_AWADDR;
  wire [0:0]xbar_to_m05_couplers_AWREADY;
  wire [5:5]xbar_to_m05_couplers_AWVALID;
  wire [5:5]xbar_to_m05_couplers_BREADY;
  wire [1:0]xbar_to_m05_couplers_BRESP;
  wire [0:0]xbar_to_m05_couplers_BVALID;
  wire [31:0]xbar_to_m05_couplers_RDATA;
  wire [5:5]xbar_to_m05_couplers_RREADY;
  wire [1:0]xbar_to_m05_couplers_RRESP;
  wire [0:0]xbar_to_m05_couplers_RVALID;
  wire [191:160]xbar_to_m05_couplers_WDATA;
  wire [0:0]xbar_to_m05_couplers_WREADY;
  wire [23:20]xbar_to_m05_couplers_WSTRB;
  wire [5:5]xbar_to_m05_couplers_WVALID;
  wire [223:192]xbar_to_m06_couplers_ARADDR;
  wire [0:0]xbar_to_m06_couplers_ARREADY;
  wire [6:6]xbar_to_m06_couplers_ARVALID;
  wire [223:192]xbar_to_m06_couplers_AWADDR;
  wire [0:0]xbar_to_m06_couplers_AWREADY;
  wire [6:6]xbar_to_m06_couplers_AWVALID;
  wire [6:6]xbar_to_m06_couplers_BREADY;
  wire [1:0]xbar_to_m06_couplers_BRESP;
  wire [0:0]xbar_to_m06_couplers_BVALID;
  wire [31:0]xbar_to_m06_couplers_RDATA;
  wire [6:6]xbar_to_m06_couplers_RREADY;
  wire [1:0]xbar_to_m06_couplers_RRESP;
  wire [0:0]xbar_to_m06_couplers_RVALID;
  wire [223:192]xbar_to_m06_couplers_WDATA;
  wire [0:0]xbar_to_m06_couplers_WREADY;
  wire [27:24]xbar_to_m06_couplers_WSTRB;
  wire [6:6]xbar_to_m06_couplers_WVALID;
  wire [255:224]xbar_to_m07_couplers_ARADDR;
  wire [23:21]xbar_to_m07_couplers_ARPROT;
  wire [0:0]xbar_to_m07_couplers_ARREADY;
  wire [7:7]xbar_to_m07_couplers_ARVALID;
  wire [255:224]xbar_to_m07_couplers_AWADDR;
  wire [23:21]xbar_to_m07_couplers_AWPROT;
  wire [0:0]xbar_to_m07_couplers_AWREADY;
  wire [7:7]xbar_to_m07_couplers_AWVALID;
  wire [7:7]xbar_to_m07_couplers_BREADY;
  wire [1:0]xbar_to_m07_couplers_BRESP;
  wire [0:0]xbar_to_m07_couplers_BVALID;
  wire [31:0]xbar_to_m07_couplers_RDATA;
  wire [7:7]xbar_to_m07_couplers_RREADY;
  wire [1:0]xbar_to_m07_couplers_RRESP;
  wire [0:0]xbar_to_m07_couplers_RVALID;
  wire [255:224]xbar_to_m07_couplers_WDATA;
  wire [0:0]xbar_to_m07_couplers_WREADY;
  wire [31:28]xbar_to_m07_couplers_WSTRB;
  wire [7:7]xbar_to_m07_couplers_WVALID;
  wire [287:256]xbar_to_m08_couplers_ARADDR;
  wire [0:0]xbar_to_m08_couplers_ARREADY;
  wire [8:8]xbar_to_m08_couplers_ARVALID;
  wire [287:256]xbar_to_m08_couplers_AWADDR;
  wire [0:0]xbar_to_m08_couplers_AWREADY;
  wire [8:8]xbar_to_m08_couplers_AWVALID;
  wire [8:8]xbar_to_m08_couplers_BREADY;
  wire [1:0]xbar_to_m08_couplers_BRESP;
  wire [0:0]xbar_to_m08_couplers_BVALID;
  wire [31:0]xbar_to_m08_couplers_RDATA;
  wire [8:8]xbar_to_m08_couplers_RREADY;
  wire [1:0]xbar_to_m08_couplers_RRESP;
  wire [0:0]xbar_to_m08_couplers_RVALID;
  wire [287:256]xbar_to_m08_couplers_WDATA;
  wire [0:0]xbar_to_m08_couplers_WREADY;
  wire [35:32]xbar_to_m08_couplers_WSTRB;
  wire [8:8]xbar_to_m08_couplers_WVALID;
  wire [319:288]xbar_to_m09_couplers_ARADDR;
  wire [0:0]xbar_to_m09_couplers_ARREADY;
  wire [9:9]xbar_to_m09_couplers_ARVALID;
  wire [319:288]xbar_to_m09_couplers_AWADDR;
  wire [0:0]xbar_to_m09_couplers_AWREADY;
  wire [9:9]xbar_to_m09_couplers_AWVALID;
  wire [9:9]xbar_to_m09_couplers_BREADY;
  wire [1:0]xbar_to_m09_couplers_BRESP;
  wire [0:0]xbar_to_m09_couplers_BVALID;
  wire [31:0]xbar_to_m09_couplers_RDATA;
  wire [9:9]xbar_to_m09_couplers_RREADY;
  wire [1:0]xbar_to_m09_couplers_RRESP;
  wire [0:0]xbar_to_m09_couplers_RVALID;
  wire [319:288]xbar_to_m09_couplers_WDATA;
  wire [0:0]xbar_to_m09_couplers_WREADY;
  wire [39:36]xbar_to_m09_couplers_WSTRB;
  wire [9:9]xbar_to_m09_couplers_WVALID;
  wire [351:320]xbar_to_m10_couplers_ARADDR;
  wire [0:0]xbar_to_m10_couplers_ARREADY;
  wire [10:10]xbar_to_m10_couplers_ARVALID;
  wire [351:320]xbar_to_m10_couplers_AWADDR;
  wire [0:0]xbar_to_m10_couplers_AWREADY;
  wire [10:10]xbar_to_m10_couplers_AWVALID;
  wire [10:10]xbar_to_m10_couplers_BREADY;
  wire [1:0]xbar_to_m10_couplers_BRESP;
  wire [0:0]xbar_to_m10_couplers_BVALID;
  wire [31:0]xbar_to_m10_couplers_RDATA;
  wire [10:10]xbar_to_m10_couplers_RREADY;
  wire [1:0]xbar_to_m10_couplers_RRESP;
  wire [0:0]xbar_to_m10_couplers_RVALID;
  wire [351:320]xbar_to_m10_couplers_WDATA;
  wire [0:0]xbar_to_m10_couplers_WREADY;
  wire [43:40]xbar_to_m10_couplers_WSTRB;
  wire [10:10]xbar_to_m10_couplers_WVALID;
  wire [383:352]xbar_to_m11_couplers_ARADDR;
  wire [0:0]xbar_to_m11_couplers_ARREADY;
  wire [11:11]xbar_to_m11_couplers_ARVALID;
  wire [383:352]xbar_to_m11_couplers_AWADDR;
  wire [0:0]xbar_to_m11_couplers_AWREADY;
  wire [11:11]xbar_to_m11_couplers_AWVALID;
  wire [11:11]xbar_to_m11_couplers_BREADY;
  wire [1:0]xbar_to_m11_couplers_BRESP;
  wire [0:0]xbar_to_m11_couplers_BVALID;
  wire [31:0]xbar_to_m11_couplers_RDATA;
  wire [11:11]xbar_to_m11_couplers_RREADY;
  wire [1:0]xbar_to_m11_couplers_RRESP;
  wire [0:0]xbar_to_m11_couplers_RVALID;
  wire [383:352]xbar_to_m11_couplers_WDATA;
  wire [0:0]xbar_to_m11_couplers_WREADY;
  wire [47:44]xbar_to_m11_couplers_WSTRB;
  wire [11:11]xbar_to_m11_couplers_WVALID;
  wire [415:384]xbar_to_m12_couplers_ARADDR;
  wire [0:0]xbar_to_m12_couplers_ARREADY;
  wire [12:12]xbar_to_m12_couplers_ARVALID;
  wire [415:384]xbar_to_m12_couplers_AWADDR;
  wire [0:0]xbar_to_m12_couplers_AWREADY;
  wire [12:12]xbar_to_m12_couplers_AWVALID;
  wire [12:12]xbar_to_m12_couplers_BREADY;
  wire [1:0]xbar_to_m12_couplers_BRESP;
  wire [0:0]xbar_to_m12_couplers_BVALID;
  wire [31:0]xbar_to_m12_couplers_RDATA;
  wire [12:12]xbar_to_m12_couplers_RREADY;
  wire [1:0]xbar_to_m12_couplers_RRESP;
  wire [0:0]xbar_to_m12_couplers_RVALID;
  wire [415:384]xbar_to_m12_couplers_WDATA;
  wire [0:0]xbar_to_m12_couplers_WREADY;
  wire [51:48]xbar_to_m12_couplers_WSTRB;
  wire [12:12]xbar_to_m12_couplers_WVALID;
  wire [447:416]xbar_to_m13_couplers_ARADDR;
  wire [0:0]xbar_to_m13_couplers_ARREADY;
  wire [13:13]xbar_to_m13_couplers_ARVALID;
  wire [447:416]xbar_to_m13_couplers_AWADDR;
  wire [0:0]xbar_to_m13_couplers_AWREADY;
  wire [13:13]xbar_to_m13_couplers_AWVALID;
  wire [13:13]xbar_to_m13_couplers_BREADY;
  wire [1:0]xbar_to_m13_couplers_BRESP;
  wire [0:0]xbar_to_m13_couplers_BVALID;
  wire [31:0]xbar_to_m13_couplers_RDATA;
  wire [13:13]xbar_to_m13_couplers_RREADY;
  wire [1:0]xbar_to_m13_couplers_RRESP;
  wire [0:0]xbar_to_m13_couplers_RVALID;
  wire [447:416]xbar_to_m13_couplers_WDATA;
  wire [0:0]xbar_to_m13_couplers_WREADY;
  wire [55:52]xbar_to_m13_couplers_WSTRB;
  wire [13:13]xbar_to_m13_couplers_WVALID;
  wire [41:0]NLW_xbar_m_axi_arprot_UNCONNECTED;
  wire [41:0]NLW_xbar_m_axi_awprot_UNCONNECTED;

  assign M00_ACLK_1 = M00_ACLK;
  assign M00_ARESETN_1 = M00_ARESETN;
  assign M00_AXI_araddr[31:0] = m00_couplers_to_axi_interconnect_0_ARADDR;
  assign M00_AXI_arvalid[0] = m00_couplers_to_axi_interconnect_0_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_couplers_to_axi_interconnect_0_AWADDR;
  assign M00_AXI_awvalid[0] = m00_couplers_to_axi_interconnect_0_AWVALID;
  assign M00_AXI_bready[0] = m00_couplers_to_axi_interconnect_0_BREADY;
  assign M00_AXI_rready[0] = m00_couplers_to_axi_interconnect_0_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_axi_interconnect_0_WDATA;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_axi_interconnect_0_WSTRB;
  assign M00_AXI_wvalid[0] = m00_couplers_to_axi_interconnect_0_WVALID;
  assign M01_ACLK_1 = M01_ACLK;
  assign M01_ARESETN_1 = M01_ARESETN;
  assign M01_AXI_araddr[31:0] = m01_couplers_to_axi_interconnect_0_ARADDR;
  assign M01_AXI_arvalid[0] = m01_couplers_to_axi_interconnect_0_ARVALID;
  assign M01_AXI_awaddr[31:0] = m01_couplers_to_axi_interconnect_0_AWADDR;
  assign M01_AXI_awvalid[0] = m01_couplers_to_axi_interconnect_0_AWVALID;
  assign M01_AXI_bready[0] = m01_couplers_to_axi_interconnect_0_BREADY;
  assign M01_AXI_rready[0] = m01_couplers_to_axi_interconnect_0_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_axi_interconnect_0_WDATA;
  assign M01_AXI_wstrb[3:0] = m01_couplers_to_axi_interconnect_0_WSTRB;
  assign M01_AXI_wvalid[0] = m01_couplers_to_axi_interconnect_0_WVALID;
  assign M02_ACLK_1 = M02_ACLK;
  assign M02_ARESETN_1 = M02_ARESETN;
  assign M02_AXI_araddr[31:0] = m02_couplers_to_axi_interconnect_0_ARADDR;
  assign M02_AXI_arvalid[0] = m02_couplers_to_axi_interconnect_0_ARVALID;
  assign M02_AXI_awaddr[31:0] = m02_couplers_to_axi_interconnect_0_AWADDR;
  assign M02_AXI_awvalid[0] = m02_couplers_to_axi_interconnect_0_AWVALID;
  assign M02_AXI_bready[0] = m02_couplers_to_axi_interconnect_0_BREADY;
  assign M02_AXI_rready[0] = m02_couplers_to_axi_interconnect_0_RREADY;
  assign M02_AXI_wdata[31:0] = m02_couplers_to_axi_interconnect_0_WDATA;
  assign M02_AXI_wstrb[3:0] = m02_couplers_to_axi_interconnect_0_WSTRB;
  assign M02_AXI_wvalid[0] = m02_couplers_to_axi_interconnect_0_WVALID;
  assign M03_ACLK_1 = M03_ACLK;
  assign M03_ARESETN_1 = M03_ARESETN;
  assign M03_AXI_araddr[31:0] = m03_couplers_to_axi_interconnect_0_ARADDR;
  assign M03_AXI_arvalid[0] = m03_couplers_to_axi_interconnect_0_ARVALID;
  assign M03_AXI_awaddr[31:0] = m03_couplers_to_axi_interconnect_0_AWADDR;
  assign M03_AXI_awvalid[0] = m03_couplers_to_axi_interconnect_0_AWVALID;
  assign M03_AXI_bready[0] = m03_couplers_to_axi_interconnect_0_BREADY;
  assign M03_AXI_rready[0] = m03_couplers_to_axi_interconnect_0_RREADY;
  assign M03_AXI_wdata[31:0] = m03_couplers_to_axi_interconnect_0_WDATA;
  assign M03_AXI_wstrb[3:0] = m03_couplers_to_axi_interconnect_0_WSTRB;
  assign M03_AXI_wvalid[0] = m03_couplers_to_axi_interconnect_0_WVALID;
  assign M04_ACLK_1 = M04_ACLK;
  assign M04_ARESETN_1 = M04_ARESETN;
  assign M04_AXI_araddr[31:0] = m04_couplers_to_axi_interconnect_0_ARADDR;
  assign M04_AXI_arvalid[0] = m04_couplers_to_axi_interconnect_0_ARVALID;
  assign M04_AXI_awaddr[31:0] = m04_couplers_to_axi_interconnect_0_AWADDR;
  assign M04_AXI_awvalid[0] = m04_couplers_to_axi_interconnect_0_AWVALID;
  assign M04_AXI_bready[0] = m04_couplers_to_axi_interconnect_0_BREADY;
  assign M04_AXI_rready[0] = m04_couplers_to_axi_interconnect_0_RREADY;
  assign M04_AXI_wdata[31:0] = m04_couplers_to_axi_interconnect_0_WDATA;
  assign M04_AXI_wstrb[3:0] = m04_couplers_to_axi_interconnect_0_WSTRB;
  assign M04_AXI_wvalid[0] = m04_couplers_to_axi_interconnect_0_WVALID;
  assign M05_ACLK_1 = M05_ACLK;
  assign M05_ARESETN_1 = M05_ARESETN;
  assign M05_AXI_araddr[31:0] = m05_couplers_to_axi_interconnect_0_ARADDR;
  assign M05_AXI_arvalid[0] = m05_couplers_to_axi_interconnect_0_ARVALID;
  assign M05_AXI_awaddr[31:0] = m05_couplers_to_axi_interconnect_0_AWADDR;
  assign M05_AXI_awvalid[0] = m05_couplers_to_axi_interconnect_0_AWVALID;
  assign M05_AXI_bready[0] = m05_couplers_to_axi_interconnect_0_BREADY;
  assign M05_AXI_rready[0] = m05_couplers_to_axi_interconnect_0_RREADY;
  assign M05_AXI_wdata[31:0] = m05_couplers_to_axi_interconnect_0_WDATA;
  assign M05_AXI_wstrb[3:0] = m05_couplers_to_axi_interconnect_0_WSTRB;
  assign M05_AXI_wvalid[0] = m05_couplers_to_axi_interconnect_0_WVALID;
  assign M06_ACLK_1 = M06_ACLK;
  assign M06_ARESETN_1 = M06_ARESETN;
  assign M06_AXI_araddr[31:0] = m06_couplers_to_axi_interconnect_0_ARADDR;
  assign M06_AXI_arvalid[0] = m06_couplers_to_axi_interconnect_0_ARVALID;
  assign M06_AXI_awaddr[31:0] = m06_couplers_to_axi_interconnect_0_AWADDR;
  assign M06_AXI_awvalid[0] = m06_couplers_to_axi_interconnect_0_AWVALID;
  assign M06_AXI_bready[0] = m06_couplers_to_axi_interconnect_0_BREADY;
  assign M06_AXI_rready[0] = m06_couplers_to_axi_interconnect_0_RREADY;
  assign M06_AXI_wdata[31:0] = m06_couplers_to_axi_interconnect_0_WDATA;
  assign M06_AXI_wstrb[3:0] = m06_couplers_to_axi_interconnect_0_WSTRB;
  assign M06_AXI_wvalid[0] = m06_couplers_to_axi_interconnect_0_WVALID;
  assign M07_ACLK_1 = M07_ACLK;
  assign M07_ARESETN_1 = M07_ARESETN;
  assign M07_AXI_araddr[31:0] = m07_couplers_to_axi_interconnect_0_ARADDR;
  assign M07_AXI_arprot[2:0] = m07_couplers_to_axi_interconnect_0_ARPROT;
  assign M07_AXI_arvalid[0] = m07_couplers_to_axi_interconnect_0_ARVALID;
  assign M07_AXI_awaddr[31:0] = m07_couplers_to_axi_interconnect_0_AWADDR;
  assign M07_AXI_awprot[2:0] = m07_couplers_to_axi_interconnect_0_AWPROT;
  assign M07_AXI_awvalid[0] = m07_couplers_to_axi_interconnect_0_AWVALID;
  assign M07_AXI_bready[0] = m07_couplers_to_axi_interconnect_0_BREADY;
  assign M07_AXI_rready[0] = m07_couplers_to_axi_interconnect_0_RREADY;
  assign M07_AXI_wdata[31:0] = m07_couplers_to_axi_interconnect_0_WDATA;
  assign M07_AXI_wstrb[3:0] = m07_couplers_to_axi_interconnect_0_WSTRB;
  assign M07_AXI_wvalid[0] = m07_couplers_to_axi_interconnect_0_WVALID;
  assign M08_ACLK_1 = M08_ACLK;
  assign M08_ARESETN_1 = M08_ARESETN;
  assign M08_AXI_araddr[31:0] = m08_couplers_to_axi_interconnect_0_ARADDR;
  assign M08_AXI_arvalid[0] = m08_couplers_to_axi_interconnect_0_ARVALID;
  assign M08_AXI_awaddr[31:0] = m08_couplers_to_axi_interconnect_0_AWADDR;
  assign M08_AXI_awvalid[0] = m08_couplers_to_axi_interconnect_0_AWVALID;
  assign M08_AXI_bready[0] = m08_couplers_to_axi_interconnect_0_BREADY;
  assign M08_AXI_rready[0] = m08_couplers_to_axi_interconnect_0_RREADY;
  assign M08_AXI_wdata[31:0] = m08_couplers_to_axi_interconnect_0_WDATA;
  assign M08_AXI_wstrb[3:0] = m08_couplers_to_axi_interconnect_0_WSTRB;
  assign M08_AXI_wvalid[0] = m08_couplers_to_axi_interconnect_0_WVALID;
  assign M09_ACLK_1 = M09_ACLK;
  assign M09_ARESETN_1 = M09_ARESETN;
  assign M09_AXI_araddr[31:0] = m09_couplers_to_axi_interconnect_0_ARADDR;
  assign M09_AXI_arvalid[0] = m09_couplers_to_axi_interconnect_0_ARVALID;
  assign M09_AXI_awaddr[31:0] = m09_couplers_to_axi_interconnect_0_AWADDR;
  assign M09_AXI_awvalid[0] = m09_couplers_to_axi_interconnect_0_AWVALID;
  assign M09_AXI_bready[0] = m09_couplers_to_axi_interconnect_0_BREADY;
  assign M09_AXI_rready[0] = m09_couplers_to_axi_interconnect_0_RREADY;
  assign M09_AXI_wdata[31:0] = m09_couplers_to_axi_interconnect_0_WDATA;
  assign M09_AXI_wstrb[3:0] = m09_couplers_to_axi_interconnect_0_WSTRB;
  assign M09_AXI_wvalid[0] = m09_couplers_to_axi_interconnect_0_WVALID;
  assign M10_ACLK_1 = M10_ACLK;
  assign M10_ARESETN_1 = M10_ARESETN;
  assign M10_AXI_araddr[31:0] = m10_couplers_to_axi_interconnect_0_ARADDR;
  assign M10_AXI_arvalid[0] = m10_couplers_to_axi_interconnect_0_ARVALID;
  assign M10_AXI_awaddr[31:0] = m10_couplers_to_axi_interconnect_0_AWADDR;
  assign M10_AXI_awvalid[0] = m10_couplers_to_axi_interconnect_0_AWVALID;
  assign M10_AXI_bready[0] = m10_couplers_to_axi_interconnect_0_BREADY;
  assign M10_AXI_rready[0] = m10_couplers_to_axi_interconnect_0_RREADY;
  assign M10_AXI_wdata[31:0] = m10_couplers_to_axi_interconnect_0_WDATA;
  assign M10_AXI_wstrb[3:0] = m10_couplers_to_axi_interconnect_0_WSTRB;
  assign M10_AXI_wvalid[0] = m10_couplers_to_axi_interconnect_0_WVALID;
  assign M11_ACLK_1 = M11_ACLK;
  assign M11_ARESETN_1 = M11_ARESETN;
  assign M11_AXI_araddr[31:0] = m11_couplers_to_axi_interconnect_0_ARADDR;
  assign M11_AXI_arvalid[0] = m11_couplers_to_axi_interconnect_0_ARVALID;
  assign M11_AXI_awaddr[31:0] = m11_couplers_to_axi_interconnect_0_AWADDR;
  assign M11_AXI_awvalid[0] = m11_couplers_to_axi_interconnect_0_AWVALID;
  assign M11_AXI_bready[0] = m11_couplers_to_axi_interconnect_0_BREADY;
  assign M11_AXI_rready[0] = m11_couplers_to_axi_interconnect_0_RREADY;
  assign M11_AXI_wdata[31:0] = m11_couplers_to_axi_interconnect_0_WDATA;
  assign M11_AXI_wstrb[3:0] = m11_couplers_to_axi_interconnect_0_WSTRB;
  assign M11_AXI_wvalid[0] = m11_couplers_to_axi_interconnect_0_WVALID;
  assign M12_ACLK_1 = M12_ACLK;
  assign M12_ARESETN_1 = M12_ARESETN;
  assign M12_AXI_araddr[31:0] = m12_couplers_to_axi_interconnect_0_ARADDR;
  assign M12_AXI_arvalid[0] = m12_couplers_to_axi_interconnect_0_ARVALID;
  assign M12_AXI_awaddr[31:0] = m12_couplers_to_axi_interconnect_0_AWADDR;
  assign M12_AXI_awvalid[0] = m12_couplers_to_axi_interconnect_0_AWVALID;
  assign M12_AXI_bready[0] = m12_couplers_to_axi_interconnect_0_BREADY;
  assign M12_AXI_rready[0] = m12_couplers_to_axi_interconnect_0_RREADY;
  assign M12_AXI_wdata[31:0] = m12_couplers_to_axi_interconnect_0_WDATA;
  assign M12_AXI_wstrb[3:0] = m12_couplers_to_axi_interconnect_0_WSTRB;
  assign M12_AXI_wvalid[0] = m12_couplers_to_axi_interconnect_0_WVALID;
  assign M13_ACLK_1 = M13_ACLK;
  assign M13_ARESETN_1 = M13_ARESETN;
  assign M13_AXI_araddr[31:0] = m13_couplers_to_axi_interconnect_0_ARADDR;
  assign M13_AXI_arvalid[0] = m13_couplers_to_axi_interconnect_0_ARVALID;
  assign M13_AXI_awaddr[31:0] = m13_couplers_to_axi_interconnect_0_AWADDR;
  assign M13_AXI_awvalid[0] = m13_couplers_to_axi_interconnect_0_AWVALID;
  assign M13_AXI_bready[0] = m13_couplers_to_axi_interconnect_0_BREADY;
  assign M13_AXI_rready[0] = m13_couplers_to_axi_interconnect_0_RREADY;
  assign M13_AXI_wdata[31:0] = m13_couplers_to_axi_interconnect_0_WDATA;
  assign M13_AXI_wstrb[3:0] = m13_couplers_to_axi_interconnect_0_WSTRB;
  assign M13_AXI_wvalid[0] = m13_couplers_to_axi_interconnect_0_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = axi_interconnect_0_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = axi_interconnect_0_to_s00_couplers_AWREADY;
  assign S00_AXI_bresp[1:0] = axi_interconnect_0_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = axi_interconnect_0_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = axi_interconnect_0_to_s00_couplers_RDATA;
  assign S00_AXI_rresp[1:0] = axi_interconnect_0_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = axi_interconnect_0_to_s00_couplers_RVALID;
  assign S00_AXI_wready = axi_interconnect_0_to_s00_couplers_WREADY;
  assign axi_interconnect_0_ACLK_net = ACLK;
  assign axi_interconnect_0_ARESETN_net = ARESETN;
  assign axi_interconnect_0_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign axi_interconnect_0_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_interconnect_0_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign axi_interconnect_0_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign axi_interconnect_0_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign axi_interconnect_0_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign axi_interconnect_0_to_s00_couplers_BREADY = S00_AXI_bready;
  assign axi_interconnect_0_to_s00_couplers_RREADY = S00_AXI_rready;
  assign axi_interconnect_0_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign axi_interconnect_0_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign axi_interconnect_0_to_s00_couplers_WVALID = S00_AXI_wvalid;
  assign m00_couplers_to_axi_interconnect_0_ARREADY = M00_AXI_arready[0];
  assign m00_couplers_to_axi_interconnect_0_AWREADY = M00_AXI_awready[0];
  assign m00_couplers_to_axi_interconnect_0_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_axi_interconnect_0_BVALID = M00_AXI_bvalid[0];
  assign m00_couplers_to_axi_interconnect_0_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_axi_interconnect_0_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_axi_interconnect_0_RVALID = M00_AXI_rvalid[0];
  assign m00_couplers_to_axi_interconnect_0_WREADY = M00_AXI_wready[0];
  assign m01_couplers_to_axi_interconnect_0_ARREADY = M01_AXI_arready[0];
  assign m01_couplers_to_axi_interconnect_0_AWREADY = M01_AXI_awready[0];
  assign m01_couplers_to_axi_interconnect_0_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_axi_interconnect_0_BVALID = M01_AXI_bvalid[0];
  assign m01_couplers_to_axi_interconnect_0_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_axi_interconnect_0_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_axi_interconnect_0_RVALID = M01_AXI_rvalid[0];
  assign m01_couplers_to_axi_interconnect_0_WREADY = M01_AXI_wready[0];
  assign m02_couplers_to_axi_interconnect_0_ARREADY = M02_AXI_arready[0];
  assign m02_couplers_to_axi_interconnect_0_AWREADY = M02_AXI_awready[0];
  assign m02_couplers_to_axi_interconnect_0_BRESP = M02_AXI_bresp[1:0];
  assign m02_couplers_to_axi_interconnect_0_BVALID = M02_AXI_bvalid[0];
  assign m02_couplers_to_axi_interconnect_0_RDATA = M02_AXI_rdata[31:0];
  assign m02_couplers_to_axi_interconnect_0_RRESP = M02_AXI_rresp[1:0];
  assign m02_couplers_to_axi_interconnect_0_RVALID = M02_AXI_rvalid[0];
  assign m02_couplers_to_axi_interconnect_0_WREADY = M02_AXI_wready[0];
  assign m03_couplers_to_axi_interconnect_0_ARREADY = M03_AXI_arready[0];
  assign m03_couplers_to_axi_interconnect_0_AWREADY = M03_AXI_awready[0];
  assign m03_couplers_to_axi_interconnect_0_BRESP = M03_AXI_bresp[1:0];
  assign m03_couplers_to_axi_interconnect_0_BVALID = M03_AXI_bvalid[0];
  assign m03_couplers_to_axi_interconnect_0_RDATA = M03_AXI_rdata[31:0];
  assign m03_couplers_to_axi_interconnect_0_RRESP = M03_AXI_rresp[1:0];
  assign m03_couplers_to_axi_interconnect_0_RVALID = M03_AXI_rvalid[0];
  assign m03_couplers_to_axi_interconnect_0_WREADY = M03_AXI_wready[0];
  assign m04_couplers_to_axi_interconnect_0_ARREADY = M04_AXI_arready[0];
  assign m04_couplers_to_axi_interconnect_0_AWREADY = M04_AXI_awready[0];
  assign m04_couplers_to_axi_interconnect_0_BRESP = M04_AXI_bresp[1:0];
  assign m04_couplers_to_axi_interconnect_0_BVALID = M04_AXI_bvalid[0];
  assign m04_couplers_to_axi_interconnect_0_RDATA = M04_AXI_rdata[31:0];
  assign m04_couplers_to_axi_interconnect_0_RRESP = M04_AXI_rresp[1:0];
  assign m04_couplers_to_axi_interconnect_0_RVALID = M04_AXI_rvalid[0];
  assign m04_couplers_to_axi_interconnect_0_WREADY = M04_AXI_wready[0];
  assign m05_couplers_to_axi_interconnect_0_ARREADY = M05_AXI_arready[0];
  assign m05_couplers_to_axi_interconnect_0_AWREADY = M05_AXI_awready[0];
  assign m05_couplers_to_axi_interconnect_0_BRESP = M05_AXI_bresp[1:0];
  assign m05_couplers_to_axi_interconnect_0_BVALID = M05_AXI_bvalid[0];
  assign m05_couplers_to_axi_interconnect_0_RDATA = M05_AXI_rdata[31:0];
  assign m05_couplers_to_axi_interconnect_0_RRESP = M05_AXI_rresp[1:0];
  assign m05_couplers_to_axi_interconnect_0_RVALID = M05_AXI_rvalid[0];
  assign m05_couplers_to_axi_interconnect_0_WREADY = M05_AXI_wready[0];
  assign m06_couplers_to_axi_interconnect_0_ARREADY = M06_AXI_arready[0];
  assign m06_couplers_to_axi_interconnect_0_AWREADY = M06_AXI_awready[0];
  assign m06_couplers_to_axi_interconnect_0_BRESP = M06_AXI_bresp[1:0];
  assign m06_couplers_to_axi_interconnect_0_BVALID = M06_AXI_bvalid[0];
  assign m06_couplers_to_axi_interconnect_0_RDATA = M06_AXI_rdata[31:0];
  assign m06_couplers_to_axi_interconnect_0_RRESP = M06_AXI_rresp[1:0];
  assign m06_couplers_to_axi_interconnect_0_RVALID = M06_AXI_rvalid[0];
  assign m06_couplers_to_axi_interconnect_0_WREADY = M06_AXI_wready[0];
  assign m07_couplers_to_axi_interconnect_0_ARREADY = M07_AXI_arready[0];
  assign m07_couplers_to_axi_interconnect_0_AWREADY = M07_AXI_awready[0];
  assign m07_couplers_to_axi_interconnect_0_BRESP = M07_AXI_bresp[1:0];
  assign m07_couplers_to_axi_interconnect_0_BVALID = M07_AXI_bvalid[0];
  assign m07_couplers_to_axi_interconnect_0_RDATA = M07_AXI_rdata[31:0];
  assign m07_couplers_to_axi_interconnect_0_RRESP = M07_AXI_rresp[1:0];
  assign m07_couplers_to_axi_interconnect_0_RVALID = M07_AXI_rvalid[0];
  assign m07_couplers_to_axi_interconnect_0_WREADY = M07_AXI_wready[0];
  assign m08_couplers_to_axi_interconnect_0_ARREADY = M08_AXI_arready[0];
  assign m08_couplers_to_axi_interconnect_0_AWREADY = M08_AXI_awready[0];
  assign m08_couplers_to_axi_interconnect_0_BRESP = M08_AXI_bresp[1:0];
  assign m08_couplers_to_axi_interconnect_0_BVALID = M08_AXI_bvalid[0];
  assign m08_couplers_to_axi_interconnect_0_RDATA = M08_AXI_rdata[31:0];
  assign m08_couplers_to_axi_interconnect_0_RRESP = M08_AXI_rresp[1:0];
  assign m08_couplers_to_axi_interconnect_0_RVALID = M08_AXI_rvalid[0];
  assign m08_couplers_to_axi_interconnect_0_WREADY = M08_AXI_wready[0];
  assign m09_couplers_to_axi_interconnect_0_ARREADY = M09_AXI_arready[0];
  assign m09_couplers_to_axi_interconnect_0_AWREADY = M09_AXI_awready[0];
  assign m09_couplers_to_axi_interconnect_0_BRESP = M09_AXI_bresp[1:0];
  assign m09_couplers_to_axi_interconnect_0_BVALID = M09_AXI_bvalid[0];
  assign m09_couplers_to_axi_interconnect_0_RDATA = M09_AXI_rdata[31:0];
  assign m09_couplers_to_axi_interconnect_0_RRESP = M09_AXI_rresp[1:0];
  assign m09_couplers_to_axi_interconnect_0_RVALID = M09_AXI_rvalid[0];
  assign m09_couplers_to_axi_interconnect_0_WREADY = M09_AXI_wready[0];
  assign m10_couplers_to_axi_interconnect_0_ARREADY = M10_AXI_arready[0];
  assign m10_couplers_to_axi_interconnect_0_AWREADY = M10_AXI_awready[0];
  assign m10_couplers_to_axi_interconnect_0_BRESP = M10_AXI_bresp[1:0];
  assign m10_couplers_to_axi_interconnect_0_BVALID = M10_AXI_bvalid[0];
  assign m10_couplers_to_axi_interconnect_0_RDATA = M10_AXI_rdata[31:0];
  assign m10_couplers_to_axi_interconnect_0_RRESP = M10_AXI_rresp[1:0];
  assign m10_couplers_to_axi_interconnect_0_RVALID = M10_AXI_rvalid[0];
  assign m10_couplers_to_axi_interconnect_0_WREADY = M10_AXI_wready[0];
  assign m11_couplers_to_axi_interconnect_0_ARREADY = M11_AXI_arready[0];
  assign m11_couplers_to_axi_interconnect_0_AWREADY = M11_AXI_awready[0];
  assign m11_couplers_to_axi_interconnect_0_BRESP = M11_AXI_bresp[1:0];
  assign m11_couplers_to_axi_interconnect_0_BVALID = M11_AXI_bvalid[0];
  assign m11_couplers_to_axi_interconnect_0_RDATA = M11_AXI_rdata[31:0];
  assign m11_couplers_to_axi_interconnect_0_RRESP = M11_AXI_rresp[1:0];
  assign m11_couplers_to_axi_interconnect_0_RVALID = M11_AXI_rvalid[0];
  assign m11_couplers_to_axi_interconnect_0_WREADY = M11_AXI_wready[0];
  assign m12_couplers_to_axi_interconnect_0_ARREADY = M12_AXI_arready[0];
  assign m12_couplers_to_axi_interconnect_0_AWREADY = M12_AXI_awready[0];
  assign m12_couplers_to_axi_interconnect_0_BRESP = M12_AXI_bresp[1:0];
  assign m12_couplers_to_axi_interconnect_0_BVALID = M12_AXI_bvalid[0];
  assign m12_couplers_to_axi_interconnect_0_RDATA = M12_AXI_rdata[31:0];
  assign m12_couplers_to_axi_interconnect_0_RRESP = M12_AXI_rresp[1:0];
  assign m12_couplers_to_axi_interconnect_0_RVALID = M12_AXI_rvalid[0];
  assign m12_couplers_to_axi_interconnect_0_WREADY = M12_AXI_wready[0];
  assign m13_couplers_to_axi_interconnect_0_ARREADY = M13_AXI_arready[0];
  assign m13_couplers_to_axi_interconnect_0_AWREADY = M13_AXI_awready[0];
  assign m13_couplers_to_axi_interconnect_0_BRESP = M13_AXI_bresp[1:0];
  assign m13_couplers_to_axi_interconnect_0_BVALID = M13_AXI_bvalid[0];
  assign m13_couplers_to_axi_interconnect_0_RDATA = M13_AXI_rdata[31:0];
  assign m13_couplers_to_axi_interconnect_0_RRESP = M13_AXI_rresp[1:0];
  assign m13_couplers_to_axi_interconnect_0_RVALID = M13_AXI_rvalid[0];
  assign m13_couplers_to_axi_interconnect_0_WREADY = M13_AXI_wready[0];
  m00_couplers_imp_7FU9HM m00_couplers
       (.M_ACLK(M00_ACLK_1),
        .M_ARESETN(M00_ARESETN_1),
        .M_AXI_araddr(m00_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arready(m00_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awready(m00_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m00_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m00_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m00_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m00_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m00_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m00_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m00_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m00_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m00_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m00_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_1YF6DCT m01_couplers
       (.M_ACLK(M01_ACLK_1),
        .M_ARESETN(M01_ARESETN_1),
        .M_AXI_araddr(m01_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arready(m01_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awready(m01_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m01_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m01_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m01_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m01_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m01_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m01_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m01_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m01_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m01_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m01_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m01_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m01_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  m02_couplers_imp_4BUKF9 m02_couplers
       (.M_ACLK(M02_ACLK_1),
        .M_ARESETN(M02_ARESETN_1),
        .M_AXI_araddr(m02_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arready(m02_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m02_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m02_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awready(m02_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m02_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m02_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m02_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m02_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m02_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m02_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m02_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m02_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m02_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m02_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m02_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m02_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m02_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m02_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m02_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m02_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m02_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m02_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m02_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m02_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m02_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m02_couplers_RDATA),
        .S_AXI_rready(xbar_to_m02_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m02_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m02_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m02_couplers_WDATA),
        .S_AXI_wready(xbar_to_m02_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m02_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m02_couplers_WVALID));
  m03_couplers_imp_1SIOA5U m03_couplers
       (.M_ACLK(M03_ACLK_1),
        .M_ARESETN(M03_ARESETN_1),
        .M_AXI_araddr(m03_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arready(m03_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m03_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m03_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awready(m03_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m03_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m03_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m03_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m03_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m03_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m03_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m03_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m03_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m03_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m03_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m03_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m03_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m03_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m03_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m03_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m03_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m03_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m03_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m03_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m03_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m03_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m03_couplers_RDATA),
        .S_AXI_rready(xbar_to_m03_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m03_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m03_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m03_couplers_WDATA),
        .S_AXI_wready(xbar_to_m03_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m03_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m03_couplers_WVALID));
  m04_couplers_imp_DE59AS m04_couplers
       (.M_ACLK(M04_ACLK_1),
        .M_ARESETN(M04_ARESETN_1),
        .M_AXI_araddr(m04_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arready(m04_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m04_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m04_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awready(m04_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m04_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m04_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m04_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m04_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m04_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m04_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m04_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m04_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m04_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m04_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m04_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m04_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m04_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m04_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m04_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m04_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m04_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m04_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m04_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m04_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m04_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m04_couplers_RDATA),
        .S_AXI_rready(xbar_to_m04_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m04_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m04_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m04_couplers_WDATA),
        .S_AXI_wready(xbar_to_m04_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m04_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m04_couplers_WVALID));
  m05_couplers_imp_1NR23SZ m05_couplers
       (.M_ACLK(M05_ACLK_1),
        .M_ARESETN(M05_ARESETN_1),
        .M_AXI_araddr(m05_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arready(m05_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m05_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m05_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awready(m05_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m05_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m05_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m05_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m05_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m05_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m05_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m05_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m05_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m05_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m05_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m05_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m05_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m05_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m05_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m05_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m05_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m05_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m05_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m05_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m05_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m05_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m05_couplers_RDATA),
        .S_AXI_rready(xbar_to_m05_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m05_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m05_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m05_couplers_WDATA),
        .S_AXI_wready(xbar_to_m05_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m05_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m05_couplers_WVALID));
  m06_couplers_imp_AA5KXN m06_couplers
       (.M_ACLK(M06_ACLK_1),
        .M_ARESETN(M06_ARESETN_1),
        .M_AXI_araddr(m06_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arready(m06_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m06_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m06_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awready(m06_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m06_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m06_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m06_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m06_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m06_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m06_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m06_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m06_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m06_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m06_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m06_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m06_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m06_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m06_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m06_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m06_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m06_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m06_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m06_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m06_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m06_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m06_couplers_RDATA),
        .S_AXI_rready(xbar_to_m06_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m06_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m06_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m06_couplers_WDATA),
        .S_AXI_wready(xbar_to_m06_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m06_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m06_couplers_WVALID));
  m07_couplers_imp_1HUJZQK m07_couplers
       (.M_ACLK(M07_ACLK_1),
        .M_ARESETN(M07_ARESETN_1),
        .M_AXI_araddr(m07_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arprot(m07_couplers_to_axi_interconnect_0_ARPROT),
        .M_AXI_arready(m07_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m07_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m07_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awprot(m07_couplers_to_axi_interconnect_0_AWPROT),
        .M_AXI_awready(m07_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m07_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m07_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m07_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m07_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m07_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m07_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m07_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m07_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m07_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m07_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m07_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m07_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m07_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m07_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m07_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m07_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m07_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m07_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m07_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m07_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m07_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m07_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m07_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m07_couplers_RDATA),
        .S_AXI_rready(xbar_to_m07_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m07_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m07_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m07_couplers_WDATA),
        .S_AXI_wready(xbar_to_m07_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m07_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m07_couplers_WVALID));
  m08_couplers_imp_M6U6NQ m08_couplers
       (.M_ACLK(M08_ACLK_1),
        .M_ARESETN(M08_ARESETN_1),
        .M_AXI_araddr(m08_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arready(m08_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m08_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m08_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awready(m08_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m08_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m08_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m08_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m08_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m08_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m08_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m08_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m08_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m08_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m08_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m08_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m08_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m08_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m08_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m08_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m08_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m08_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m08_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m08_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m08_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m08_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m08_couplers_RDATA),
        .S_AXI_rready(xbar_to_m08_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m08_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m08_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m08_couplers_WDATA),
        .S_AXI_wready(xbar_to_m08_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m08_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m08_couplers_WVALID));
  m09_couplers_imp_1AV1FVL m09_couplers
       (.M_ACLK(M09_ACLK_1),
        .M_ARESETN(M09_ARESETN_1),
        .M_AXI_araddr(m09_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arready(m09_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m09_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m09_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awready(m09_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m09_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m09_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m09_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m09_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m09_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m09_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m09_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m09_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m09_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m09_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m09_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m09_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m09_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m09_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m09_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m09_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m09_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m09_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m09_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m09_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m09_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m09_couplers_RDATA),
        .S_AXI_rready(xbar_to_m09_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m09_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m09_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m09_couplers_WDATA),
        .S_AXI_wready(xbar_to_m09_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m09_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m09_couplers_WVALID));
  m10_couplers_imp_WAAQBV m10_couplers
       (.M_ACLK(M10_ACLK_1),
        .M_ARESETN(M10_ARESETN_1),
        .M_AXI_araddr(m10_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arready(m10_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m10_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m10_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awready(m10_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m10_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m10_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m10_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m10_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m10_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m10_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m10_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m10_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m10_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m10_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m10_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m10_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m10_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m10_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m10_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m10_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m10_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m10_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m10_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m10_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m10_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m10_couplers_RDATA),
        .S_AXI_rready(xbar_to_m10_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m10_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m10_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m10_couplers_WDATA),
        .S_AXI_wready(xbar_to_m10_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m10_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m10_couplers_WVALID));
  m11_couplers_imp_14UWQCC m11_couplers
       (.M_ACLK(M11_ACLK_1),
        .M_ARESETN(M11_ARESETN_1),
        .M_AXI_araddr(m11_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arready(m11_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m11_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m11_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awready(m11_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m11_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m11_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m11_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m11_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m11_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m11_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m11_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m11_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m11_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m11_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m11_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m11_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m11_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m11_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m11_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m11_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m11_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m11_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m11_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m11_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m11_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m11_couplers_RDATA),
        .S_AXI_rready(xbar_to_m11_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m11_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m11_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m11_couplers_WDATA),
        .S_AXI_wready(xbar_to_m11_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m11_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m11_couplers_WVALID));
  m12_couplers_imp_QXRQ90 m12_couplers
       (.M_ACLK(M12_ACLK_1),
        .M_ARESETN(M12_ARESETN_1),
        .M_AXI_araddr(m12_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arready(m12_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m12_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m12_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awready(m12_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m12_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m12_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m12_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m12_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m12_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m12_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m12_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m12_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m12_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m12_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m12_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m12_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m12_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m12_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m12_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m12_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m12_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m12_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m12_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m12_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m12_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m12_couplers_RDATA),
        .S_AXI_rready(xbar_to_m12_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m12_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m12_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m12_couplers_WDATA),
        .S_AXI_wready(xbar_to_m12_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m12_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m12_couplers_WVALID));
  m13_couplers_imp_116XQUR m13_couplers
       (.M_ACLK(M13_ACLK_1),
        .M_ARESETN(M13_ARESETN_1),
        .M_AXI_araddr(m13_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arready(m13_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m13_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m13_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awready(m13_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m13_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m13_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m13_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m13_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m13_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m13_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m13_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m13_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m13_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m13_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m13_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m13_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m13_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m13_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m13_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m13_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m13_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m13_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m13_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m13_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m13_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m13_couplers_RDATA),
        .S_AXI_rready(xbar_to_m13_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m13_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m13_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m13_couplers_WDATA),
        .S_AXI_wready(xbar_to_m13_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m13_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m13_couplers_WVALID));
  s00_couplers_imp_2NZU2K s00_couplers
       (.M_ACLK(axi_interconnect_0_ACLK_net),
        .M_ARESETN(axi_interconnect_0_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(axi_interconnect_0_to_s00_couplers_ARADDR),
        .S_AXI_arprot(axi_interconnect_0_to_s00_couplers_ARPROT),
        .S_AXI_arready(axi_interconnect_0_to_s00_couplers_ARREADY),
        .S_AXI_arvalid(axi_interconnect_0_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(axi_interconnect_0_to_s00_couplers_AWADDR),
        .S_AXI_awprot(axi_interconnect_0_to_s00_couplers_AWPROT),
        .S_AXI_awready(axi_interconnect_0_to_s00_couplers_AWREADY),
        .S_AXI_awvalid(axi_interconnect_0_to_s00_couplers_AWVALID),
        .S_AXI_bready(axi_interconnect_0_to_s00_couplers_BREADY),
        .S_AXI_bresp(axi_interconnect_0_to_s00_couplers_BRESP),
        .S_AXI_bvalid(axi_interconnect_0_to_s00_couplers_BVALID),
        .S_AXI_rdata(axi_interconnect_0_to_s00_couplers_RDATA),
        .S_AXI_rready(axi_interconnect_0_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_interconnect_0_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_interconnect_0_to_s00_couplers_RVALID),
        .S_AXI_wdata(axi_interconnect_0_to_s00_couplers_WDATA),
        .S_AXI_wready(axi_interconnect_0_to_s00_couplers_WREADY),
        .S_AXI_wstrb(axi_interconnect_0_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(axi_interconnect_0_to_s00_couplers_WVALID));
  jahwa_daq_system_xbar_1 xbar
       (.aclk(axi_interconnect_0_ACLK_net),
        .aresetn(axi_interconnect_0_ARESETN_net),
        .m_axi_araddr({xbar_to_m13_couplers_ARADDR,xbar_to_m12_couplers_ARADDR,xbar_to_m11_couplers_ARADDR,xbar_to_m10_couplers_ARADDR,xbar_to_m09_couplers_ARADDR,xbar_to_m08_couplers_ARADDR,xbar_to_m07_couplers_ARADDR,xbar_to_m06_couplers_ARADDR,xbar_to_m05_couplers_ARADDR,xbar_to_m04_couplers_ARADDR,xbar_to_m03_couplers_ARADDR,xbar_to_m02_couplers_ARADDR,xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arprot({xbar_to_m07_couplers_ARPROT,NLW_xbar_m_axi_arprot_UNCONNECTED[20:0]}),
        .m_axi_arready({xbar_to_m13_couplers_ARREADY,xbar_to_m12_couplers_ARREADY,xbar_to_m11_couplers_ARREADY,xbar_to_m10_couplers_ARREADY,xbar_to_m09_couplers_ARREADY,xbar_to_m08_couplers_ARREADY,xbar_to_m07_couplers_ARREADY,xbar_to_m06_couplers_ARREADY,xbar_to_m05_couplers_ARREADY,xbar_to_m04_couplers_ARREADY,xbar_to_m03_couplers_ARREADY,xbar_to_m02_couplers_ARREADY,xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arvalid({xbar_to_m13_couplers_ARVALID,xbar_to_m12_couplers_ARVALID,xbar_to_m11_couplers_ARVALID,xbar_to_m10_couplers_ARVALID,xbar_to_m09_couplers_ARVALID,xbar_to_m08_couplers_ARVALID,xbar_to_m07_couplers_ARVALID,xbar_to_m06_couplers_ARVALID,xbar_to_m05_couplers_ARVALID,xbar_to_m04_couplers_ARVALID,xbar_to_m03_couplers_ARVALID,xbar_to_m02_couplers_ARVALID,xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m13_couplers_AWADDR,xbar_to_m12_couplers_AWADDR,xbar_to_m11_couplers_AWADDR,xbar_to_m10_couplers_AWADDR,xbar_to_m09_couplers_AWADDR,xbar_to_m08_couplers_AWADDR,xbar_to_m07_couplers_AWADDR,xbar_to_m06_couplers_AWADDR,xbar_to_m05_couplers_AWADDR,xbar_to_m04_couplers_AWADDR,xbar_to_m03_couplers_AWADDR,xbar_to_m02_couplers_AWADDR,xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awprot({xbar_to_m07_couplers_AWPROT,NLW_xbar_m_axi_awprot_UNCONNECTED[20:0]}),
        .m_axi_awready({xbar_to_m13_couplers_AWREADY,xbar_to_m12_couplers_AWREADY,xbar_to_m11_couplers_AWREADY,xbar_to_m10_couplers_AWREADY,xbar_to_m09_couplers_AWREADY,xbar_to_m08_couplers_AWREADY,xbar_to_m07_couplers_AWREADY,xbar_to_m06_couplers_AWREADY,xbar_to_m05_couplers_AWREADY,xbar_to_m04_couplers_AWREADY,xbar_to_m03_couplers_AWREADY,xbar_to_m02_couplers_AWREADY,xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awvalid({xbar_to_m13_couplers_AWVALID,xbar_to_m12_couplers_AWVALID,xbar_to_m11_couplers_AWVALID,xbar_to_m10_couplers_AWVALID,xbar_to_m09_couplers_AWVALID,xbar_to_m08_couplers_AWVALID,xbar_to_m07_couplers_AWVALID,xbar_to_m06_couplers_AWVALID,xbar_to_m05_couplers_AWVALID,xbar_to_m04_couplers_AWVALID,xbar_to_m03_couplers_AWVALID,xbar_to_m02_couplers_AWVALID,xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bready({xbar_to_m13_couplers_BREADY,xbar_to_m12_couplers_BREADY,xbar_to_m11_couplers_BREADY,xbar_to_m10_couplers_BREADY,xbar_to_m09_couplers_BREADY,xbar_to_m08_couplers_BREADY,xbar_to_m07_couplers_BREADY,xbar_to_m06_couplers_BREADY,xbar_to_m05_couplers_BREADY,xbar_to_m04_couplers_BREADY,xbar_to_m03_couplers_BREADY,xbar_to_m02_couplers_BREADY,xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m13_couplers_BRESP,xbar_to_m12_couplers_BRESP,xbar_to_m11_couplers_BRESP,xbar_to_m10_couplers_BRESP,xbar_to_m09_couplers_BRESP,xbar_to_m08_couplers_BRESP,xbar_to_m07_couplers_BRESP,xbar_to_m06_couplers_BRESP,xbar_to_m05_couplers_BRESP,xbar_to_m04_couplers_BRESP,xbar_to_m03_couplers_BRESP,xbar_to_m02_couplers_BRESP,xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m13_couplers_BVALID,xbar_to_m12_couplers_BVALID,xbar_to_m11_couplers_BVALID,xbar_to_m10_couplers_BVALID,xbar_to_m09_couplers_BVALID,xbar_to_m08_couplers_BVALID,xbar_to_m07_couplers_BVALID,xbar_to_m06_couplers_BVALID,xbar_to_m05_couplers_BVALID,xbar_to_m04_couplers_BVALID,xbar_to_m03_couplers_BVALID,xbar_to_m02_couplers_BVALID,xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m13_couplers_RDATA,xbar_to_m12_couplers_RDATA,xbar_to_m11_couplers_RDATA,xbar_to_m10_couplers_RDATA,xbar_to_m09_couplers_RDATA,xbar_to_m08_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m05_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m02_couplers_RDATA,xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rready({xbar_to_m13_couplers_RREADY,xbar_to_m12_couplers_RREADY,xbar_to_m11_couplers_RREADY,xbar_to_m10_couplers_RREADY,xbar_to_m09_couplers_RREADY,xbar_to_m08_couplers_RREADY,xbar_to_m07_couplers_RREADY,xbar_to_m06_couplers_RREADY,xbar_to_m05_couplers_RREADY,xbar_to_m04_couplers_RREADY,xbar_to_m03_couplers_RREADY,xbar_to_m02_couplers_RREADY,xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m13_couplers_RRESP,xbar_to_m12_couplers_RRESP,xbar_to_m11_couplers_RRESP,xbar_to_m10_couplers_RRESP,xbar_to_m09_couplers_RRESP,xbar_to_m08_couplers_RRESP,xbar_to_m07_couplers_RRESP,xbar_to_m06_couplers_RRESP,xbar_to_m05_couplers_RRESP,xbar_to_m04_couplers_RRESP,xbar_to_m03_couplers_RRESP,xbar_to_m02_couplers_RRESP,xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m13_couplers_RVALID,xbar_to_m12_couplers_RVALID,xbar_to_m11_couplers_RVALID,xbar_to_m10_couplers_RVALID,xbar_to_m09_couplers_RVALID,xbar_to_m08_couplers_RVALID,xbar_to_m07_couplers_RVALID,xbar_to_m06_couplers_RVALID,xbar_to_m05_couplers_RVALID,xbar_to_m04_couplers_RVALID,xbar_to_m03_couplers_RVALID,xbar_to_m02_couplers_RVALID,xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m13_couplers_WDATA,xbar_to_m12_couplers_WDATA,xbar_to_m11_couplers_WDATA,xbar_to_m10_couplers_WDATA,xbar_to_m09_couplers_WDATA,xbar_to_m08_couplers_WDATA,xbar_to_m07_couplers_WDATA,xbar_to_m06_couplers_WDATA,xbar_to_m05_couplers_WDATA,xbar_to_m04_couplers_WDATA,xbar_to_m03_couplers_WDATA,xbar_to_m02_couplers_WDATA,xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wready({xbar_to_m13_couplers_WREADY,xbar_to_m12_couplers_WREADY,xbar_to_m11_couplers_WREADY,xbar_to_m10_couplers_WREADY,xbar_to_m09_couplers_WREADY,xbar_to_m08_couplers_WREADY,xbar_to_m07_couplers_WREADY,xbar_to_m06_couplers_WREADY,xbar_to_m05_couplers_WREADY,xbar_to_m04_couplers_WREADY,xbar_to_m03_couplers_WREADY,xbar_to_m02_couplers_WREADY,xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m13_couplers_WSTRB,xbar_to_m12_couplers_WSTRB,xbar_to_m11_couplers_WSTRB,xbar_to_m10_couplers_WSTRB,xbar_to_m09_couplers_WSTRB,xbar_to_m08_couplers_WSTRB,xbar_to_m07_couplers_WSTRB,xbar_to_m06_couplers_WSTRB,xbar_to_m05_couplers_WSTRB,xbar_to_m04_couplers_WSTRB,xbar_to_m03_couplers_WSTRB,xbar_to_m02_couplers_WSTRB,xbar_to_m01_couplers_WSTRB,xbar_to_m00_couplers_WSTRB}),
        .m_axi_wvalid({xbar_to_m13_couplers_WVALID,xbar_to_m12_couplers_WVALID,xbar_to_m11_couplers_WVALID,xbar_to_m10_couplers_WVALID,xbar_to_m09_couplers_WVALID,xbar_to_m08_couplers_WVALID,xbar_to_m07_couplers_WVALID,xbar_to_m06_couplers_WVALID,xbar_to_m05_couplers_WVALID,xbar_to_m04_couplers_WVALID,xbar_to_m03_couplers_WVALID,xbar_to_m02_couplers_WVALID,xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule

module m00_couplers_imp_7FU9HM
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m00_couplers_to_m00_couplers_ARADDR;
  wire [0:0]m00_couplers_to_m00_couplers_ARREADY;
  wire [0:0]m00_couplers_to_m00_couplers_ARVALID;
  wire [31:0]m00_couplers_to_m00_couplers_AWADDR;
  wire [0:0]m00_couplers_to_m00_couplers_AWREADY;
  wire [0:0]m00_couplers_to_m00_couplers_AWVALID;
  wire [0:0]m00_couplers_to_m00_couplers_BREADY;
  wire [1:0]m00_couplers_to_m00_couplers_BRESP;
  wire [0:0]m00_couplers_to_m00_couplers_BVALID;
  wire [31:0]m00_couplers_to_m00_couplers_RDATA;
  wire [0:0]m00_couplers_to_m00_couplers_RREADY;
  wire [1:0]m00_couplers_to_m00_couplers_RRESP;
  wire [0:0]m00_couplers_to_m00_couplers_RVALID;
  wire [31:0]m00_couplers_to_m00_couplers_WDATA;
  wire [0:0]m00_couplers_to_m00_couplers_WREADY;
  wire [3:0]m00_couplers_to_m00_couplers_WSTRB;
  wire [0:0]m00_couplers_to_m00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m00_couplers_to_m00_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m00_couplers_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m00_couplers_to_m00_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m00_couplers_to_m00_couplers_AWVALID;
  assign M_AXI_bready[0] = m00_couplers_to_m00_couplers_BREADY;
  assign M_AXI_rready[0] = m00_couplers_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m00_couplers_to_m00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m00_couplers_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m00_couplers_to_m00_couplers_WVALID;
  assign S_AXI_arready[0] = m00_couplers_to_m00_couplers_ARREADY;
  assign S_AXI_awready[0] = m00_couplers_to_m00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m00_couplers_to_m00_couplers_BRESP;
  assign S_AXI_bvalid[0] = m00_couplers_to_m00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_m00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m00_couplers_to_m00_couplers_RRESP;
  assign S_AXI_rvalid[0] = m00_couplers_to_m00_couplers_RVALID;
  assign S_AXI_wready[0] = m00_couplers_to_m00_couplers_WREADY;
  assign m00_couplers_to_m00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_m00_couplers_ARREADY = M_AXI_arready[0];
  assign m00_couplers_to_m00_couplers_ARVALID = S_AXI_arvalid[0];
  assign m00_couplers_to_m00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_m00_couplers_AWREADY = M_AXI_awready[0];
  assign m00_couplers_to_m00_couplers_AWVALID = S_AXI_awvalid[0];
  assign m00_couplers_to_m00_couplers_BREADY = S_AXI_bready[0];
  assign m00_couplers_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign m00_couplers_to_m00_couplers_BVALID = M_AXI_bvalid[0];
  assign m00_couplers_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign m00_couplers_to_m00_couplers_RREADY = S_AXI_rready[0];
  assign m00_couplers_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign m00_couplers_to_m00_couplers_RVALID = M_AXI_rvalid[0];
  assign m00_couplers_to_m00_couplers_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_m00_couplers_WREADY = M_AXI_wready[0];
  assign m00_couplers_to_m00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m00_couplers_to_m00_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m00_couplers_imp_GJWGDZ
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [11:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [11:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [11:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [11:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]m00_couplers_to_m00_couplers_ARADDR;
  wire [1:0]m00_couplers_to_m00_couplers_ARBURST;
  wire [3:0]m00_couplers_to_m00_couplers_ARCACHE;
  wire [11:0]m00_couplers_to_m00_couplers_ARID;
  wire [7:0]m00_couplers_to_m00_couplers_ARLEN;
  wire m00_couplers_to_m00_couplers_ARLOCK;
  wire [2:0]m00_couplers_to_m00_couplers_ARPROT;
  wire m00_couplers_to_m00_couplers_ARREADY;
  wire [2:0]m00_couplers_to_m00_couplers_ARSIZE;
  wire m00_couplers_to_m00_couplers_ARVALID;
  wire [31:0]m00_couplers_to_m00_couplers_AWADDR;
  wire [1:0]m00_couplers_to_m00_couplers_AWBURST;
  wire [3:0]m00_couplers_to_m00_couplers_AWCACHE;
  wire [11:0]m00_couplers_to_m00_couplers_AWID;
  wire [7:0]m00_couplers_to_m00_couplers_AWLEN;
  wire m00_couplers_to_m00_couplers_AWLOCK;
  wire [2:0]m00_couplers_to_m00_couplers_AWPROT;
  wire m00_couplers_to_m00_couplers_AWREADY;
  wire [2:0]m00_couplers_to_m00_couplers_AWSIZE;
  wire m00_couplers_to_m00_couplers_AWVALID;
  wire [11:0]m00_couplers_to_m00_couplers_BID;
  wire m00_couplers_to_m00_couplers_BREADY;
  wire [1:0]m00_couplers_to_m00_couplers_BRESP;
  wire m00_couplers_to_m00_couplers_BVALID;
  wire [31:0]m00_couplers_to_m00_couplers_RDATA;
  wire [11:0]m00_couplers_to_m00_couplers_RID;
  wire m00_couplers_to_m00_couplers_RLAST;
  wire m00_couplers_to_m00_couplers_RREADY;
  wire [1:0]m00_couplers_to_m00_couplers_RRESP;
  wire m00_couplers_to_m00_couplers_RVALID;
  wire [31:0]m00_couplers_to_m00_couplers_WDATA;
  wire m00_couplers_to_m00_couplers_WLAST;
  wire m00_couplers_to_m00_couplers_WREADY;
  wire [3:0]m00_couplers_to_m00_couplers_WSTRB;
  wire m00_couplers_to_m00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m00_couplers_to_m00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = m00_couplers_to_m00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = m00_couplers_to_m00_couplers_ARCACHE;
  assign M_AXI_arid[11:0] = m00_couplers_to_m00_couplers_ARID;
  assign M_AXI_arlen[7:0] = m00_couplers_to_m00_couplers_ARLEN;
  assign M_AXI_arlock = m00_couplers_to_m00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = m00_couplers_to_m00_couplers_ARPROT;
  assign M_AXI_arsize[2:0] = m00_couplers_to_m00_couplers_ARSIZE;
  assign M_AXI_arvalid = m00_couplers_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m00_couplers_to_m00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = m00_couplers_to_m00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = m00_couplers_to_m00_couplers_AWCACHE;
  assign M_AXI_awid[11:0] = m00_couplers_to_m00_couplers_AWID;
  assign M_AXI_awlen[7:0] = m00_couplers_to_m00_couplers_AWLEN;
  assign M_AXI_awlock = m00_couplers_to_m00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = m00_couplers_to_m00_couplers_AWPROT;
  assign M_AXI_awsize[2:0] = m00_couplers_to_m00_couplers_AWSIZE;
  assign M_AXI_awvalid = m00_couplers_to_m00_couplers_AWVALID;
  assign M_AXI_bready = m00_couplers_to_m00_couplers_BREADY;
  assign M_AXI_rready = m00_couplers_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m00_couplers_to_m00_couplers_WDATA;
  assign M_AXI_wlast = m00_couplers_to_m00_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = m00_couplers_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid = m00_couplers_to_m00_couplers_WVALID;
  assign S_AXI_arready = m00_couplers_to_m00_couplers_ARREADY;
  assign S_AXI_awready = m00_couplers_to_m00_couplers_AWREADY;
  assign S_AXI_bid[11:0] = m00_couplers_to_m00_couplers_BID;
  assign S_AXI_bresp[1:0] = m00_couplers_to_m00_couplers_BRESP;
  assign S_AXI_bvalid = m00_couplers_to_m00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_m00_couplers_RDATA;
  assign S_AXI_rid[11:0] = m00_couplers_to_m00_couplers_RID;
  assign S_AXI_rlast = m00_couplers_to_m00_couplers_RLAST;
  assign S_AXI_rresp[1:0] = m00_couplers_to_m00_couplers_RRESP;
  assign S_AXI_rvalid = m00_couplers_to_m00_couplers_RVALID;
  assign S_AXI_wready = m00_couplers_to_m00_couplers_WREADY;
  assign m00_couplers_to_m00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_m00_couplers_ARBURST = S_AXI_arburst[1:0];
  assign m00_couplers_to_m00_couplers_ARCACHE = S_AXI_arcache[3:0];
  assign m00_couplers_to_m00_couplers_ARID = S_AXI_arid[11:0];
  assign m00_couplers_to_m00_couplers_ARLEN = S_AXI_arlen[7:0];
  assign m00_couplers_to_m00_couplers_ARLOCK = S_AXI_arlock;
  assign m00_couplers_to_m00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m00_couplers_to_m00_couplers_ARREADY = M_AXI_arready;
  assign m00_couplers_to_m00_couplers_ARSIZE = S_AXI_arsize[2:0];
  assign m00_couplers_to_m00_couplers_ARVALID = S_AXI_arvalid;
  assign m00_couplers_to_m00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_m00_couplers_AWBURST = S_AXI_awburst[1:0];
  assign m00_couplers_to_m00_couplers_AWCACHE = S_AXI_awcache[3:0];
  assign m00_couplers_to_m00_couplers_AWID = S_AXI_awid[11:0];
  assign m00_couplers_to_m00_couplers_AWLEN = S_AXI_awlen[7:0];
  assign m00_couplers_to_m00_couplers_AWLOCK = S_AXI_awlock;
  assign m00_couplers_to_m00_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m00_couplers_to_m00_couplers_AWREADY = M_AXI_awready;
  assign m00_couplers_to_m00_couplers_AWSIZE = S_AXI_awsize[2:0];
  assign m00_couplers_to_m00_couplers_AWVALID = S_AXI_awvalid;
  assign m00_couplers_to_m00_couplers_BID = M_AXI_bid[11:0];
  assign m00_couplers_to_m00_couplers_BREADY = S_AXI_bready;
  assign m00_couplers_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign m00_couplers_to_m00_couplers_BVALID = M_AXI_bvalid;
  assign m00_couplers_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign m00_couplers_to_m00_couplers_RID = M_AXI_rid[11:0];
  assign m00_couplers_to_m00_couplers_RLAST = M_AXI_rlast;
  assign m00_couplers_to_m00_couplers_RREADY = S_AXI_rready;
  assign m00_couplers_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign m00_couplers_to_m00_couplers_RVALID = M_AXI_rvalid;
  assign m00_couplers_to_m00_couplers_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_m00_couplers_WLAST = S_AXI_wlast;
  assign m00_couplers_to_m00_couplers_WREADY = M_AXI_wready;
  assign m00_couplers_to_m00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m00_couplers_to_m00_couplers_WVALID = S_AXI_wvalid;
endmodule

module m01_couplers_imp_1P8M7HC
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_m01_couplers_ARADDR;
  wire auto_pc_to_m01_couplers_ARREADY;
  wire auto_pc_to_m01_couplers_ARVALID;
  wire [31:0]auto_pc_to_m01_couplers_AWADDR;
  wire auto_pc_to_m01_couplers_AWREADY;
  wire auto_pc_to_m01_couplers_AWVALID;
  wire auto_pc_to_m01_couplers_BREADY;
  wire [1:0]auto_pc_to_m01_couplers_BRESP;
  wire auto_pc_to_m01_couplers_BVALID;
  wire [31:0]auto_pc_to_m01_couplers_RDATA;
  wire auto_pc_to_m01_couplers_RREADY;
  wire [1:0]auto_pc_to_m01_couplers_RRESP;
  wire auto_pc_to_m01_couplers_RVALID;
  wire [31:0]auto_pc_to_m01_couplers_WDATA;
  wire auto_pc_to_m01_couplers_WREADY;
  wire [3:0]auto_pc_to_m01_couplers_WSTRB;
  wire auto_pc_to_m01_couplers_WVALID;
  wire [31:0]m01_couplers_to_auto_pc_ARADDR;
  wire [1:0]m01_couplers_to_auto_pc_ARBURST;
  wire [3:0]m01_couplers_to_auto_pc_ARCACHE;
  wire [11:0]m01_couplers_to_auto_pc_ARID;
  wire [7:0]m01_couplers_to_auto_pc_ARLEN;
  wire [0:0]m01_couplers_to_auto_pc_ARLOCK;
  wire [2:0]m01_couplers_to_auto_pc_ARPROT;
  wire [3:0]m01_couplers_to_auto_pc_ARQOS;
  wire m01_couplers_to_auto_pc_ARREADY;
  wire [3:0]m01_couplers_to_auto_pc_ARREGION;
  wire [2:0]m01_couplers_to_auto_pc_ARSIZE;
  wire m01_couplers_to_auto_pc_ARVALID;
  wire [31:0]m01_couplers_to_auto_pc_AWADDR;
  wire [1:0]m01_couplers_to_auto_pc_AWBURST;
  wire [3:0]m01_couplers_to_auto_pc_AWCACHE;
  wire [11:0]m01_couplers_to_auto_pc_AWID;
  wire [7:0]m01_couplers_to_auto_pc_AWLEN;
  wire [0:0]m01_couplers_to_auto_pc_AWLOCK;
  wire [2:0]m01_couplers_to_auto_pc_AWPROT;
  wire [3:0]m01_couplers_to_auto_pc_AWQOS;
  wire m01_couplers_to_auto_pc_AWREADY;
  wire [3:0]m01_couplers_to_auto_pc_AWREGION;
  wire [2:0]m01_couplers_to_auto_pc_AWSIZE;
  wire m01_couplers_to_auto_pc_AWVALID;
  wire [11:0]m01_couplers_to_auto_pc_BID;
  wire m01_couplers_to_auto_pc_BREADY;
  wire [1:0]m01_couplers_to_auto_pc_BRESP;
  wire m01_couplers_to_auto_pc_BVALID;
  wire [31:0]m01_couplers_to_auto_pc_RDATA;
  wire [11:0]m01_couplers_to_auto_pc_RID;
  wire m01_couplers_to_auto_pc_RLAST;
  wire m01_couplers_to_auto_pc_RREADY;
  wire [1:0]m01_couplers_to_auto_pc_RRESP;
  wire m01_couplers_to_auto_pc_RVALID;
  wire [31:0]m01_couplers_to_auto_pc_WDATA;
  wire m01_couplers_to_auto_pc_WLAST;
  wire m01_couplers_to_auto_pc_WREADY;
  wire [3:0]m01_couplers_to_auto_pc_WSTRB;
  wire m01_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_m01_couplers_ARADDR;
  assign M_AXI_arvalid = auto_pc_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_m01_couplers_AWADDR;
  assign M_AXI_awvalid = auto_pc_to_m01_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_m01_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_m01_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_m01_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_m01_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m01_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = m01_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[11:0] = m01_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = m01_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = m01_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[11:0] = m01_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = m01_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = m01_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = m01_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = m01_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_m01_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_m01_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_m01_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_m01_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_m01_couplers_WREADY = M_AXI_wready;
  assign m01_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign m01_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign m01_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign m01_couplers_to_auto_pc_ARID = S_AXI_arid[11:0];
  assign m01_couplers_to_auto_pc_ARLEN = S_AXI_arlen[7:0];
  assign m01_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[0];
  assign m01_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign m01_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign m01_couplers_to_auto_pc_ARREGION = S_AXI_arregion[3:0];
  assign m01_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign m01_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign m01_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign m01_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign m01_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign m01_couplers_to_auto_pc_AWID = S_AXI_awid[11:0];
  assign m01_couplers_to_auto_pc_AWLEN = S_AXI_awlen[7:0];
  assign m01_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[0];
  assign m01_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign m01_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign m01_couplers_to_auto_pc_AWREGION = S_AXI_awregion[3:0];
  assign m01_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign m01_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign m01_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign m01_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign m01_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign m01_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign m01_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  jahwa_daq_system_auto_pc_0 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_m01_couplers_ARADDR),
        .m_axi_arready(auto_pc_to_m01_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_m01_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_m01_couplers_AWADDR),
        .m_axi_awready(auto_pc_to_m01_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_m01_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_m01_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_m01_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_m01_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_m01_couplers_RDATA),
        .m_axi_rready(auto_pc_to_m01_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_m01_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_m01_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_m01_couplers_WDATA),
        .m_axi_wready(auto_pc_to_m01_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_m01_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_m01_couplers_WVALID),
        .s_axi_araddr(m01_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(m01_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(m01_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(m01_couplers_to_auto_pc_ARID),
        .s_axi_arlen(m01_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(m01_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(m01_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(m01_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(m01_couplers_to_auto_pc_ARREADY),
        .s_axi_arregion(m01_couplers_to_auto_pc_ARREGION),
        .s_axi_arsize(m01_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(m01_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(m01_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(m01_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(m01_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(m01_couplers_to_auto_pc_AWID),
        .s_axi_awlen(m01_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(m01_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(m01_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(m01_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(m01_couplers_to_auto_pc_AWREADY),
        .s_axi_awregion(m01_couplers_to_auto_pc_AWREGION),
        .s_axi_awsize(m01_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(m01_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(m01_couplers_to_auto_pc_BID),
        .s_axi_bready(m01_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(m01_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(m01_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(m01_couplers_to_auto_pc_RDATA),
        .s_axi_rid(m01_couplers_to_auto_pc_RID),
        .s_axi_rlast(m01_couplers_to_auto_pc_RLAST),
        .s_axi_rready(m01_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(m01_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(m01_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(m01_couplers_to_auto_pc_WDATA),
        .s_axi_wlast(m01_couplers_to_auto_pc_WLAST),
        .s_axi_wready(m01_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(m01_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(m01_couplers_to_auto_pc_WVALID));
endmodule

module m01_couplers_imp_1YF6DCT
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m01_couplers_to_m01_couplers_ARADDR;
  wire [0:0]m01_couplers_to_m01_couplers_ARREADY;
  wire [0:0]m01_couplers_to_m01_couplers_ARVALID;
  wire [31:0]m01_couplers_to_m01_couplers_AWADDR;
  wire [0:0]m01_couplers_to_m01_couplers_AWREADY;
  wire [0:0]m01_couplers_to_m01_couplers_AWVALID;
  wire [0:0]m01_couplers_to_m01_couplers_BREADY;
  wire [1:0]m01_couplers_to_m01_couplers_BRESP;
  wire [0:0]m01_couplers_to_m01_couplers_BVALID;
  wire [31:0]m01_couplers_to_m01_couplers_RDATA;
  wire [0:0]m01_couplers_to_m01_couplers_RREADY;
  wire [1:0]m01_couplers_to_m01_couplers_RRESP;
  wire [0:0]m01_couplers_to_m01_couplers_RVALID;
  wire [31:0]m01_couplers_to_m01_couplers_WDATA;
  wire [0:0]m01_couplers_to_m01_couplers_WREADY;
  wire [3:0]m01_couplers_to_m01_couplers_WSTRB;
  wire [0:0]m01_couplers_to_m01_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m01_couplers_to_m01_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m01_couplers_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m01_couplers_to_m01_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m01_couplers_to_m01_couplers_AWVALID;
  assign M_AXI_bready[0] = m01_couplers_to_m01_couplers_BREADY;
  assign M_AXI_rready[0] = m01_couplers_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m01_couplers_to_m01_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m01_couplers_to_m01_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m01_couplers_to_m01_couplers_WVALID;
  assign S_AXI_arready[0] = m01_couplers_to_m01_couplers_ARREADY;
  assign S_AXI_awready[0] = m01_couplers_to_m01_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m01_couplers_to_m01_couplers_BRESP;
  assign S_AXI_bvalid[0] = m01_couplers_to_m01_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_m01_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m01_couplers_to_m01_couplers_RRESP;
  assign S_AXI_rvalid[0] = m01_couplers_to_m01_couplers_RVALID;
  assign S_AXI_wready[0] = m01_couplers_to_m01_couplers_WREADY;
  assign m01_couplers_to_m01_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m01_couplers_to_m01_couplers_ARREADY = M_AXI_arready[0];
  assign m01_couplers_to_m01_couplers_ARVALID = S_AXI_arvalid[0];
  assign m01_couplers_to_m01_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m01_couplers_to_m01_couplers_AWREADY = M_AXI_awready[0];
  assign m01_couplers_to_m01_couplers_AWVALID = S_AXI_awvalid[0];
  assign m01_couplers_to_m01_couplers_BREADY = S_AXI_bready[0];
  assign m01_couplers_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign m01_couplers_to_m01_couplers_BVALID = M_AXI_bvalid[0];
  assign m01_couplers_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign m01_couplers_to_m01_couplers_RREADY = S_AXI_rready[0];
  assign m01_couplers_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign m01_couplers_to_m01_couplers_RVALID = M_AXI_rvalid[0];
  assign m01_couplers_to_m01_couplers_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_m01_couplers_WREADY = M_AXI_wready[0];
  assign m01_couplers_to_m01_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m01_couplers_to_m01_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m02_couplers_imp_4BUKF9
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m02_couplers_to_m02_couplers_ARADDR;
  wire [0:0]m02_couplers_to_m02_couplers_ARREADY;
  wire [0:0]m02_couplers_to_m02_couplers_ARVALID;
  wire [31:0]m02_couplers_to_m02_couplers_AWADDR;
  wire [0:0]m02_couplers_to_m02_couplers_AWREADY;
  wire [0:0]m02_couplers_to_m02_couplers_AWVALID;
  wire [0:0]m02_couplers_to_m02_couplers_BREADY;
  wire [1:0]m02_couplers_to_m02_couplers_BRESP;
  wire [0:0]m02_couplers_to_m02_couplers_BVALID;
  wire [31:0]m02_couplers_to_m02_couplers_RDATA;
  wire [0:0]m02_couplers_to_m02_couplers_RREADY;
  wire [1:0]m02_couplers_to_m02_couplers_RRESP;
  wire [0:0]m02_couplers_to_m02_couplers_RVALID;
  wire [31:0]m02_couplers_to_m02_couplers_WDATA;
  wire [0:0]m02_couplers_to_m02_couplers_WREADY;
  wire [3:0]m02_couplers_to_m02_couplers_WSTRB;
  wire [0:0]m02_couplers_to_m02_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m02_couplers_to_m02_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m02_couplers_to_m02_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m02_couplers_to_m02_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m02_couplers_to_m02_couplers_AWVALID;
  assign M_AXI_bready[0] = m02_couplers_to_m02_couplers_BREADY;
  assign M_AXI_rready[0] = m02_couplers_to_m02_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m02_couplers_to_m02_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m02_couplers_to_m02_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m02_couplers_to_m02_couplers_WVALID;
  assign S_AXI_arready[0] = m02_couplers_to_m02_couplers_ARREADY;
  assign S_AXI_awready[0] = m02_couplers_to_m02_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m02_couplers_to_m02_couplers_BRESP;
  assign S_AXI_bvalid[0] = m02_couplers_to_m02_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m02_couplers_to_m02_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m02_couplers_to_m02_couplers_RRESP;
  assign S_AXI_rvalid[0] = m02_couplers_to_m02_couplers_RVALID;
  assign S_AXI_wready[0] = m02_couplers_to_m02_couplers_WREADY;
  assign m02_couplers_to_m02_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m02_couplers_to_m02_couplers_ARREADY = M_AXI_arready[0];
  assign m02_couplers_to_m02_couplers_ARVALID = S_AXI_arvalid[0];
  assign m02_couplers_to_m02_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m02_couplers_to_m02_couplers_AWREADY = M_AXI_awready[0];
  assign m02_couplers_to_m02_couplers_AWVALID = S_AXI_awvalid[0];
  assign m02_couplers_to_m02_couplers_BREADY = S_AXI_bready[0];
  assign m02_couplers_to_m02_couplers_BRESP = M_AXI_bresp[1:0];
  assign m02_couplers_to_m02_couplers_BVALID = M_AXI_bvalid[0];
  assign m02_couplers_to_m02_couplers_RDATA = M_AXI_rdata[31:0];
  assign m02_couplers_to_m02_couplers_RREADY = S_AXI_rready[0];
  assign m02_couplers_to_m02_couplers_RRESP = M_AXI_rresp[1:0];
  assign m02_couplers_to_m02_couplers_RVALID = M_AXI_rvalid[0];
  assign m02_couplers_to_m02_couplers_WDATA = S_AXI_wdata[31:0];
  assign m02_couplers_to_m02_couplers_WREADY = M_AXI_wready[0];
  assign m02_couplers_to_m02_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m02_couplers_to_m02_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m03_couplers_imp_1SIOA5U
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m03_couplers_to_m03_couplers_ARADDR;
  wire [0:0]m03_couplers_to_m03_couplers_ARREADY;
  wire [0:0]m03_couplers_to_m03_couplers_ARVALID;
  wire [31:0]m03_couplers_to_m03_couplers_AWADDR;
  wire [0:0]m03_couplers_to_m03_couplers_AWREADY;
  wire [0:0]m03_couplers_to_m03_couplers_AWVALID;
  wire [0:0]m03_couplers_to_m03_couplers_BREADY;
  wire [1:0]m03_couplers_to_m03_couplers_BRESP;
  wire [0:0]m03_couplers_to_m03_couplers_BVALID;
  wire [31:0]m03_couplers_to_m03_couplers_RDATA;
  wire [0:0]m03_couplers_to_m03_couplers_RREADY;
  wire [1:0]m03_couplers_to_m03_couplers_RRESP;
  wire [0:0]m03_couplers_to_m03_couplers_RVALID;
  wire [31:0]m03_couplers_to_m03_couplers_WDATA;
  wire [0:0]m03_couplers_to_m03_couplers_WREADY;
  wire [3:0]m03_couplers_to_m03_couplers_WSTRB;
  wire [0:0]m03_couplers_to_m03_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m03_couplers_to_m03_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m03_couplers_to_m03_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m03_couplers_to_m03_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m03_couplers_to_m03_couplers_AWVALID;
  assign M_AXI_bready[0] = m03_couplers_to_m03_couplers_BREADY;
  assign M_AXI_rready[0] = m03_couplers_to_m03_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m03_couplers_to_m03_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m03_couplers_to_m03_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m03_couplers_to_m03_couplers_WVALID;
  assign S_AXI_arready[0] = m03_couplers_to_m03_couplers_ARREADY;
  assign S_AXI_awready[0] = m03_couplers_to_m03_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m03_couplers_to_m03_couplers_BRESP;
  assign S_AXI_bvalid[0] = m03_couplers_to_m03_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m03_couplers_to_m03_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m03_couplers_to_m03_couplers_RRESP;
  assign S_AXI_rvalid[0] = m03_couplers_to_m03_couplers_RVALID;
  assign S_AXI_wready[0] = m03_couplers_to_m03_couplers_WREADY;
  assign m03_couplers_to_m03_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m03_couplers_to_m03_couplers_ARREADY = M_AXI_arready[0];
  assign m03_couplers_to_m03_couplers_ARVALID = S_AXI_arvalid[0];
  assign m03_couplers_to_m03_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m03_couplers_to_m03_couplers_AWREADY = M_AXI_awready[0];
  assign m03_couplers_to_m03_couplers_AWVALID = S_AXI_awvalid[0];
  assign m03_couplers_to_m03_couplers_BREADY = S_AXI_bready[0];
  assign m03_couplers_to_m03_couplers_BRESP = M_AXI_bresp[1:0];
  assign m03_couplers_to_m03_couplers_BVALID = M_AXI_bvalid[0];
  assign m03_couplers_to_m03_couplers_RDATA = M_AXI_rdata[31:0];
  assign m03_couplers_to_m03_couplers_RREADY = S_AXI_rready[0];
  assign m03_couplers_to_m03_couplers_RRESP = M_AXI_rresp[1:0];
  assign m03_couplers_to_m03_couplers_RVALID = M_AXI_rvalid[0];
  assign m03_couplers_to_m03_couplers_WDATA = S_AXI_wdata[31:0];
  assign m03_couplers_to_m03_couplers_WREADY = M_AXI_wready[0];
  assign m03_couplers_to_m03_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m03_couplers_to_m03_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m04_couplers_imp_DE59AS
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m04_couplers_to_m04_couplers_ARADDR;
  wire [0:0]m04_couplers_to_m04_couplers_ARREADY;
  wire [0:0]m04_couplers_to_m04_couplers_ARVALID;
  wire [31:0]m04_couplers_to_m04_couplers_AWADDR;
  wire [0:0]m04_couplers_to_m04_couplers_AWREADY;
  wire [0:0]m04_couplers_to_m04_couplers_AWVALID;
  wire [0:0]m04_couplers_to_m04_couplers_BREADY;
  wire [1:0]m04_couplers_to_m04_couplers_BRESP;
  wire [0:0]m04_couplers_to_m04_couplers_BVALID;
  wire [31:0]m04_couplers_to_m04_couplers_RDATA;
  wire [0:0]m04_couplers_to_m04_couplers_RREADY;
  wire [1:0]m04_couplers_to_m04_couplers_RRESP;
  wire [0:0]m04_couplers_to_m04_couplers_RVALID;
  wire [31:0]m04_couplers_to_m04_couplers_WDATA;
  wire [0:0]m04_couplers_to_m04_couplers_WREADY;
  wire [3:0]m04_couplers_to_m04_couplers_WSTRB;
  wire [0:0]m04_couplers_to_m04_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m04_couplers_to_m04_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m04_couplers_to_m04_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m04_couplers_to_m04_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m04_couplers_to_m04_couplers_AWVALID;
  assign M_AXI_bready[0] = m04_couplers_to_m04_couplers_BREADY;
  assign M_AXI_rready[0] = m04_couplers_to_m04_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m04_couplers_to_m04_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m04_couplers_to_m04_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m04_couplers_to_m04_couplers_WVALID;
  assign S_AXI_arready[0] = m04_couplers_to_m04_couplers_ARREADY;
  assign S_AXI_awready[0] = m04_couplers_to_m04_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m04_couplers_to_m04_couplers_BRESP;
  assign S_AXI_bvalid[0] = m04_couplers_to_m04_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m04_couplers_to_m04_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m04_couplers_to_m04_couplers_RRESP;
  assign S_AXI_rvalid[0] = m04_couplers_to_m04_couplers_RVALID;
  assign S_AXI_wready[0] = m04_couplers_to_m04_couplers_WREADY;
  assign m04_couplers_to_m04_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m04_couplers_to_m04_couplers_ARREADY = M_AXI_arready[0];
  assign m04_couplers_to_m04_couplers_ARVALID = S_AXI_arvalid[0];
  assign m04_couplers_to_m04_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m04_couplers_to_m04_couplers_AWREADY = M_AXI_awready[0];
  assign m04_couplers_to_m04_couplers_AWVALID = S_AXI_awvalid[0];
  assign m04_couplers_to_m04_couplers_BREADY = S_AXI_bready[0];
  assign m04_couplers_to_m04_couplers_BRESP = M_AXI_bresp[1:0];
  assign m04_couplers_to_m04_couplers_BVALID = M_AXI_bvalid[0];
  assign m04_couplers_to_m04_couplers_RDATA = M_AXI_rdata[31:0];
  assign m04_couplers_to_m04_couplers_RREADY = S_AXI_rready[0];
  assign m04_couplers_to_m04_couplers_RRESP = M_AXI_rresp[1:0];
  assign m04_couplers_to_m04_couplers_RVALID = M_AXI_rvalid[0];
  assign m04_couplers_to_m04_couplers_WDATA = S_AXI_wdata[31:0];
  assign m04_couplers_to_m04_couplers_WREADY = M_AXI_wready[0];
  assign m04_couplers_to_m04_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m04_couplers_to_m04_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m05_couplers_imp_1NR23SZ
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m05_couplers_to_m05_couplers_ARADDR;
  wire [0:0]m05_couplers_to_m05_couplers_ARREADY;
  wire [0:0]m05_couplers_to_m05_couplers_ARVALID;
  wire [31:0]m05_couplers_to_m05_couplers_AWADDR;
  wire [0:0]m05_couplers_to_m05_couplers_AWREADY;
  wire [0:0]m05_couplers_to_m05_couplers_AWVALID;
  wire [0:0]m05_couplers_to_m05_couplers_BREADY;
  wire [1:0]m05_couplers_to_m05_couplers_BRESP;
  wire [0:0]m05_couplers_to_m05_couplers_BVALID;
  wire [31:0]m05_couplers_to_m05_couplers_RDATA;
  wire [0:0]m05_couplers_to_m05_couplers_RREADY;
  wire [1:0]m05_couplers_to_m05_couplers_RRESP;
  wire [0:0]m05_couplers_to_m05_couplers_RVALID;
  wire [31:0]m05_couplers_to_m05_couplers_WDATA;
  wire [0:0]m05_couplers_to_m05_couplers_WREADY;
  wire [3:0]m05_couplers_to_m05_couplers_WSTRB;
  wire [0:0]m05_couplers_to_m05_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m05_couplers_to_m05_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m05_couplers_to_m05_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m05_couplers_to_m05_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m05_couplers_to_m05_couplers_AWVALID;
  assign M_AXI_bready[0] = m05_couplers_to_m05_couplers_BREADY;
  assign M_AXI_rready[0] = m05_couplers_to_m05_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m05_couplers_to_m05_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m05_couplers_to_m05_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m05_couplers_to_m05_couplers_WVALID;
  assign S_AXI_arready[0] = m05_couplers_to_m05_couplers_ARREADY;
  assign S_AXI_awready[0] = m05_couplers_to_m05_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m05_couplers_to_m05_couplers_BRESP;
  assign S_AXI_bvalid[0] = m05_couplers_to_m05_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m05_couplers_to_m05_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m05_couplers_to_m05_couplers_RRESP;
  assign S_AXI_rvalid[0] = m05_couplers_to_m05_couplers_RVALID;
  assign S_AXI_wready[0] = m05_couplers_to_m05_couplers_WREADY;
  assign m05_couplers_to_m05_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m05_couplers_to_m05_couplers_ARREADY = M_AXI_arready[0];
  assign m05_couplers_to_m05_couplers_ARVALID = S_AXI_arvalid[0];
  assign m05_couplers_to_m05_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m05_couplers_to_m05_couplers_AWREADY = M_AXI_awready[0];
  assign m05_couplers_to_m05_couplers_AWVALID = S_AXI_awvalid[0];
  assign m05_couplers_to_m05_couplers_BREADY = S_AXI_bready[0];
  assign m05_couplers_to_m05_couplers_BRESP = M_AXI_bresp[1:0];
  assign m05_couplers_to_m05_couplers_BVALID = M_AXI_bvalid[0];
  assign m05_couplers_to_m05_couplers_RDATA = M_AXI_rdata[31:0];
  assign m05_couplers_to_m05_couplers_RREADY = S_AXI_rready[0];
  assign m05_couplers_to_m05_couplers_RRESP = M_AXI_rresp[1:0];
  assign m05_couplers_to_m05_couplers_RVALID = M_AXI_rvalid[0];
  assign m05_couplers_to_m05_couplers_WDATA = S_AXI_wdata[31:0];
  assign m05_couplers_to_m05_couplers_WREADY = M_AXI_wready[0];
  assign m05_couplers_to_m05_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m05_couplers_to_m05_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m06_couplers_imp_AA5KXN
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m06_couplers_to_m06_couplers_ARADDR;
  wire [0:0]m06_couplers_to_m06_couplers_ARREADY;
  wire [0:0]m06_couplers_to_m06_couplers_ARVALID;
  wire [31:0]m06_couplers_to_m06_couplers_AWADDR;
  wire [0:0]m06_couplers_to_m06_couplers_AWREADY;
  wire [0:0]m06_couplers_to_m06_couplers_AWVALID;
  wire [0:0]m06_couplers_to_m06_couplers_BREADY;
  wire [1:0]m06_couplers_to_m06_couplers_BRESP;
  wire [0:0]m06_couplers_to_m06_couplers_BVALID;
  wire [31:0]m06_couplers_to_m06_couplers_RDATA;
  wire [0:0]m06_couplers_to_m06_couplers_RREADY;
  wire [1:0]m06_couplers_to_m06_couplers_RRESP;
  wire [0:0]m06_couplers_to_m06_couplers_RVALID;
  wire [31:0]m06_couplers_to_m06_couplers_WDATA;
  wire [0:0]m06_couplers_to_m06_couplers_WREADY;
  wire [3:0]m06_couplers_to_m06_couplers_WSTRB;
  wire [0:0]m06_couplers_to_m06_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m06_couplers_to_m06_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m06_couplers_to_m06_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m06_couplers_to_m06_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m06_couplers_to_m06_couplers_AWVALID;
  assign M_AXI_bready[0] = m06_couplers_to_m06_couplers_BREADY;
  assign M_AXI_rready[0] = m06_couplers_to_m06_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m06_couplers_to_m06_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m06_couplers_to_m06_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m06_couplers_to_m06_couplers_WVALID;
  assign S_AXI_arready[0] = m06_couplers_to_m06_couplers_ARREADY;
  assign S_AXI_awready[0] = m06_couplers_to_m06_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m06_couplers_to_m06_couplers_BRESP;
  assign S_AXI_bvalid[0] = m06_couplers_to_m06_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m06_couplers_to_m06_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m06_couplers_to_m06_couplers_RRESP;
  assign S_AXI_rvalid[0] = m06_couplers_to_m06_couplers_RVALID;
  assign S_AXI_wready[0] = m06_couplers_to_m06_couplers_WREADY;
  assign m06_couplers_to_m06_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m06_couplers_to_m06_couplers_ARREADY = M_AXI_arready[0];
  assign m06_couplers_to_m06_couplers_ARVALID = S_AXI_arvalid[0];
  assign m06_couplers_to_m06_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m06_couplers_to_m06_couplers_AWREADY = M_AXI_awready[0];
  assign m06_couplers_to_m06_couplers_AWVALID = S_AXI_awvalid[0];
  assign m06_couplers_to_m06_couplers_BREADY = S_AXI_bready[0];
  assign m06_couplers_to_m06_couplers_BRESP = M_AXI_bresp[1:0];
  assign m06_couplers_to_m06_couplers_BVALID = M_AXI_bvalid[0];
  assign m06_couplers_to_m06_couplers_RDATA = M_AXI_rdata[31:0];
  assign m06_couplers_to_m06_couplers_RREADY = S_AXI_rready[0];
  assign m06_couplers_to_m06_couplers_RRESP = M_AXI_rresp[1:0];
  assign m06_couplers_to_m06_couplers_RVALID = M_AXI_rvalid[0];
  assign m06_couplers_to_m06_couplers_WDATA = S_AXI_wdata[31:0];
  assign m06_couplers_to_m06_couplers_WREADY = M_AXI_wready[0];
  assign m06_couplers_to_m06_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m06_couplers_to_m06_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m07_couplers_imp_1HUJZQK
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m07_couplers_to_m07_couplers_ARADDR;
  wire [2:0]m07_couplers_to_m07_couplers_ARPROT;
  wire [0:0]m07_couplers_to_m07_couplers_ARREADY;
  wire [0:0]m07_couplers_to_m07_couplers_ARVALID;
  wire [31:0]m07_couplers_to_m07_couplers_AWADDR;
  wire [2:0]m07_couplers_to_m07_couplers_AWPROT;
  wire [0:0]m07_couplers_to_m07_couplers_AWREADY;
  wire [0:0]m07_couplers_to_m07_couplers_AWVALID;
  wire [0:0]m07_couplers_to_m07_couplers_BREADY;
  wire [1:0]m07_couplers_to_m07_couplers_BRESP;
  wire [0:0]m07_couplers_to_m07_couplers_BVALID;
  wire [31:0]m07_couplers_to_m07_couplers_RDATA;
  wire [0:0]m07_couplers_to_m07_couplers_RREADY;
  wire [1:0]m07_couplers_to_m07_couplers_RRESP;
  wire [0:0]m07_couplers_to_m07_couplers_RVALID;
  wire [31:0]m07_couplers_to_m07_couplers_WDATA;
  wire [0:0]m07_couplers_to_m07_couplers_WREADY;
  wire [3:0]m07_couplers_to_m07_couplers_WSTRB;
  wire [0:0]m07_couplers_to_m07_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m07_couplers_to_m07_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m07_couplers_to_m07_couplers_ARPROT;
  assign M_AXI_arvalid[0] = m07_couplers_to_m07_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m07_couplers_to_m07_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m07_couplers_to_m07_couplers_AWPROT;
  assign M_AXI_awvalid[0] = m07_couplers_to_m07_couplers_AWVALID;
  assign M_AXI_bready[0] = m07_couplers_to_m07_couplers_BREADY;
  assign M_AXI_rready[0] = m07_couplers_to_m07_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m07_couplers_to_m07_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m07_couplers_to_m07_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m07_couplers_to_m07_couplers_WVALID;
  assign S_AXI_arready[0] = m07_couplers_to_m07_couplers_ARREADY;
  assign S_AXI_awready[0] = m07_couplers_to_m07_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m07_couplers_to_m07_couplers_BRESP;
  assign S_AXI_bvalid[0] = m07_couplers_to_m07_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m07_couplers_to_m07_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m07_couplers_to_m07_couplers_RRESP;
  assign S_AXI_rvalid[0] = m07_couplers_to_m07_couplers_RVALID;
  assign S_AXI_wready[0] = m07_couplers_to_m07_couplers_WREADY;
  assign m07_couplers_to_m07_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m07_couplers_to_m07_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m07_couplers_to_m07_couplers_ARREADY = M_AXI_arready[0];
  assign m07_couplers_to_m07_couplers_ARVALID = S_AXI_arvalid[0];
  assign m07_couplers_to_m07_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m07_couplers_to_m07_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m07_couplers_to_m07_couplers_AWREADY = M_AXI_awready[0];
  assign m07_couplers_to_m07_couplers_AWVALID = S_AXI_awvalid[0];
  assign m07_couplers_to_m07_couplers_BREADY = S_AXI_bready[0];
  assign m07_couplers_to_m07_couplers_BRESP = M_AXI_bresp[1:0];
  assign m07_couplers_to_m07_couplers_BVALID = M_AXI_bvalid[0];
  assign m07_couplers_to_m07_couplers_RDATA = M_AXI_rdata[31:0];
  assign m07_couplers_to_m07_couplers_RREADY = S_AXI_rready[0];
  assign m07_couplers_to_m07_couplers_RRESP = M_AXI_rresp[1:0];
  assign m07_couplers_to_m07_couplers_RVALID = M_AXI_rvalid[0];
  assign m07_couplers_to_m07_couplers_WDATA = S_AXI_wdata[31:0];
  assign m07_couplers_to_m07_couplers_WREADY = M_AXI_wready[0];
  assign m07_couplers_to_m07_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m07_couplers_to_m07_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m08_couplers_imp_M6U6NQ
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m08_couplers_to_m08_couplers_ARADDR;
  wire [0:0]m08_couplers_to_m08_couplers_ARREADY;
  wire [0:0]m08_couplers_to_m08_couplers_ARVALID;
  wire [31:0]m08_couplers_to_m08_couplers_AWADDR;
  wire [0:0]m08_couplers_to_m08_couplers_AWREADY;
  wire [0:0]m08_couplers_to_m08_couplers_AWVALID;
  wire [0:0]m08_couplers_to_m08_couplers_BREADY;
  wire [1:0]m08_couplers_to_m08_couplers_BRESP;
  wire [0:0]m08_couplers_to_m08_couplers_BVALID;
  wire [31:0]m08_couplers_to_m08_couplers_RDATA;
  wire [0:0]m08_couplers_to_m08_couplers_RREADY;
  wire [1:0]m08_couplers_to_m08_couplers_RRESP;
  wire [0:0]m08_couplers_to_m08_couplers_RVALID;
  wire [31:0]m08_couplers_to_m08_couplers_WDATA;
  wire [0:0]m08_couplers_to_m08_couplers_WREADY;
  wire [3:0]m08_couplers_to_m08_couplers_WSTRB;
  wire [0:0]m08_couplers_to_m08_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m08_couplers_to_m08_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m08_couplers_to_m08_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m08_couplers_to_m08_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m08_couplers_to_m08_couplers_AWVALID;
  assign M_AXI_bready[0] = m08_couplers_to_m08_couplers_BREADY;
  assign M_AXI_rready[0] = m08_couplers_to_m08_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m08_couplers_to_m08_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m08_couplers_to_m08_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m08_couplers_to_m08_couplers_WVALID;
  assign S_AXI_arready[0] = m08_couplers_to_m08_couplers_ARREADY;
  assign S_AXI_awready[0] = m08_couplers_to_m08_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m08_couplers_to_m08_couplers_BRESP;
  assign S_AXI_bvalid[0] = m08_couplers_to_m08_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m08_couplers_to_m08_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m08_couplers_to_m08_couplers_RRESP;
  assign S_AXI_rvalid[0] = m08_couplers_to_m08_couplers_RVALID;
  assign S_AXI_wready[0] = m08_couplers_to_m08_couplers_WREADY;
  assign m08_couplers_to_m08_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m08_couplers_to_m08_couplers_ARREADY = M_AXI_arready[0];
  assign m08_couplers_to_m08_couplers_ARVALID = S_AXI_arvalid[0];
  assign m08_couplers_to_m08_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m08_couplers_to_m08_couplers_AWREADY = M_AXI_awready[0];
  assign m08_couplers_to_m08_couplers_AWVALID = S_AXI_awvalid[0];
  assign m08_couplers_to_m08_couplers_BREADY = S_AXI_bready[0];
  assign m08_couplers_to_m08_couplers_BRESP = M_AXI_bresp[1:0];
  assign m08_couplers_to_m08_couplers_BVALID = M_AXI_bvalid[0];
  assign m08_couplers_to_m08_couplers_RDATA = M_AXI_rdata[31:0];
  assign m08_couplers_to_m08_couplers_RREADY = S_AXI_rready[0];
  assign m08_couplers_to_m08_couplers_RRESP = M_AXI_rresp[1:0];
  assign m08_couplers_to_m08_couplers_RVALID = M_AXI_rvalid[0];
  assign m08_couplers_to_m08_couplers_WDATA = S_AXI_wdata[31:0];
  assign m08_couplers_to_m08_couplers_WREADY = M_AXI_wready[0];
  assign m08_couplers_to_m08_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m08_couplers_to_m08_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m09_couplers_imp_1AV1FVL
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m09_couplers_to_m09_couplers_ARADDR;
  wire [0:0]m09_couplers_to_m09_couplers_ARREADY;
  wire [0:0]m09_couplers_to_m09_couplers_ARVALID;
  wire [31:0]m09_couplers_to_m09_couplers_AWADDR;
  wire [0:0]m09_couplers_to_m09_couplers_AWREADY;
  wire [0:0]m09_couplers_to_m09_couplers_AWVALID;
  wire [0:0]m09_couplers_to_m09_couplers_BREADY;
  wire [1:0]m09_couplers_to_m09_couplers_BRESP;
  wire [0:0]m09_couplers_to_m09_couplers_BVALID;
  wire [31:0]m09_couplers_to_m09_couplers_RDATA;
  wire [0:0]m09_couplers_to_m09_couplers_RREADY;
  wire [1:0]m09_couplers_to_m09_couplers_RRESP;
  wire [0:0]m09_couplers_to_m09_couplers_RVALID;
  wire [31:0]m09_couplers_to_m09_couplers_WDATA;
  wire [0:0]m09_couplers_to_m09_couplers_WREADY;
  wire [3:0]m09_couplers_to_m09_couplers_WSTRB;
  wire [0:0]m09_couplers_to_m09_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m09_couplers_to_m09_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m09_couplers_to_m09_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m09_couplers_to_m09_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m09_couplers_to_m09_couplers_AWVALID;
  assign M_AXI_bready[0] = m09_couplers_to_m09_couplers_BREADY;
  assign M_AXI_rready[0] = m09_couplers_to_m09_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m09_couplers_to_m09_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m09_couplers_to_m09_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m09_couplers_to_m09_couplers_WVALID;
  assign S_AXI_arready[0] = m09_couplers_to_m09_couplers_ARREADY;
  assign S_AXI_awready[0] = m09_couplers_to_m09_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m09_couplers_to_m09_couplers_BRESP;
  assign S_AXI_bvalid[0] = m09_couplers_to_m09_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m09_couplers_to_m09_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m09_couplers_to_m09_couplers_RRESP;
  assign S_AXI_rvalid[0] = m09_couplers_to_m09_couplers_RVALID;
  assign S_AXI_wready[0] = m09_couplers_to_m09_couplers_WREADY;
  assign m09_couplers_to_m09_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m09_couplers_to_m09_couplers_ARREADY = M_AXI_arready[0];
  assign m09_couplers_to_m09_couplers_ARVALID = S_AXI_arvalid[0];
  assign m09_couplers_to_m09_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m09_couplers_to_m09_couplers_AWREADY = M_AXI_awready[0];
  assign m09_couplers_to_m09_couplers_AWVALID = S_AXI_awvalid[0];
  assign m09_couplers_to_m09_couplers_BREADY = S_AXI_bready[0];
  assign m09_couplers_to_m09_couplers_BRESP = M_AXI_bresp[1:0];
  assign m09_couplers_to_m09_couplers_BVALID = M_AXI_bvalid[0];
  assign m09_couplers_to_m09_couplers_RDATA = M_AXI_rdata[31:0];
  assign m09_couplers_to_m09_couplers_RREADY = S_AXI_rready[0];
  assign m09_couplers_to_m09_couplers_RRESP = M_AXI_rresp[1:0];
  assign m09_couplers_to_m09_couplers_RVALID = M_AXI_rvalid[0];
  assign m09_couplers_to_m09_couplers_WDATA = S_AXI_wdata[31:0];
  assign m09_couplers_to_m09_couplers_WREADY = M_AXI_wready[0];
  assign m09_couplers_to_m09_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m09_couplers_to_m09_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m10_couplers_imp_WAAQBV
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m10_couplers_to_m10_couplers_ARADDR;
  wire [0:0]m10_couplers_to_m10_couplers_ARREADY;
  wire [0:0]m10_couplers_to_m10_couplers_ARVALID;
  wire [31:0]m10_couplers_to_m10_couplers_AWADDR;
  wire [0:0]m10_couplers_to_m10_couplers_AWREADY;
  wire [0:0]m10_couplers_to_m10_couplers_AWVALID;
  wire [0:0]m10_couplers_to_m10_couplers_BREADY;
  wire [1:0]m10_couplers_to_m10_couplers_BRESP;
  wire [0:0]m10_couplers_to_m10_couplers_BVALID;
  wire [31:0]m10_couplers_to_m10_couplers_RDATA;
  wire [0:0]m10_couplers_to_m10_couplers_RREADY;
  wire [1:0]m10_couplers_to_m10_couplers_RRESP;
  wire [0:0]m10_couplers_to_m10_couplers_RVALID;
  wire [31:0]m10_couplers_to_m10_couplers_WDATA;
  wire [0:0]m10_couplers_to_m10_couplers_WREADY;
  wire [3:0]m10_couplers_to_m10_couplers_WSTRB;
  wire [0:0]m10_couplers_to_m10_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m10_couplers_to_m10_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m10_couplers_to_m10_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m10_couplers_to_m10_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m10_couplers_to_m10_couplers_AWVALID;
  assign M_AXI_bready[0] = m10_couplers_to_m10_couplers_BREADY;
  assign M_AXI_rready[0] = m10_couplers_to_m10_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m10_couplers_to_m10_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m10_couplers_to_m10_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m10_couplers_to_m10_couplers_WVALID;
  assign S_AXI_arready[0] = m10_couplers_to_m10_couplers_ARREADY;
  assign S_AXI_awready[0] = m10_couplers_to_m10_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m10_couplers_to_m10_couplers_BRESP;
  assign S_AXI_bvalid[0] = m10_couplers_to_m10_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m10_couplers_to_m10_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m10_couplers_to_m10_couplers_RRESP;
  assign S_AXI_rvalid[0] = m10_couplers_to_m10_couplers_RVALID;
  assign S_AXI_wready[0] = m10_couplers_to_m10_couplers_WREADY;
  assign m10_couplers_to_m10_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m10_couplers_to_m10_couplers_ARREADY = M_AXI_arready[0];
  assign m10_couplers_to_m10_couplers_ARVALID = S_AXI_arvalid[0];
  assign m10_couplers_to_m10_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m10_couplers_to_m10_couplers_AWREADY = M_AXI_awready[0];
  assign m10_couplers_to_m10_couplers_AWVALID = S_AXI_awvalid[0];
  assign m10_couplers_to_m10_couplers_BREADY = S_AXI_bready[0];
  assign m10_couplers_to_m10_couplers_BRESP = M_AXI_bresp[1:0];
  assign m10_couplers_to_m10_couplers_BVALID = M_AXI_bvalid[0];
  assign m10_couplers_to_m10_couplers_RDATA = M_AXI_rdata[31:0];
  assign m10_couplers_to_m10_couplers_RREADY = S_AXI_rready[0];
  assign m10_couplers_to_m10_couplers_RRESP = M_AXI_rresp[1:0];
  assign m10_couplers_to_m10_couplers_RVALID = M_AXI_rvalid[0];
  assign m10_couplers_to_m10_couplers_WDATA = S_AXI_wdata[31:0];
  assign m10_couplers_to_m10_couplers_WREADY = M_AXI_wready[0];
  assign m10_couplers_to_m10_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m10_couplers_to_m10_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m11_couplers_imp_14UWQCC
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m11_couplers_to_m11_couplers_ARADDR;
  wire [0:0]m11_couplers_to_m11_couplers_ARREADY;
  wire [0:0]m11_couplers_to_m11_couplers_ARVALID;
  wire [31:0]m11_couplers_to_m11_couplers_AWADDR;
  wire [0:0]m11_couplers_to_m11_couplers_AWREADY;
  wire [0:0]m11_couplers_to_m11_couplers_AWVALID;
  wire [0:0]m11_couplers_to_m11_couplers_BREADY;
  wire [1:0]m11_couplers_to_m11_couplers_BRESP;
  wire [0:0]m11_couplers_to_m11_couplers_BVALID;
  wire [31:0]m11_couplers_to_m11_couplers_RDATA;
  wire [0:0]m11_couplers_to_m11_couplers_RREADY;
  wire [1:0]m11_couplers_to_m11_couplers_RRESP;
  wire [0:0]m11_couplers_to_m11_couplers_RVALID;
  wire [31:0]m11_couplers_to_m11_couplers_WDATA;
  wire [0:0]m11_couplers_to_m11_couplers_WREADY;
  wire [3:0]m11_couplers_to_m11_couplers_WSTRB;
  wire [0:0]m11_couplers_to_m11_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m11_couplers_to_m11_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m11_couplers_to_m11_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m11_couplers_to_m11_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m11_couplers_to_m11_couplers_AWVALID;
  assign M_AXI_bready[0] = m11_couplers_to_m11_couplers_BREADY;
  assign M_AXI_rready[0] = m11_couplers_to_m11_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m11_couplers_to_m11_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m11_couplers_to_m11_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m11_couplers_to_m11_couplers_WVALID;
  assign S_AXI_arready[0] = m11_couplers_to_m11_couplers_ARREADY;
  assign S_AXI_awready[0] = m11_couplers_to_m11_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m11_couplers_to_m11_couplers_BRESP;
  assign S_AXI_bvalid[0] = m11_couplers_to_m11_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m11_couplers_to_m11_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m11_couplers_to_m11_couplers_RRESP;
  assign S_AXI_rvalid[0] = m11_couplers_to_m11_couplers_RVALID;
  assign S_AXI_wready[0] = m11_couplers_to_m11_couplers_WREADY;
  assign m11_couplers_to_m11_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m11_couplers_to_m11_couplers_ARREADY = M_AXI_arready[0];
  assign m11_couplers_to_m11_couplers_ARVALID = S_AXI_arvalid[0];
  assign m11_couplers_to_m11_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m11_couplers_to_m11_couplers_AWREADY = M_AXI_awready[0];
  assign m11_couplers_to_m11_couplers_AWVALID = S_AXI_awvalid[0];
  assign m11_couplers_to_m11_couplers_BREADY = S_AXI_bready[0];
  assign m11_couplers_to_m11_couplers_BRESP = M_AXI_bresp[1:0];
  assign m11_couplers_to_m11_couplers_BVALID = M_AXI_bvalid[0];
  assign m11_couplers_to_m11_couplers_RDATA = M_AXI_rdata[31:0];
  assign m11_couplers_to_m11_couplers_RREADY = S_AXI_rready[0];
  assign m11_couplers_to_m11_couplers_RRESP = M_AXI_rresp[1:0];
  assign m11_couplers_to_m11_couplers_RVALID = M_AXI_rvalid[0];
  assign m11_couplers_to_m11_couplers_WDATA = S_AXI_wdata[31:0];
  assign m11_couplers_to_m11_couplers_WREADY = M_AXI_wready[0];
  assign m11_couplers_to_m11_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m11_couplers_to_m11_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m12_couplers_imp_QXRQ90
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m12_couplers_to_m12_couplers_ARADDR;
  wire [0:0]m12_couplers_to_m12_couplers_ARREADY;
  wire [0:0]m12_couplers_to_m12_couplers_ARVALID;
  wire [31:0]m12_couplers_to_m12_couplers_AWADDR;
  wire [0:0]m12_couplers_to_m12_couplers_AWREADY;
  wire [0:0]m12_couplers_to_m12_couplers_AWVALID;
  wire [0:0]m12_couplers_to_m12_couplers_BREADY;
  wire [1:0]m12_couplers_to_m12_couplers_BRESP;
  wire [0:0]m12_couplers_to_m12_couplers_BVALID;
  wire [31:0]m12_couplers_to_m12_couplers_RDATA;
  wire [0:0]m12_couplers_to_m12_couplers_RREADY;
  wire [1:0]m12_couplers_to_m12_couplers_RRESP;
  wire [0:0]m12_couplers_to_m12_couplers_RVALID;
  wire [31:0]m12_couplers_to_m12_couplers_WDATA;
  wire [0:0]m12_couplers_to_m12_couplers_WREADY;
  wire [3:0]m12_couplers_to_m12_couplers_WSTRB;
  wire [0:0]m12_couplers_to_m12_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m12_couplers_to_m12_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m12_couplers_to_m12_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m12_couplers_to_m12_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m12_couplers_to_m12_couplers_AWVALID;
  assign M_AXI_bready[0] = m12_couplers_to_m12_couplers_BREADY;
  assign M_AXI_rready[0] = m12_couplers_to_m12_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m12_couplers_to_m12_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m12_couplers_to_m12_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m12_couplers_to_m12_couplers_WVALID;
  assign S_AXI_arready[0] = m12_couplers_to_m12_couplers_ARREADY;
  assign S_AXI_awready[0] = m12_couplers_to_m12_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m12_couplers_to_m12_couplers_BRESP;
  assign S_AXI_bvalid[0] = m12_couplers_to_m12_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m12_couplers_to_m12_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m12_couplers_to_m12_couplers_RRESP;
  assign S_AXI_rvalid[0] = m12_couplers_to_m12_couplers_RVALID;
  assign S_AXI_wready[0] = m12_couplers_to_m12_couplers_WREADY;
  assign m12_couplers_to_m12_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m12_couplers_to_m12_couplers_ARREADY = M_AXI_arready[0];
  assign m12_couplers_to_m12_couplers_ARVALID = S_AXI_arvalid[0];
  assign m12_couplers_to_m12_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m12_couplers_to_m12_couplers_AWREADY = M_AXI_awready[0];
  assign m12_couplers_to_m12_couplers_AWVALID = S_AXI_awvalid[0];
  assign m12_couplers_to_m12_couplers_BREADY = S_AXI_bready[0];
  assign m12_couplers_to_m12_couplers_BRESP = M_AXI_bresp[1:0];
  assign m12_couplers_to_m12_couplers_BVALID = M_AXI_bvalid[0];
  assign m12_couplers_to_m12_couplers_RDATA = M_AXI_rdata[31:0];
  assign m12_couplers_to_m12_couplers_RREADY = S_AXI_rready[0];
  assign m12_couplers_to_m12_couplers_RRESP = M_AXI_rresp[1:0];
  assign m12_couplers_to_m12_couplers_RVALID = M_AXI_rvalid[0];
  assign m12_couplers_to_m12_couplers_WDATA = S_AXI_wdata[31:0];
  assign m12_couplers_to_m12_couplers_WREADY = M_AXI_wready[0];
  assign m12_couplers_to_m12_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m12_couplers_to_m12_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m13_couplers_imp_116XQUR
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m13_couplers_to_m13_couplers_ARADDR;
  wire [0:0]m13_couplers_to_m13_couplers_ARREADY;
  wire [0:0]m13_couplers_to_m13_couplers_ARVALID;
  wire [31:0]m13_couplers_to_m13_couplers_AWADDR;
  wire [0:0]m13_couplers_to_m13_couplers_AWREADY;
  wire [0:0]m13_couplers_to_m13_couplers_AWVALID;
  wire [0:0]m13_couplers_to_m13_couplers_BREADY;
  wire [1:0]m13_couplers_to_m13_couplers_BRESP;
  wire [0:0]m13_couplers_to_m13_couplers_BVALID;
  wire [31:0]m13_couplers_to_m13_couplers_RDATA;
  wire [0:0]m13_couplers_to_m13_couplers_RREADY;
  wire [1:0]m13_couplers_to_m13_couplers_RRESP;
  wire [0:0]m13_couplers_to_m13_couplers_RVALID;
  wire [31:0]m13_couplers_to_m13_couplers_WDATA;
  wire [0:0]m13_couplers_to_m13_couplers_WREADY;
  wire [3:0]m13_couplers_to_m13_couplers_WSTRB;
  wire [0:0]m13_couplers_to_m13_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m13_couplers_to_m13_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m13_couplers_to_m13_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m13_couplers_to_m13_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m13_couplers_to_m13_couplers_AWVALID;
  assign M_AXI_bready[0] = m13_couplers_to_m13_couplers_BREADY;
  assign M_AXI_rready[0] = m13_couplers_to_m13_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m13_couplers_to_m13_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m13_couplers_to_m13_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m13_couplers_to_m13_couplers_WVALID;
  assign S_AXI_arready[0] = m13_couplers_to_m13_couplers_ARREADY;
  assign S_AXI_awready[0] = m13_couplers_to_m13_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m13_couplers_to_m13_couplers_BRESP;
  assign S_AXI_bvalid[0] = m13_couplers_to_m13_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m13_couplers_to_m13_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m13_couplers_to_m13_couplers_RRESP;
  assign S_AXI_rvalid[0] = m13_couplers_to_m13_couplers_RVALID;
  assign S_AXI_wready[0] = m13_couplers_to_m13_couplers_WREADY;
  assign m13_couplers_to_m13_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m13_couplers_to_m13_couplers_ARREADY = M_AXI_arready[0];
  assign m13_couplers_to_m13_couplers_ARVALID = S_AXI_arvalid[0];
  assign m13_couplers_to_m13_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m13_couplers_to_m13_couplers_AWREADY = M_AXI_awready[0];
  assign m13_couplers_to_m13_couplers_AWVALID = S_AXI_awvalid[0];
  assign m13_couplers_to_m13_couplers_BREADY = S_AXI_bready[0];
  assign m13_couplers_to_m13_couplers_BRESP = M_AXI_bresp[1:0];
  assign m13_couplers_to_m13_couplers_BVALID = M_AXI_bvalid[0];
  assign m13_couplers_to_m13_couplers_RDATA = M_AXI_rdata[31:0];
  assign m13_couplers_to_m13_couplers_RREADY = S_AXI_rready[0];
  assign m13_couplers_to_m13_couplers_RRESP = M_AXI_rresp[1:0];
  assign m13_couplers_to_m13_couplers_RVALID = M_AXI_rvalid[0];
  assign m13_couplers_to_m13_couplers_WDATA = S_AXI_wdata[31:0];
  assign m13_couplers_to_m13_couplers_WREADY = M_AXI_wready[0];
  assign m13_couplers_to_m13_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m13_couplers_to_m13_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module mb_softprocessor_0_imp_NVDXSR
   (AUX_RST_IN,
    CLK,
    M05_AXI_araddr,
    M05_AXI_arready,
    M05_AXI_arvalid,
    M05_AXI_awaddr,
    M05_AXI_awready,
    M05_AXI_awvalid,
    M05_AXI_bready,
    M05_AXI_bresp,
    M05_AXI_bvalid,
    M05_AXI_rdata,
    M05_AXI_rready,
    M05_AXI_rresp,
    M05_AXI_rvalid,
    M05_AXI_wdata,
    M05_AXI_wready,
    M05_AXI_wstrb,
    M05_AXI_wvalid,
    M06_AXI_araddr,
    M06_AXI_arready,
    M06_AXI_arvalid,
    M06_AXI_awaddr,
    M06_AXI_awready,
    M06_AXI_awvalid,
    M06_AXI_bready,
    M06_AXI_bresp,
    M06_AXI_bvalid,
    M06_AXI_rdata,
    M06_AXI_rready,
    M06_AXI_rresp,
    M06_AXI_rvalid,
    M06_AXI_wdata,
    M06_AXI_wready,
    M06_AXI_wstrb,
    M06_AXI_wvalid,
    M07_AXI_araddr,
    M07_AXI_arprot,
    M07_AXI_arready,
    M07_AXI_arvalid,
    M07_AXI_awaddr,
    M07_AXI_awprot,
    M07_AXI_awready,
    M07_AXI_awvalid,
    M07_AXI_bready,
    M07_AXI_bresp,
    M07_AXI_bvalid,
    M07_AXI_rdata,
    M07_AXI_rready,
    M07_AXI_rresp,
    M07_AXI_rvalid,
    M07_AXI_wdata,
    M07_AXI_wready,
    M07_AXI_wstrb,
    M07_AXI_wvalid,
    M08_AXI_araddr,
    M08_AXI_arready,
    M08_AXI_arvalid,
    M08_AXI_awaddr,
    M08_AXI_awready,
    M08_AXI_awvalid,
    M08_AXI_bready,
    M08_AXI_bresp,
    M08_AXI_bvalid,
    M08_AXI_rdata,
    M08_AXI_rready,
    M08_AXI_rresp,
    M08_AXI_rvalid,
    M08_AXI_wdata,
    M08_AXI_wready,
    M08_AXI_wstrb,
    M08_AXI_wvalid,
    M09_AXI_araddr,
    M09_AXI_arready,
    M09_AXI_arvalid,
    M09_AXI_awaddr,
    M09_AXI_awready,
    M09_AXI_awvalid,
    M09_AXI_bready,
    M09_AXI_bresp,
    M09_AXI_bvalid,
    M09_AXI_rdata,
    M09_AXI_rready,
    M09_AXI_rresp,
    M09_AXI_rvalid,
    M09_AXI_wdata,
    M09_AXI_wready,
    M09_AXI_wstrb,
    M09_AXI_wvalid,
    M10_AXI_araddr,
    M10_AXI_arready,
    M10_AXI_arvalid,
    M10_AXI_awaddr,
    M10_AXI_awready,
    M10_AXI_awvalid,
    M10_AXI_bready,
    M10_AXI_bresp,
    M10_AXI_bvalid,
    M10_AXI_rdata,
    M10_AXI_rready,
    M10_AXI_rresp,
    M10_AXI_rvalid,
    M10_AXI_wdata,
    M10_AXI_wready,
    M10_AXI_wstrb,
    M10_AXI_wvalid,
    M11_AXI_araddr,
    M11_AXI_arready,
    M11_AXI_arvalid,
    M11_AXI_awaddr,
    M11_AXI_awready,
    M11_AXI_awvalid,
    M11_AXI_bready,
    M11_AXI_bresp,
    M11_AXI_bvalid,
    M11_AXI_rdata,
    M11_AXI_rready,
    M11_AXI_rresp,
    M11_AXI_rvalid,
    M11_AXI_wdata,
    M11_AXI_wready,
    M11_AXI_wstrb,
    M11_AXI_wvalid,
    M12_AXI_araddr,
    M12_AXI_arready,
    M12_AXI_arvalid,
    M12_AXI_awaddr,
    M12_AXI_awready,
    M12_AXI_awvalid,
    M12_AXI_bready,
    M12_AXI_bresp,
    M12_AXI_bvalid,
    M12_AXI_rdata,
    M12_AXI_rready,
    M12_AXI_rresp,
    M12_AXI_rvalid,
    M12_AXI_wdata,
    M12_AXI_wready,
    M12_AXI_wstrb,
    M12_AXI_wvalid,
    M13_AXI_araddr,
    M13_AXI_arready,
    M13_AXI_arvalid,
    M13_AXI_awaddr,
    M13_AXI_awready,
    M13_AXI_awvalid,
    M13_AXI_bready,
    M13_AXI_bresp,
    M13_AXI_bvalid,
    M13_AXI_rdata,
    M13_AXI_rready,
    M13_AXI_rresp,
    M13_AXI_rvalid,
    M13_AXI_wdata,
    M13_AXI_wready,
    M13_AXI_wstrb,
    M13_AXI_wvalid,
    PERIPHERAL_ARESETN,
    Q,
    RESET,
    RST_DEBUG,
    S_AXI_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input AUX_RST_IN;
  input CLK;
  output [31:0]M05_AXI_araddr;
  input [0:0]M05_AXI_arready;
  output [0:0]M05_AXI_arvalid;
  output [31:0]M05_AXI_awaddr;
  input [0:0]M05_AXI_awready;
  output [0:0]M05_AXI_awvalid;
  output [0:0]M05_AXI_bready;
  input [1:0]M05_AXI_bresp;
  input [0:0]M05_AXI_bvalid;
  input [31:0]M05_AXI_rdata;
  output [0:0]M05_AXI_rready;
  input [1:0]M05_AXI_rresp;
  input [0:0]M05_AXI_rvalid;
  output [31:0]M05_AXI_wdata;
  input [0:0]M05_AXI_wready;
  output [3:0]M05_AXI_wstrb;
  output [0:0]M05_AXI_wvalid;
  output [31:0]M06_AXI_araddr;
  input [0:0]M06_AXI_arready;
  output [0:0]M06_AXI_arvalid;
  output [31:0]M06_AXI_awaddr;
  input [0:0]M06_AXI_awready;
  output [0:0]M06_AXI_awvalid;
  output [0:0]M06_AXI_bready;
  input [1:0]M06_AXI_bresp;
  input [0:0]M06_AXI_bvalid;
  input [31:0]M06_AXI_rdata;
  output [0:0]M06_AXI_rready;
  input [1:0]M06_AXI_rresp;
  input [0:0]M06_AXI_rvalid;
  output [31:0]M06_AXI_wdata;
  input [0:0]M06_AXI_wready;
  output [3:0]M06_AXI_wstrb;
  output [0:0]M06_AXI_wvalid;
  output [31:0]M07_AXI_araddr;
  output [2:0]M07_AXI_arprot;
  input [0:0]M07_AXI_arready;
  output [0:0]M07_AXI_arvalid;
  output [31:0]M07_AXI_awaddr;
  output [2:0]M07_AXI_awprot;
  input [0:0]M07_AXI_awready;
  output [0:0]M07_AXI_awvalid;
  output [0:0]M07_AXI_bready;
  input [1:0]M07_AXI_bresp;
  input [0:0]M07_AXI_bvalid;
  input [31:0]M07_AXI_rdata;
  output [0:0]M07_AXI_rready;
  input [1:0]M07_AXI_rresp;
  input [0:0]M07_AXI_rvalid;
  output [31:0]M07_AXI_wdata;
  input [0:0]M07_AXI_wready;
  output [3:0]M07_AXI_wstrb;
  output [0:0]M07_AXI_wvalid;
  output [31:0]M08_AXI_araddr;
  input [0:0]M08_AXI_arready;
  output [0:0]M08_AXI_arvalid;
  output [31:0]M08_AXI_awaddr;
  input [0:0]M08_AXI_awready;
  output [0:0]M08_AXI_awvalid;
  output [0:0]M08_AXI_bready;
  input [1:0]M08_AXI_bresp;
  input [0:0]M08_AXI_bvalid;
  input [31:0]M08_AXI_rdata;
  output [0:0]M08_AXI_rready;
  input [1:0]M08_AXI_rresp;
  input [0:0]M08_AXI_rvalid;
  output [31:0]M08_AXI_wdata;
  input [0:0]M08_AXI_wready;
  output [3:0]M08_AXI_wstrb;
  output [0:0]M08_AXI_wvalid;
  output [31:0]M09_AXI_araddr;
  input [0:0]M09_AXI_arready;
  output [0:0]M09_AXI_arvalid;
  output [31:0]M09_AXI_awaddr;
  input [0:0]M09_AXI_awready;
  output [0:0]M09_AXI_awvalid;
  output [0:0]M09_AXI_bready;
  input [1:0]M09_AXI_bresp;
  input [0:0]M09_AXI_bvalid;
  input [31:0]M09_AXI_rdata;
  output [0:0]M09_AXI_rready;
  input [1:0]M09_AXI_rresp;
  input [0:0]M09_AXI_rvalid;
  output [31:0]M09_AXI_wdata;
  input [0:0]M09_AXI_wready;
  output [3:0]M09_AXI_wstrb;
  output [0:0]M09_AXI_wvalid;
  output [31:0]M10_AXI_araddr;
  input [0:0]M10_AXI_arready;
  output [0:0]M10_AXI_arvalid;
  output [31:0]M10_AXI_awaddr;
  input [0:0]M10_AXI_awready;
  output [0:0]M10_AXI_awvalid;
  output [0:0]M10_AXI_bready;
  input [1:0]M10_AXI_bresp;
  input [0:0]M10_AXI_bvalid;
  input [31:0]M10_AXI_rdata;
  output [0:0]M10_AXI_rready;
  input [1:0]M10_AXI_rresp;
  input [0:0]M10_AXI_rvalid;
  output [31:0]M10_AXI_wdata;
  input [0:0]M10_AXI_wready;
  output [3:0]M10_AXI_wstrb;
  output [0:0]M10_AXI_wvalid;
  output [31:0]M11_AXI_araddr;
  input [0:0]M11_AXI_arready;
  output [0:0]M11_AXI_arvalid;
  output [31:0]M11_AXI_awaddr;
  input [0:0]M11_AXI_awready;
  output [0:0]M11_AXI_awvalid;
  output [0:0]M11_AXI_bready;
  input [1:0]M11_AXI_bresp;
  input [0:0]M11_AXI_bvalid;
  input [31:0]M11_AXI_rdata;
  output [0:0]M11_AXI_rready;
  input [1:0]M11_AXI_rresp;
  input [0:0]M11_AXI_rvalid;
  output [31:0]M11_AXI_wdata;
  input [0:0]M11_AXI_wready;
  output [3:0]M11_AXI_wstrb;
  output [0:0]M11_AXI_wvalid;
  output [31:0]M12_AXI_araddr;
  input [0:0]M12_AXI_arready;
  output [0:0]M12_AXI_arvalid;
  output [31:0]M12_AXI_awaddr;
  input [0:0]M12_AXI_awready;
  output [0:0]M12_AXI_awvalid;
  output [0:0]M12_AXI_bready;
  input [1:0]M12_AXI_bresp;
  input [0:0]M12_AXI_bvalid;
  input [31:0]M12_AXI_rdata;
  output [0:0]M12_AXI_rready;
  input [1:0]M12_AXI_rresp;
  input [0:0]M12_AXI_rvalid;
  output [31:0]M12_AXI_wdata;
  input [0:0]M12_AXI_wready;
  output [3:0]M12_AXI_wstrb;
  output [0:0]M12_AXI_wvalid;
  output [31:0]M13_AXI_araddr;
  input [0:0]M13_AXI_arready;
  output [0:0]M13_AXI_arvalid;
  output [31:0]M13_AXI_awaddr;
  input [0:0]M13_AXI_awready;
  output [0:0]M13_AXI_awvalid;
  output [0:0]M13_AXI_bready;
  input [1:0]M13_AXI_bresp;
  input [0:0]M13_AXI_bvalid;
  input [31:0]M13_AXI_rdata;
  output [0:0]M13_AXI_rready;
  input [1:0]M13_AXI_rresp;
  input [0:0]M13_AXI_rvalid;
  output [31:0]M13_AXI_wdata;
  input [0:0]M13_AXI_wready;
  output [3:0]M13_AXI_wstrb;
  output [0:0]M13_AXI_wvalid;
  output [0:0]PERIPHERAL_ARESETN;
  output [0:0]Q;
  input RESET;
  output RST_DEBUG;
  input S_AXI_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire aux_rst_in_1;
  wire [18:0]axi_bram_ctrl_0_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_0_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DIN;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DOUT;
  wire axi_bram_ctrl_0_BRAM_PORTA_EN;
  wire axi_bram_ctrl_0_BRAM_PORTA_RST;
  wire [3:0]axi_bram_ctrl_0_BRAM_PORTA_WE;
  wire axi_intc_0_interrupt_INTERRUPT;
  wire axi_rstn;
  wire axi_timer_0_intr;
  wire axi_timer_1_intr;
  wire axi_timer_2_intr;
  wire [31:0]conn_m05_axi_ARADDR;
  wire [0:0]conn_m05_axi_ARREADY;
  wire [0:0]conn_m05_axi_ARVALID;
  wire [31:0]conn_m05_axi_AWADDR;
  wire [0:0]conn_m05_axi_AWREADY;
  wire [0:0]conn_m05_axi_AWVALID;
  wire [0:0]conn_m05_axi_BREADY;
  wire [1:0]conn_m05_axi_BRESP;
  wire [0:0]conn_m05_axi_BVALID;
  wire [31:0]conn_m05_axi_RDATA;
  wire [0:0]conn_m05_axi_RREADY;
  wire [1:0]conn_m05_axi_RRESP;
  wire [0:0]conn_m05_axi_RVALID;
  wire [31:0]conn_m05_axi_WDATA;
  wire [0:0]conn_m05_axi_WREADY;
  wire [3:0]conn_m05_axi_WSTRB;
  wire [0:0]conn_m05_axi_WVALID;
  wire [31:0]conn_m06_axi_ARADDR;
  wire [0:0]conn_m06_axi_ARREADY;
  wire [0:0]conn_m06_axi_ARVALID;
  wire [31:0]conn_m06_axi_AWADDR;
  wire [0:0]conn_m06_axi_AWREADY;
  wire [0:0]conn_m06_axi_AWVALID;
  wire [0:0]conn_m06_axi_BREADY;
  wire [1:0]conn_m06_axi_BRESP;
  wire [0:0]conn_m06_axi_BVALID;
  wire [31:0]conn_m06_axi_RDATA;
  wire [0:0]conn_m06_axi_RREADY;
  wire [1:0]conn_m06_axi_RRESP;
  wire [0:0]conn_m06_axi_RVALID;
  wire [31:0]conn_m06_axi_WDATA;
  wire [0:0]conn_m06_axi_WREADY;
  wire [3:0]conn_m06_axi_WSTRB;
  wire [0:0]conn_m06_axi_WVALID;
  wire [31:0]conn_m07_axi_ARADDR;
  wire [2:0]conn_m07_axi_ARPROT;
  wire [0:0]conn_m07_axi_ARREADY;
  wire [0:0]conn_m07_axi_ARVALID;
  wire [31:0]conn_m07_axi_AWADDR;
  wire [2:0]conn_m07_axi_AWPROT;
  wire [0:0]conn_m07_axi_AWREADY;
  wire [0:0]conn_m07_axi_AWVALID;
  wire [0:0]conn_m07_axi_BREADY;
  wire [1:0]conn_m07_axi_BRESP;
  wire [0:0]conn_m07_axi_BVALID;
  wire [31:0]conn_m07_axi_RDATA;
  wire [0:0]conn_m07_axi_RREADY;
  wire [1:0]conn_m07_axi_RRESP;
  wire [0:0]conn_m07_axi_RVALID;
  wire [31:0]conn_m07_axi_WDATA;
  wire [0:0]conn_m07_axi_WREADY;
  wire [3:0]conn_m07_axi_WSTRB;
  wire [0:0]conn_m07_axi_WVALID;
  wire [31:0]conn_m08_axi_ARADDR;
  wire [0:0]conn_m08_axi_ARREADY;
  wire [0:0]conn_m08_axi_ARVALID;
  wire [31:0]conn_m08_axi_AWADDR;
  wire [0:0]conn_m08_axi_AWREADY;
  wire [0:0]conn_m08_axi_AWVALID;
  wire [0:0]conn_m08_axi_BREADY;
  wire [1:0]conn_m08_axi_BRESP;
  wire [0:0]conn_m08_axi_BVALID;
  wire [31:0]conn_m08_axi_RDATA;
  wire [0:0]conn_m08_axi_RREADY;
  wire [1:0]conn_m08_axi_RRESP;
  wire [0:0]conn_m08_axi_RVALID;
  wire [31:0]conn_m08_axi_WDATA;
  wire [0:0]conn_m08_axi_WREADY;
  wire [3:0]conn_m08_axi_WSTRB;
  wire [0:0]conn_m08_axi_WVALID;
  wire [31:0]conn_m09_axi_ARADDR;
  wire [0:0]conn_m09_axi_ARREADY;
  wire [0:0]conn_m09_axi_ARVALID;
  wire [31:0]conn_m09_axi_AWADDR;
  wire [0:0]conn_m09_axi_AWREADY;
  wire [0:0]conn_m09_axi_AWVALID;
  wire [0:0]conn_m09_axi_BREADY;
  wire [1:0]conn_m09_axi_BRESP;
  wire [0:0]conn_m09_axi_BVALID;
  wire [31:0]conn_m09_axi_RDATA;
  wire [0:0]conn_m09_axi_RREADY;
  wire [1:0]conn_m09_axi_RRESP;
  wire [0:0]conn_m09_axi_RVALID;
  wire [31:0]conn_m09_axi_WDATA;
  wire [0:0]conn_m09_axi_WREADY;
  wire [3:0]conn_m09_axi_WSTRB;
  wire [0:0]conn_m09_axi_WVALID;
  wire [31:0]conn_m10_axi_ARADDR;
  wire [0:0]conn_m10_axi_ARREADY;
  wire [0:0]conn_m10_axi_ARVALID;
  wire [31:0]conn_m10_axi_AWADDR;
  wire [0:0]conn_m10_axi_AWREADY;
  wire [0:0]conn_m10_axi_AWVALID;
  wire [0:0]conn_m10_axi_BREADY;
  wire [1:0]conn_m10_axi_BRESP;
  wire [0:0]conn_m10_axi_BVALID;
  wire [31:0]conn_m10_axi_RDATA;
  wire [0:0]conn_m10_axi_RREADY;
  wire [1:0]conn_m10_axi_RRESP;
  wire [0:0]conn_m10_axi_RVALID;
  wire [31:0]conn_m10_axi_WDATA;
  wire [0:0]conn_m10_axi_WREADY;
  wire [3:0]conn_m10_axi_WSTRB;
  wire [0:0]conn_m10_axi_WVALID;
  wire [31:0]conn_m11_axi_ARADDR;
  wire [0:0]conn_m11_axi_ARREADY;
  wire [0:0]conn_m11_axi_ARVALID;
  wire [31:0]conn_m11_axi_AWADDR;
  wire [0:0]conn_m11_axi_AWREADY;
  wire [0:0]conn_m11_axi_AWVALID;
  wire [0:0]conn_m11_axi_BREADY;
  wire [1:0]conn_m11_axi_BRESP;
  wire [0:0]conn_m11_axi_BVALID;
  wire [31:0]conn_m11_axi_RDATA;
  wire [0:0]conn_m11_axi_RREADY;
  wire [1:0]conn_m11_axi_RRESP;
  wire [0:0]conn_m11_axi_RVALID;
  wire [31:0]conn_m11_axi_WDATA;
  wire [0:0]conn_m11_axi_WREADY;
  wire [3:0]conn_m11_axi_WSTRB;
  wire [0:0]conn_m11_axi_WVALID;
  wire [31:0]conn_m12_axi_ARADDR;
  wire [0:0]conn_m12_axi_ARREADY;
  wire [0:0]conn_m12_axi_ARVALID;
  wire [31:0]conn_m12_axi_AWADDR;
  wire [0:0]conn_m12_axi_AWREADY;
  wire [0:0]conn_m12_axi_AWVALID;
  wire [0:0]conn_m12_axi_BREADY;
  wire [1:0]conn_m12_axi_BRESP;
  wire [0:0]conn_m12_axi_BVALID;
  wire [31:0]conn_m12_axi_RDATA;
  wire [0:0]conn_m12_axi_RREADY;
  wire [1:0]conn_m12_axi_RRESP;
  wire [0:0]conn_m12_axi_RVALID;
  wire [31:0]conn_m12_axi_WDATA;
  wire [0:0]conn_m12_axi_WREADY;
  wire [3:0]conn_m12_axi_WSTRB;
  wire [0:0]conn_m12_axi_WVALID;
  wire [31:0]conn_m13_axi_ARADDR;
  wire [0:0]conn_m13_axi_ARREADY;
  wire [0:0]conn_m13_axi_ARVALID;
  wire [31:0]conn_m13_axi_AWADDR;
  wire [0:0]conn_m13_axi_AWREADY;
  wire [0:0]conn_m13_axi_AWVALID;
  wire [0:0]conn_m13_axi_BREADY;
  wire [1:0]conn_m13_axi_BRESP;
  wire [0:0]conn_m13_axi_BVALID;
  wire [31:0]conn_m13_axi_RDATA;
  wire [0:0]conn_m13_axi_RREADY;
  wire [1:0]conn_m13_axi_RRESP;
  wire [0:0]conn_m13_axi_RVALID;
  wire [31:0]conn_m13_axi_WDATA;
  wire [0:0]conn_m13_axi_WREADY;
  wire [3:0]conn_m13_axi_WSTRB;
  wire [0:0]conn_m13_axi_WVALID;
  wire [0:0]dff_en_reset_vector_0_en;
  wire [0:0]dff_en_reset_vector_0_q;
  wire [31:0]mb_M_AXI_DP_ARADDR;
  wire [2:0]mb_M_AXI_DP_ARPROT;
  wire mb_M_AXI_DP_ARREADY;
  wire mb_M_AXI_DP_ARVALID;
  wire [31:0]mb_M_AXI_DP_AWADDR;
  wire [2:0]mb_M_AXI_DP_AWPROT;
  wire mb_M_AXI_DP_AWREADY;
  wire mb_M_AXI_DP_AWVALID;
  wire mb_M_AXI_DP_BREADY;
  wire [1:0]mb_M_AXI_DP_BRESP;
  wire mb_M_AXI_DP_BVALID;
  wire [31:0]mb_M_AXI_DP_RDATA;
  wire mb_M_AXI_DP_RREADY;
  wire [1:0]mb_M_AXI_DP_RRESP;
  wire mb_M_AXI_DP_RVALID;
  wire [31:0]mb_M_AXI_DP_WDATA;
  wire mb_M_AXI_DP_WREADY;
  wire [3:0]mb_M_AXI_DP_WSTRB;
  wire mb_M_AXI_DP_WVALID;
  wire [31:0]mb_axi_interconnect_0_M00_AXI_ARADDR;
  wire mb_axi_interconnect_0_M00_AXI_ARREADY;
  wire [0:0]mb_axi_interconnect_0_M00_AXI_ARVALID;
  wire [31:0]mb_axi_interconnect_0_M00_AXI_AWADDR;
  wire mb_axi_interconnect_0_M00_AXI_AWREADY;
  wire [0:0]mb_axi_interconnect_0_M00_AXI_AWVALID;
  wire [0:0]mb_axi_interconnect_0_M00_AXI_BREADY;
  wire [1:0]mb_axi_interconnect_0_M00_AXI_BRESP;
  wire mb_axi_interconnect_0_M00_AXI_BVALID;
  wire [31:0]mb_axi_interconnect_0_M00_AXI_RDATA;
  wire [0:0]mb_axi_interconnect_0_M00_AXI_RREADY;
  wire [1:0]mb_axi_interconnect_0_M00_AXI_RRESP;
  wire mb_axi_interconnect_0_M00_AXI_RVALID;
  wire [31:0]mb_axi_interconnect_0_M00_AXI_WDATA;
  wire mb_axi_interconnect_0_M00_AXI_WREADY;
  wire [3:0]mb_axi_interconnect_0_M00_AXI_WSTRB;
  wire [0:0]mb_axi_interconnect_0_M00_AXI_WVALID;
  wire [31:0]mb_axi_interconnect_0_M01_AXI_ARADDR;
  wire mb_axi_interconnect_0_M01_AXI_ARREADY;
  wire [0:0]mb_axi_interconnect_0_M01_AXI_ARVALID;
  wire [31:0]mb_axi_interconnect_0_M01_AXI_AWADDR;
  wire mb_axi_interconnect_0_M01_AXI_AWREADY;
  wire [0:0]mb_axi_interconnect_0_M01_AXI_AWVALID;
  wire [0:0]mb_axi_interconnect_0_M01_AXI_BREADY;
  wire [1:0]mb_axi_interconnect_0_M01_AXI_BRESP;
  wire mb_axi_interconnect_0_M01_AXI_BVALID;
  wire [31:0]mb_axi_interconnect_0_M01_AXI_RDATA;
  wire [0:0]mb_axi_interconnect_0_M01_AXI_RREADY;
  wire [1:0]mb_axi_interconnect_0_M01_AXI_RRESP;
  wire mb_axi_interconnect_0_M01_AXI_RVALID;
  wire [31:0]mb_axi_interconnect_0_M01_AXI_WDATA;
  wire mb_axi_interconnect_0_M01_AXI_WREADY;
  wire [3:0]mb_axi_interconnect_0_M01_AXI_WSTRB;
  wire [0:0]mb_axi_interconnect_0_M01_AXI_WVALID;
  wire [31:0]mb_axi_interconnect_0_M02_AXI_ARADDR;
  wire mb_axi_interconnect_0_M02_AXI_ARREADY;
  wire [0:0]mb_axi_interconnect_0_M02_AXI_ARVALID;
  wire [31:0]mb_axi_interconnect_0_M02_AXI_AWADDR;
  wire mb_axi_interconnect_0_M02_AXI_AWREADY;
  wire [0:0]mb_axi_interconnect_0_M02_AXI_AWVALID;
  wire [0:0]mb_axi_interconnect_0_M02_AXI_BREADY;
  wire [1:0]mb_axi_interconnect_0_M02_AXI_BRESP;
  wire mb_axi_interconnect_0_M02_AXI_BVALID;
  wire [31:0]mb_axi_interconnect_0_M02_AXI_RDATA;
  wire [0:0]mb_axi_interconnect_0_M02_AXI_RREADY;
  wire [1:0]mb_axi_interconnect_0_M02_AXI_RRESP;
  wire mb_axi_interconnect_0_M02_AXI_RVALID;
  wire [31:0]mb_axi_interconnect_0_M02_AXI_WDATA;
  wire mb_axi_interconnect_0_M02_AXI_WREADY;
  wire [3:0]mb_axi_interconnect_0_M02_AXI_WSTRB;
  wire [0:0]mb_axi_interconnect_0_M02_AXI_WVALID;
  wire [31:0]mb_axi_interconnect_0_M03_AXI_ARADDR;
  wire mb_axi_interconnect_0_M03_AXI_ARREADY;
  wire [0:0]mb_axi_interconnect_0_M03_AXI_ARVALID;
  wire [31:0]mb_axi_interconnect_0_M03_AXI_AWADDR;
  wire mb_axi_interconnect_0_M03_AXI_AWREADY;
  wire [0:0]mb_axi_interconnect_0_M03_AXI_AWVALID;
  wire [0:0]mb_axi_interconnect_0_M03_AXI_BREADY;
  wire [1:0]mb_axi_interconnect_0_M03_AXI_BRESP;
  wire mb_axi_interconnect_0_M03_AXI_BVALID;
  wire [31:0]mb_axi_interconnect_0_M03_AXI_RDATA;
  wire [0:0]mb_axi_interconnect_0_M03_AXI_RREADY;
  wire [1:0]mb_axi_interconnect_0_M03_AXI_RRESP;
  wire mb_axi_interconnect_0_M03_AXI_RVALID;
  wire [31:0]mb_axi_interconnect_0_M03_AXI_WDATA;
  wire mb_axi_interconnect_0_M03_AXI_WREADY;
  wire [3:0]mb_axi_interconnect_0_M03_AXI_WSTRB;
  wire [0:0]mb_axi_interconnect_0_M03_AXI_WVALID;
  wire [31:0]mb_axi_interconnect_0_M04_AXI_ARADDR;
  wire mb_axi_interconnect_0_M04_AXI_ARREADY;
  wire [0:0]mb_axi_interconnect_0_M04_AXI_ARVALID;
  wire [31:0]mb_axi_interconnect_0_M04_AXI_AWADDR;
  wire mb_axi_interconnect_0_M04_AXI_AWREADY;
  wire [0:0]mb_axi_interconnect_0_M04_AXI_AWVALID;
  wire [0:0]mb_axi_interconnect_0_M04_AXI_BREADY;
  wire [1:0]mb_axi_interconnect_0_M04_AXI_BRESP;
  wire mb_axi_interconnect_0_M04_AXI_BVALID;
  wire [31:0]mb_axi_interconnect_0_M04_AXI_RDATA;
  wire [0:0]mb_axi_interconnect_0_M04_AXI_RREADY;
  wire [1:0]mb_axi_interconnect_0_M04_AXI_RRESP;
  wire mb_axi_interconnect_0_M04_AXI_RVALID;
  wire [31:0]mb_axi_interconnect_0_M04_AXI_WDATA;
  wire mb_axi_interconnect_0_M04_AXI_WREADY;
  wire [3:0]mb_axi_interconnect_0_M04_AXI_WSTRB;
  wire [0:0]mb_axi_interconnect_0_M04_AXI_WVALID;
  wire mdm_debug_sys_rst_1;
  wire microblaze_0_debug_CAPTURE;
  wire microblaze_0_debug_CLK;
  wire microblaze_0_debug_DISABLE;
  wire [0:7]microblaze_0_debug_REG_EN;
  wire microblaze_0_debug_RST;
  wire microblaze_0_debug_SHIFT;
  wire microblaze_0_debug_TDI;
  wire microblaze_0_debug_TDO;
  wire microblaze_0_debug_UPDATE;
  wire [0:31]microblaze_0_dlmb_1_ABUS;
  wire microblaze_0_dlmb_1_ADDRSTROBE;
  wire [0:3]microblaze_0_dlmb_1_BE;
  wire microblaze_0_dlmb_1_CE;
  wire [0:31]microblaze_0_dlmb_1_READDBUS;
  wire microblaze_0_dlmb_1_READSTROBE;
  wire microblaze_0_dlmb_1_READY;
  wire microblaze_0_dlmb_1_UE;
  wire microblaze_0_dlmb_1_WAIT;
  wire [0:31]microblaze_0_dlmb_1_WRITEDBUS;
  wire microblaze_0_dlmb_1_WRITESTROBE;
  wire [0:31]microblaze_0_ilmb_1_ABUS;
  wire microblaze_0_ilmb_1_ADDRSTROBE;
  wire microblaze_0_ilmb_1_CE;
  wire [0:31]microblaze_0_ilmb_1_READDBUS;
  wire microblaze_0_ilmb_1_READSTROBE;
  wire microblaze_0_ilmb_1_READY;
  wire microblaze_0_ilmb_1_UE;
  wire microblaze_0_ilmb_1_WAIT;
  wire reset_1;
  wire [0:0]rst_ps7_0_100M_interconnect_aresetn;
  wire rst_ps7_0_100M_mb_reset;
  wire [0:0]rst_ps7_0_100M_peripheral_aresetn;
  wire softprocessor_clk;
  wire [0:0]sys_rst_1;
  wire [2:0]xlconcat_0_dout;
  wire [0:0]xlconstant_0_dout;
  wire [31:0]zynq_axi_interconnect_0_M00_AXI_ARADDR;
  wire [1:0]zynq_axi_interconnect_0_M00_AXI_ARBURST;
  wire [3:0]zynq_axi_interconnect_0_M00_AXI_ARCACHE;
  wire [11:0]zynq_axi_interconnect_0_M00_AXI_ARID;
  wire [7:0]zynq_axi_interconnect_0_M00_AXI_ARLEN;
  wire zynq_axi_interconnect_0_M00_AXI_ARLOCK;
  wire [2:0]zynq_axi_interconnect_0_M00_AXI_ARPROT;
  wire zynq_axi_interconnect_0_M00_AXI_ARREADY;
  wire [2:0]zynq_axi_interconnect_0_M00_AXI_ARSIZE;
  wire zynq_axi_interconnect_0_M00_AXI_ARVALID;
  wire [31:0]zynq_axi_interconnect_0_M00_AXI_AWADDR;
  wire [1:0]zynq_axi_interconnect_0_M00_AXI_AWBURST;
  wire [3:0]zynq_axi_interconnect_0_M00_AXI_AWCACHE;
  wire [11:0]zynq_axi_interconnect_0_M00_AXI_AWID;
  wire [7:0]zynq_axi_interconnect_0_M00_AXI_AWLEN;
  wire zynq_axi_interconnect_0_M00_AXI_AWLOCK;
  wire [2:0]zynq_axi_interconnect_0_M00_AXI_AWPROT;
  wire zynq_axi_interconnect_0_M00_AXI_AWREADY;
  wire [2:0]zynq_axi_interconnect_0_M00_AXI_AWSIZE;
  wire zynq_axi_interconnect_0_M00_AXI_AWVALID;
  wire [11:0]zynq_axi_interconnect_0_M00_AXI_BID;
  wire zynq_axi_interconnect_0_M00_AXI_BREADY;
  wire [1:0]zynq_axi_interconnect_0_M00_AXI_BRESP;
  wire zynq_axi_interconnect_0_M00_AXI_BVALID;
  wire [31:0]zynq_axi_interconnect_0_M00_AXI_RDATA;
  wire [11:0]zynq_axi_interconnect_0_M00_AXI_RID;
  wire zynq_axi_interconnect_0_M00_AXI_RLAST;
  wire zynq_axi_interconnect_0_M00_AXI_RREADY;
  wire [1:0]zynq_axi_interconnect_0_M00_AXI_RRESP;
  wire zynq_axi_interconnect_0_M00_AXI_RVALID;
  wire [31:0]zynq_axi_interconnect_0_M00_AXI_WDATA;
  wire zynq_axi_interconnect_0_M00_AXI_WLAST;
  wire zynq_axi_interconnect_0_M00_AXI_WREADY;
  wire [3:0]zynq_axi_interconnect_0_M00_AXI_WSTRB;
  wire zynq_axi_interconnect_0_M00_AXI_WVALID;

  assign M05_AXI_araddr[31:0] = conn_m05_axi_ARADDR;
  assign M05_AXI_arvalid[0] = conn_m05_axi_ARVALID;
  assign M05_AXI_awaddr[31:0] = conn_m05_axi_AWADDR;
  assign M05_AXI_awvalid[0] = conn_m05_axi_AWVALID;
  assign M05_AXI_bready[0] = conn_m05_axi_BREADY;
  assign M05_AXI_rready[0] = conn_m05_axi_RREADY;
  assign M05_AXI_wdata[31:0] = conn_m05_axi_WDATA;
  assign M05_AXI_wstrb[3:0] = conn_m05_axi_WSTRB;
  assign M05_AXI_wvalid[0] = conn_m05_axi_WVALID;
  assign M06_AXI_araddr[31:0] = conn_m06_axi_ARADDR;
  assign M06_AXI_arvalid[0] = conn_m06_axi_ARVALID;
  assign M06_AXI_awaddr[31:0] = conn_m06_axi_AWADDR;
  assign M06_AXI_awvalid[0] = conn_m06_axi_AWVALID;
  assign M06_AXI_bready[0] = conn_m06_axi_BREADY;
  assign M06_AXI_rready[0] = conn_m06_axi_RREADY;
  assign M06_AXI_wdata[31:0] = conn_m06_axi_WDATA;
  assign M06_AXI_wstrb[3:0] = conn_m06_axi_WSTRB;
  assign M06_AXI_wvalid[0] = conn_m06_axi_WVALID;
  assign M07_AXI_araddr[31:0] = conn_m07_axi_ARADDR;
  assign M07_AXI_arprot[2:0] = conn_m07_axi_ARPROT;
  assign M07_AXI_arvalid[0] = conn_m07_axi_ARVALID;
  assign M07_AXI_awaddr[31:0] = conn_m07_axi_AWADDR;
  assign M07_AXI_awprot[2:0] = conn_m07_axi_AWPROT;
  assign M07_AXI_awvalid[0] = conn_m07_axi_AWVALID;
  assign M07_AXI_bready[0] = conn_m07_axi_BREADY;
  assign M07_AXI_rready[0] = conn_m07_axi_RREADY;
  assign M07_AXI_wdata[31:0] = conn_m07_axi_WDATA;
  assign M07_AXI_wstrb[3:0] = conn_m07_axi_WSTRB;
  assign M07_AXI_wvalid[0] = conn_m07_axi_WVALID;
  assign M08_AXI_araddr[31:0] = conn_m08_axi_ARADDR;
  assign M08_AXI_arvalid[0] = conn_m08_axi_ARVALID;
  assign M08_AXI_awaddr[31:0] = conn_m08_axi_AWADDR;
  assign M08_AXI_awvalid[0] = conn_m08_axi_AWVALID;
  assign M08_AXI_bready[0] = conn_m08_axi_BREADY;
  assign M08_AXI_rready[0] = conn_m08_axi_RREADY;
  assign M08_AXI_wdata[31:0] = conn_m08_axi_WDATA;
  assign M08_AXI_wstrb[3:0] = conn_m08_axi_WSTRB;
  assign M08_AXI_wvalid[0] = conn_m08_axi_WVALID;
  assign M09_AXI_araddr[31:0] = conn_m09_axi_ARADDR;
  assign M09_AXI_arvalid[0] = conn_m09_axi_ARVALID;
  assign M09_AXI_awaddr[31:0] = conn_m09_axi_AWADDR;
  assign M09_AXI_awvalid[0] = conn_m09_axi_AWVALID;
  assign M09_AXI_bready[0] = conn_m09_axi_BREADY;
  assign M09_AXI_rready[0] = conn_m09_axi_RREADY;
  assign M09_AXI_wdata[31:0] = conn_m09_axi_WDATA;
  assign M09_AXI_wstrb[3:0] = conn_m09_axi_WSTRB;
  assign M09_AXI_wvalid[0] = conn_m09_axi_WVALID;
  assign M10_AXI_araddr[31:0] = conn_m10_axi_ARADDR;
  assign M10_AXI_arvalid[0] = conn_m10_axi_ARVALID;
  assign M10_AXI_awaddr[31:0] = conn_m10_axi_AWADDR;
  assign M10_AXI_awvalid[0] = conn_m10_axi_AWVALID;
  assign M10_AXI_bready[0] = conn_m10_axi_BREADY;
  assign M10_AXI_rready[0] = conn_m10_axi_RREADY;
  assign M10_AXI_wdata[31:0] = conn_m10_axi_WDATA;
  assign M10_AXI_wstrb[3:0] = conn_m10_axi_WSTRB;
  assign M10_AXI_wvalid[0] = conn_m10_axi_WVALID;
  assign M11_AXI_araddr[31:0] = conn_m11_axi_ARADDR;
  assign M11_AXI_arvalid[0] = conn_m11_axi_ARVALID;
  assign M11_AXI_awaddr[31:0] = conn_m11_axi_AWADDR;
  assign M11_AXI_awvalid[0] = conn_m11_axi_AWVALID;
  assign M11_AXI_bready[0] = conn_m11_axi_BREADY;
  assign M11_AXI_rready[0] = conn_m11_axi_RREADY;
  assign M11_AXI_wdata[31:0] = conn_m11_axi_WDATA;
  assign M11_AXI_wstrb[3:0] = conn_m11_axi_WSTRB;
  assign M11_AXI_wvalid[0] = conn_m11_axi_WVALID;
  assign M12_AXI_araddr[31:0] = conn_m12_axi_ARADDR;
  assign M12_AXI_arvalid[0] = conn_m12_axi_ARVALID;
  assign M12_AXI_awaddr[31:0] = conn_m12_axi_AWADDR;
  assign M12_AXI_awvalid[0] = conn_m12_axi_AWVALID;
  assign M12_AXI_bready[0] = conn_m12_axi_BREADY;
  assign M12_AXI_rready[0] = conn_m12_axi_RREADY;
  assign M12_AXI_wdata[31:0] = conn_m12_axi_WDATA;
  assign M12_AXI_wstrb[3:0] = conn_m12_axi_WSTRB;
  assign M12_AXI_wvalid[0] = conn_m12_axi_WVALID;
  assign M13_AXI_araddr[31:0] = conn_m13_axi_ARADDR;
  assign M13_AXI_arvalid[0] = conn_m13_axi_ARVALID;
  assign M13_AXI_awaddr[31:0] = conn_m13_axi_AWADDR;
  assign M13_AXI_awvalid[0] = conn_m13_axi_AWVALID;
  assign M13_AXI_bready[0] = conn_m13_axi_BREADY;
  assign M13_AXI_rready[0] = conn_m13_axi_RREADY;
  assign M13_AXI_wdata[31:0] = conn_m13_axi_WDATA;
  assign M13_AXI_wstrb[3:0] = conn_m13_axi_WSTRB;
  assign M13_AXI_wvalid[0] = conn_m13_axi_WVALID;
  assign PERIPHERAL_ARESETN[0] = rst_ps7_0_100M_peripheral_aresetn;
  assign Q[0] = dff_en_reset_vector_0_q;
  assign RST_DEBUG = rst_ps7_0_100M_mb_reset;
  assign S_AXI_arready = zynq_axi_interconnect_0_M00_AXI_ARREADY;
  assign S_AXI_awready = zynq_axi_interconnect_0_M00_AXI_AWREADY;
  assign S_AXI_bid[11:0] = zynq_axi_interconnect_0_M00_AXI_BID;
  assign S_AXI_bresp[1:0] = zynq_axi_interconnect_0_M00_AXI_BRESP;
  assign S_AXI_bvalid = zynq_axi_interconnect_0_M00_AXI_BVALID;
  assign S_AXI_rdata[31:0] = zynq_axi_interconnect_0_M00_AXI_RDATA;
  assign S_AXI_rid[11:0] = zynq_axi_interconnect_0_M00_AXI_RID;
  assign S_AXI_rlast = zynq_axi_interconnect_0_M00_AXI_RLAST;
  assign S_AXI_rresp[1:0] = zynq_axi_interconnect_0_M00_AXI_RRESP;
  assign S_AXI_rvalid = zynq_axi_interconnect_0_M00_AXI_RVALID;
  assign S_AXI_wready = zynq_axi_interconnect_0_M00_AXI_WREADY;
  assign aux_rst_in_1 = AUX_RST_IN;
  assign axi_rstn = S_AXI_ARESETN;
  assign conn_m05_axi_ARREADY = M05_AXI_arready[0];
  assign conn_m05_axi_AWREADY = M05_AXI_awready[0];
  assign conn_m05_axi_BRESP = M05_AXI_bresp[1:0];
  assign conn_m05_axi_BVALID = M05_AXI_bvalid[0];
  assign conn_m05_axi_RDATA = M05_AXI_rdata[31:0];
  assign conn_m05_axi_RRESP = M05_AXI_rresp[1:0];
  assign conn_m05_axi_RVALID = M05_AXI_rvalid[0];
  assign conn_m05_axi_WREADY = M05_AXI_wready[0];
  assign conn_m06_axi_ARREADY = M06_AXI_arready[0];
  assign conn_m06_axi_AWREADY = M06_AXI_awready[0];
  assign conn_m06_axi_BRESP = M06_AXI_bresp[1:0];
  assign conn_m06_axi_BVALID = M06_AXI_bvalid[0];
  assign conn_m06_axi_RDATA = M06_AXI_rdata[31:0];
  assign conn_m06_axi_RRESP = M06_AXI_rresp[1:0];
  assign conn_m06_axi_RVALID = M06_AXI_rvalid[0];
  assign conn_m06_axi_WREADY = M06_AXI_wready[0];
  assign conn_m07_axi_ARREADY = M07_AXI_arready[0];
  assign conn_m07_axi_AWREADY = M07_AXI_awready[0];
  assign conn_m07_axi_BRESP = M07_AXI_bresp[1:0];
  assign conn_m07_axi_BVALID = M07_AXI_bvalid[0];
  assign conn_m07_axi_RDATA = M07_AXI_rdata[31:0];
  assign conn_m07_axi_RRESP = M07_AXI_rresp[1:0];
  assign conn_m07_axi_RVALID = M07_AXI_rvalid[0];
  assign conn_m07_axi_WREADY = M07_AXI_wready[0];
  assign conn_m08_axi_ARREADY = M08_AXI_arready[0];
  assign conn_m08_axi_AWREADY = M08_AXI_awready[0];
  assign conn_m08_axi_BRESP = M08_AXI_bresp[1:0];
  assign conn_m08_axi_BVALID = M08_AXI_bvalid[0];
  assign conn_m08_axi_RDATA = M08_AXI_rdata[31:0];
  assign conn_m08_axi_RRESP = M08_AXI_rresp[1:0];
  assign conn_m08_axi_RVALID = M08_AXI_rvalid[0];
  assign conn_m08_axi_WREADY = M08_AXI_wready[0];
  assign conn_m09_axi_ARREADY = M09_AXI_arready[0];
  assign conn_m09_axi_AWREADY = M09_AXI_awready[0];
  assign conn_m09_axi_BRESP = M09_AXI_bresp[1:0];
  assign conn_m09_axi_BVALID = M09_AXI_bvalid[0];
  assign conn_m09_axi_RDATA = M09_AXI_rdata[31:0];
  assign conn_m09_axi_RRESP = M09_AXI_rresp[1:0];
  assign conn_m09_axi_RVALID = M09_AXI_rvalid[0];
  assign conn_m09_axi_WREADY = M09_AXI_wready[0];
  assign conn_m10_axi_ARREADY = M10_AXI_arready[0];
  assign conn_m10_axi_AWREADY = M10_AXI_awready[0];
  assign conn_m10_axi_BRESP = M10_AXI_bresp[1:0];
  assign conn_m10_axi_BVALID = M10_AXI_bvalid[0];
  assign conn_m10_axi_RDATA = M10_AXI_rdata[31:0];
  assign conn_m10_axi_RRESP = M10_AXI_rresp[1:0];
  assign conn_m10_axi_RVALID = M10_AXI_rvalid[0];
  assign conn_m10_axi_WREADY = M10_AXI_wready[0];
  assign conn_m11_axi_ARREADY = M11_AXI_arready[0];
  assign conn_m11_axi_AWREADY = M11_AXI_awready[0];
  assign conn_m11_axi_BRESP = M11_AXI_bresp[1:0];
  assign conn_m11_axi_BVALID = M11_AXI_bvalid[0];
  assign conn_m11_axi_RDATA = M11_AXI_rdata[31:0];
  assign conn_m11_axi_RRESP = M11_AXI_rresp[1:0];
  assign conn_m11_axi_RVALID = M11_AXI_rvalid[0];
  assign conn_m11_axi_WREADY = M11_AXI_wready[0];
  assign conn_m12_axi_ARREADY = M12_AXI_arready[0];
  assign conn_m12_axi_AWREADY = M12_AXI_awready[0];
  assign conn_m12_axi_BRESP = M12_AXI_bresp[1:0];
  assign conn_m12_axi_BVALID = M12_AXI_bvalid[0];
  assign conn_m12_axi_RDATA = M12_AXI_rdata[31:0];
  assign conn_m12_axi_RRESP = M12_AXI_rresp[1:0];
  assign conn_m12_axi_RVALID = M12_AXI_rvalid[0];
  assign conn_m12_axi_WREADY = M12_AXI_wready[0];
  assign conn_m13_axi_ARREADY = M13_AXI_arready[0];
  assign conn_m13_axi_AWREADY = M13_AXI_awready[0];
  assign conn_m13_axi_BRESP = M13_AXI_bresp[1:0];
  assign conn_m13_axi_BVALID = M13_AXI_bvalid[0];
  assign conn_m13_axi_RDATA = M13_AXI_rdata[31:0];
  assign conn_m13_axi_RRESP = M13_AXI_rresp[1:0];
  assign conn_m13_axi_RVALID = M13_AXI_rvalid[0];
  assign conn_m13_axi_WREADY = M13_AXI_wready[0];
  assign reset_1 = RESET;
  assign softprocessor_clk = CLK;
  assign zynq_axi_interconnect_0_M00_AXI_ARADDR = S_AXI_araddr[31:0];
  assign zynq_axi_interconnect_0_M00_AXI_ARBURST = S_AXI_arburst[1:0];
  assign zynq_axi_interconnect_0_M00_AXI_ARCACHE = S_AXI_arcache[3:0];
  assign zynq_axi_interconnect_0_M00_AXI_ARID = S_AXI_arid[11:0];
  assign zynq_axi_interconnect_0_M00_AXI_ARLEN = S_AXI_arlen[7:0];
  assign zynq_axi_interconnect_0_M00_AXI_ARLOCK = S_AXI_arlock;
  assign zynq_axi_interconnect_0_M00_AXI_ARPROT = S_AXI_arprot[2:0];
  assign zynq_axi_interconnect_0_M00_AXI_ARSIZE = S_AXI_arsize[2:0];
  assign zynq_axi_interconnect_0_M00_AXI_ARVALID = S_AXI_arvalid;
  assign zynq_axi_interconnect_0_M00_AXI_AWADDR = S_AXI_awaddr[31:0];
  assign zynq_axi_interconnect_0_M00_AXI_AWBURST = S_AXI_awburst[1:0];
  assign zynq_axi_interconnect_0_M00_AXI_AWCACHE = S_AXI_awcache[3:0];
  assign zynq_axi_interconnect_0_M00_AXI_AWID = S_AXI_awid[11:0];
  assign zynq_axi_interconnect_0_M00_AXI_AWLEN = S_AXI_awlen[7:0];
  assign zynq_axi_interconnect_0_M00_AXI_AWLOCK = S_AXI_awlock;
  assign zynq_axi_interconnect_0_M00_AXI_AWPROT = S_AXI_awprot[2:0];
  assign zynq_axi_interconnect_0_M00_AXI_AWSIZE = S_AXI_awsize[2:0];
  assign zynq_axi_interconnect_0_M00_AXI_AWVALID = S_AXI_awvalid;
  assign zynq_axi_interconnect_0_M00_AXI_BREADY = S_AXI_bready;
  assign zynq_axi_interconnect_0_M00_AXI_RREADY = S_AXI_rready;
  assign zynq_axi_interconnect_0_M00_AXI_WDATA = S_AXI_wdata[31:0];
  assign zynq_axi_interconnect_0_M00_AXI_WLAST = S_AXI_wlast;
  assign zynq_axi_interconnect_0_M00_AXI_WSTRB = S_AXI_wstrb[3:0];
  assign zynq_axi_interconnect_0_M00_AXI_WVALID = S_AXI_wvalid;
  (* BMM_INFO_ADDRESS_SPACE = "byte  0x40000000 32 > jahwa_daq_system mb_softprocessor_0/microblaze_local_memory_0/lmb_bram_0" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  jahwa_daq_system_axi_bram_ctrl_0_0 axi_bram_ctrl_0
       (.bram_addr_a(axi_bram_ctrl_0_BRAM_PORTA_ADDR),
        .bram_clk_a(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .bram_en_a(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .bram_rddata_a(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .bram_rst_a(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .bram_we_a(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .bram_wrdata_a(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .s_axi_aclk(softprocessor_clk),
        .s_axi_araddr(zynq_axi_interconnect_0_M00_AXI_ARADDR[18:0]),
        .s_axi_arburst(zynq_axi_interconnect_0_M00_AXI_ARBURST),
        .s_axi_arcache(zynq_axi_interconnect_0_M00_AXI_ARCACHE),
        .s_axi_aresetn(axi_rstn),
        .s_axi_arid(zynq_axi_interconnect_0_M00_AXI_ARID),
        .s_axi_arlen(zynq_axi_interconnect_0_M00_AXI_ARLEN),
        .s_axi_arlock(zynq_axi_interconnect_0_M00_AXI_ARLOCK),
        .s_axi_arprot(zynq_axi_interconnect_0_M00_AXI_ARPROT),
        .s_axi_arready(zynq_axi_interconnect_0_M00_AXI_ARREADY),
        .s_axi_arsize(zynq_axi_interconnect_0_M00_AXI_ARSIZE),
        .s_axi_arvalid(zynq_axi_interconnect_0_M00_AXI_ARVALID),
        .s_axi_awaddr(zynq_axi_interconnect_0_M00_AXI_AWADDR[18:0]),
        .s_axi_awburst(zynq_axi_interconnect_0_M00_AXI_AWBURST),
        .s_axi_awcache(zynq_axi_interconnect_0_M00_AXI_AWCACHE),
        .s_axi_awid(zynq_axi_interconnect_0_M00_AXI_AWID),
        .s_axi_awlen(zynq_axi_interconnect_0_M00_AXI_AWLEN),
        .s_axi_awlock(zynq_axi_interconnect_0_M00_AXI_AWLOCK),
        .s_axi_awprot(zynq_axi_interconnect_0_M00_AXI_AWPROT),
        .s_axi_awready(zynq_axi_interconnect_0_M00_AXI_AWREADY),
        .s_axi_awsize(zynq_axi_interconnect_0_M00_AXI_AWSIZE),
        .s_axi_awvalid(zynq_axi_interconnect_0_M00_AXI_AWVALID),
        .s_axi_bid(zynq_axi_interconnect_0_M00_AXI_BID),
        .s_axi_bready(zynq_axi_interconnect_0_M00_AXI_BREADY),
        .s_axi_bresp(zynq_axi_interconnect_0_M00_AXI_BRESP),
        .s_axi_bvalid(zynq_axi_interconnect_0_M00_AXI_BVALID),
        .s_axi_rdata(zynq_axi_interconnect_0_M00_AXI_RDATA),
        .s_axi_rid(zynq_axi_interconnect_0_M00_AXI_RID),
        .s_axi_rlast(zynq_axi_interconnect_0_M00_AXI_RLAST),
        .s_axi_rready(zynq_axi_interconnect_0_M00_AXI_RREADY),
        .s_axi_rresp(zynq_axi_interconnect_0_M00_AXI_RRESP),
        .s_axi_rvalid(zynq_axi_interconnect_0_M00_AXI_RVALID),
        .s_axi_wdata(zynq_axi_interconnect_0_M00_AXI_WDATA),
        .s_axi_wlast(zynq_axi_interconnect_0_M00_AXI_WLAST),
        .s_axi_wready(zynq_axi_interconnect_0_M00_AXI_WREADY),
        .s_axi_wstrb(zynq_axi_interconnect_0_M00_AXI_WSTRB),
        .s_axi_wvalid(zynq_axi_interconnect_0_M00_AXI_WVALID));
  jahwa_daq_system_axi_gpio_0_1 axi_gpio_0
       (.gpio_io_o(dff_en_reset_vector_0_en),
        .s_axi_aclk(softprocessor_clk),
        .s_axi_araddr(mb_axi_interconnect_0_M01_AXI_ARADDR[8:0]),
        .s_axi_aresetn(axi_rstn),
        .s_axi_arready(mb_axi_interconnect_0_M01_AXI_ARREADY),
        .s_axi_arvalid(mb_axi_interconnect_0_M01_AXI_ARVALID),
        .s_axi_awaddr(mb_axi_interconnect_0_M01_AXI_AWADDR[8:0]),
        .s_axi_awready(mb_axi_interconnect_0_M01_AXI_AWREADY),
        .s_axi_awvalid(mb_axi_interconnect_0_M01_AXI_AWVALID),
        .s_axi_bready(mb_axi_interconnect_0_M01_AXI_BREADY),
        .s_axi_bresp(mb_axi_interconnect_0_M01_AXI_BRESP),
        .s_axi_bvalid(mb_axi_interconnect_0_M01_AXI_BVALID),
        .s_axi_rdata(mb_axi_interconnect_0_M01_AXI_RDATA),
        .s_axi_rready(mb_axi_interconnect_0_M01_AXI_RREADY),
        .s_axi_rresp(mb_axi_interconnect_0_M01_AXI_RRESP),
        .s_axi_rvalid(mb_axi_interconnect_0_M01_AXI_RVALID),
        .s_axi_wdata(mb_axi_interconnect_0_M01_AXI_WDATA),
        .s_axi_wready(mb_axi_interconnect_0_M01_AXI_WREADY),
        .s_axi_wstrb(mb_axi_interconnect_0_M01_AXI_WSTRB),
        .s_axi_wvalid(mb_axi_interconnect_0_M01_AXI_WVALID));
  jahwa_daq_system_axi_intc_0_1 axi_intc_0
       (.intr(xlconcat_0_dout),
        .irq(axi_intc_0_interrupt_INTERRUPT),
        .s_axi_aclk(softprocessor_clk),
        .s_axi_araddr(mb_axi_interconnect_0_M00_AXI_ARADDR[8:0]),
        .s_axi_aresetn(rst_ps7_0_100M_peripheral_aresetn),
        .s_axi_arready(mb_axi_interconnect_0_M00_AXI_ARREADY),
        .s_axi_arvalid(mb_axi_interconnect_0_M00_AXI_ARVALID),
        .s_axi_awaddr(mb_axi_interconnect_0_M00_AXI_AWADDR[8:0]),
        .s_axi_awready(mb_axi_interconnect_0_M00_AXI_AWREADY),
        .s_axi_awvalid(mb_axi_interconnect_0_M00_AXI_AWVALID),
        .s_axi_bready(mb_axi_interconnect_0_M00_AXI_BREADY),
        .s_axi_bresp(mb_axi_interconnect_0_M00_AXI_BRESP),
        .s_axi_bvalid(mb_axi_interconnect_0_M00_AXI_BVALID),
        .s_axi_rdata(mb_axi_interconnect_0_M00_AXI_RDATA),
        .s_axi_rready(mb_axi_interconnect_0_M00_AXI_RREADY),
        .s_axi_rresp(mb_axi_interconnect_0_M00_AXI_RRESP),
        .s_axi_rvalid(mb_axi_interconnect_0_M00_AXI_RVALID),
        .s_axi_wdata(mb_axi_interconnect_0_M00_AXI_WDATA),
        .s_axi_wready(mb_axi_interconnect_0_M00_AXI_WREADY),
        .s_axi_wstrb(mb_axi_interconnect_0_M00_AXI_WSTRB),
        .s_axi_wvalid(mb_axi_interconnect_0_M00_AXI_WVALID));
  jahwa_daq_system_axi_interconnect_0_1 axi_interconnect_0
       (.ACLK(softprocessor_clk),
        .ARESETN(rst_ps7_0_100M_interconnect_aresetn),
        .M00_ACLK(softprocessor_clk),
        .M00_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .M00_AXI_araddr(mb_axi_interconnect_0_M00_AXI_ARADDR),
        .M00_AXI_arready(mb_axi_interconnect_0_M00_AXI_ARREADY),
        .M00_AXI_arvalid(mb_axi_interconnect_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(mb_axi_interconnect_0_M00_AXI_AWADDR),
        .M00_AXI_awready(mb_axi_interconnect_0_M00_AXI_AWREADY),
        .M00_AXI_awvalid(mb_axi_interconnect_0_M00_AXI_AWVALID),
        .M00_AXI_bready(mb_axi_interconnect_0_M00_AXI_BREADY),
        .M00_AXI_bresp(mb_axi_interconnect_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(mb_axi_interconnect_0_M00_AXI_BVALID),
        .M00_AXI_rdata(mb_axi_interconnect_0_M00_AXI_RDATA),
        .M00_AXI_rready(mb_axi_interconnect_0_M00_AXI_RREADY),
        .M00_AXI_rresp(mb_axi_interconnect_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(mb_axi_interconnect_0_M00_AXI_RVALID),
        .M00_AXI_wdata(mb_axi_interconnect_0_M00_AXI_WDATA),
        .M00_AXI_wready(mb_axi_interconnect_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(mb_axi_interconnect_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(mb_axi_interconnect_0_M00_AXI_WVALID),
        .M01_ACLK(softprocessor_clk),
        .M01_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .M01_AXI_araddr(mb_axi_interconnect_0_M01_AXI_ARADDR),
        .M01_AXI_arready(mb_axi_interconnect_0_M01_AXI_ARREADY),
        .M01_AXI_arvalid(mb_axi_interconnect_0_M01_AXI_ARVALID),
        .M01_AXI_awaddr(mb_axi_interconnect_0_M01_AXI_AWADDR),
        .M01_AXI_awready(mb_axi_interconnect_0_M01_AXI_AWREADY),
        .M01_AXI_awvalid(mb_axi_interconnect_0_M01_AXI_AWVALID),
        .M01_AXI_bready(mb_axi_interconnect_0_M01_AXI_BREADY),
        .M01_AXI_bresp(mb_axi_interconnect_0_M01_AXI_BRESP),
        .M01_AXI_bvalid(mb_axi_interconnect_0_M01_AXI_BVALID),
        .M01_AXI_rdata(mb_axi_interconnect_0_M01_AXI_RDATA),
        .M01_AXI_rready(mb_axi_interconnect_0_M01_AXI_RREADY),
        .M01_AXI_rresp(mb_axi_interconnect_0_M01_AXI_RRESP),
        .M01_AXI_rvalid(mb_axi_interconnect_0_M01_AXI_RVALID),
        .M01_AXI_wdata(mb_axi_interconnect_0_M01_AXI_WDATA),
        .M01_AXI_wready(mb_axi_interconnect_0_M01_AXI_WREADY),
        .M01_AXI_wstrb(mb_axi_interconnect_0_M01_AXI_WSTRB),
        .M01_AXI_wvalid(mb_axi_interconnect_0_M01_AXI_WVALID),
        .M02_ACLK(softprocessor_clk),
        .M02_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .M02_AXI_araddr(mb_axi_interconnect_0_M02_AXI_ARADDR),
        .M02_AXI_arready(mb_axi_interconnect_0_M02_AXI_ARREADY),
        .M02_AXI_arvalid(mb_axi_interconnect_0_M02_AXI_ARVALID),
        .M02_AXI_awaddr(mb_axi_interconnect_0_M02_AXI_AWADDR),
        .M02_AXI_awready(mb_axi_interconnect_0_M02_AXI_AWREADY),
        .M02_AXI_awvalid(mb_axi_interconnect_0_M02_AXI_AWVALID),
        .M02_AXI_bready(mb_axi_interconnect_0_M02_AXI_BREADY),
        .M02_AXI_bresp(mb_axi_interconnect_0_M02_AXI_BRESP),
        .M02_AXI_bvalid(mb_axi_interconnect_0_M02_AXI_BVALID),
        .M02_AXI_rdata(mb_axi_interconnect_0_M02_AXI_RDATA),
        .M02_AXI_rready(mb_axi_interconnect_0_M02_AXI_RREADY),
        .M02_AXI_rresp(mb_axi_interconnect_0_M02_AXI_RRESP),
        .M02_AXI_rvalid(mb_axi_interconnect_0_M02_AXI_RVALID),
        .M02_AXI_wdata(mb_axi_interconnect_0_M02_AXI_WDATA),
        .M02_AXI_wready(mb_axi_interconnect_0_M02_AXI_WREADY),
        .M02_AXI_wstrb(mb_axi_interconnect_0_M02_AXI_WSTRB),
        .M02_AXI_wvalid(mb_axi_interconnect_0_M02_AXI_WVALID),
        .M03_ACLK(softprocessor_clk),
        .M03_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .M03_AXI_araddr(mb_axi_interconnect_0_M03_AXI_ARADDR),
        .M03_AXI_arready(mb_axi_interconnect_0_M03_AXI_ARREADY),
        .M03_AXI_arvalid(mb_axi_interconnect_0_M03_AXI_ARVALID),
        .M03_AXI_awaddr(mb_axi_interconnect_0_M03_AXI_AWADDR),
        .M03_AXI_awready(mb_axi_interconnect_0_M03_AXI_AWREADY),
        .M03_AXI_awvalid(mb_axi_interconnect_0_M03_AXI_AWVALID),
        .M03_AXI_bready(mb_axi_interconnect_0_M03_AXI_BREADY),
        .M03_AXI_bresp(mb_axi_interconnect_0_M03_AXI_BRESP),
        .M03_AXI_bvalid(mb_axi_interconnect_0_M03_AXI_BVALID),
        .M03_AXI_rdata(mb_axi_interconnect_0_M03_AXI_RDATA),
        .M03_AXI_rready(mb_axi_interconnect_0_M03_AXI_RREADY),
        .M03_AXI_rresp(mb_axi_interconnect_0_M03_AXI_RRESP),
        .M03_AXI_rvalid(mb_axi_interconnect_0_M03_AXI_RVALID),
        .M03_AXI_wdata(mb_axi_interconnect_0_M03_AXI_WDATA),
        .M03_AXI_wready(mb_axi_interconnect_0_M03_AXI_WREADY),
        .M03_AXI_wstrb(mb_axi_interconnect_0_M03_AXI_WSTRB),
        .M03_AXI_wvalid(mb_axi_interconnect_0_M03_AXI_WVALID),
        .M04_ACLK(softprocessor_clk),
        .M04_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .M04_AXI_araddr(mb_axi_interconnect_0_M04_AXI_ARADDR),
        .M04_AXI_arready(mb_axi_interconnect_0_M04_AXI_ARREADY),
        .M04_AXI_arvalid(mb_axi_interconnect_0_M04_AXI_ARVALID),
        .M04_AXI_awaddr(mb_axi_interconnect_0_M04_AXI_AWADDR),
        .M04_AXI_awready(mb_axi_interconnect_0_M04_AXI_AWREADY),
        .M04_AXI_awvalid(mb_axi_interconnect_0_M04_AXI_AWVALID),
        .M04_AXI_bready(mb_axi_interconnect_0_M04_AXI_BREADY),
        .M04_AXI_bresp(mb_axi_interconnect_0_M04_AXI_BRESP),
        .M04_AXI_bvalid(mb_axi_interconnect_0_M04_AXI_BVALID),
        .M04_AXI_rdata(mb_axi_interconnect_0_M04_AXI_RDATA),
        .M04_AXI_rready(mb_axi_interconnect_0_M04_AXI_RREADY),
        .M04_AXI_rresp(mb_axi_interconnect_0_M04_AXI_RRESP),
        .M04_AXI_rvalid(mb_axi_interconnect_0_M04_AXI_RVALID),
        .M04_AXI_wdata(mb_axi_interconnect_0_M04_AXI_WDATA),
        .M04_AXI_wready(mb_axi_interconnect_0_M04_AXI_WREADY),
        .M04_AXI_wstrb(mb_axi_interconnect_0_M04_AXI_WSTRB),
        .M04_AXI_wvalid(mb_axi_interconnect_0_M04_AXI_WVALID),
        .M05_ACLK(softprocessor_clk),
        .M05_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .M05_AXI_araddr(conn_m05_axi_ARADDR),
        .M05_AXI_arready(conn_m05_axi_ARREADY),
        .M05_AXI_arvalid(conn_m05_axi_ARVALID),
        .M05_AXI_awaddr(conn_m05_axi_AWADDR),
        .M05_AXI_awready(conn_m05_axi_AWREADY),
        .M05_AXI_awvalid(conn_m05_axi_AWVALID),
        .M05_AXI_bready(conn_m05_axi_BREADY),
        .M05_AXI_bresp(conn_m05_axi_BRESP),
        .M05_AXI_bvalid(conn_m05_axi_BVALID),
        .M05_AXI_rdata(conn_m05_axi_RDATA),
        .M05_AXI_rready(conn_m05_axi_RREADY),
        .M05_AXI_rresp(conn_m05_axi_RRESP),
        .M05_AXI_rvalid(conn_m05_axi_RVALID),
        .M05_AXI_wdata(conn_m05_axi_WDATA),
        .M05_AXI_wready(conn_m05_axi_WREADY),
        .M05_AXI_wstrb(conn_m05_axi_WSTRB),
        .M05_AXI_wvalid(conn_m05_axi_WVALID),
        .M06_ACLK(softprocessor_clk),
        .M06_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .M06_AXI_araddr(conn_m06_axi_ARADDR),
        .M06_AXI_arready(conn_m06_axi_ARREADY),
        .M06_AXI_arvalid(conn_m06_axi_ARVALID),
        .M06_AXI_awaddr(conn_m06_axi_AWADDR),
        .M06_AXI_awready(conn_m06_axi_AWREADY),
        .M06_AXI_awvalid(conn_m06_axi_AWVALID),
        .M06_AXI_bready(conn_m06_axi_BREADY),
        .M06_AXI_bresp(conn_m06_axi_BRESP),
        .M06_AXI_bvalid(conn_m06_axi_BVALID),
        .M06_AXI_rdata(conn_m06_axi_RDATA),
        .M06_AXI_rready(conn_m06_axi_RREADY),
        .M06_AXI_rresp(conn_m06_axi_RRESP),
        .M06_AXI_rvalid(conn_m06_axi_RVALID),
        .M06_AXI_wdata(conn_m06_axi_WDATA),
        .M06_AXI_wready(conn_m06_axi_WREADY),
        .M06_AXI_wstrb(conn_m06_axi_WSTRB),
        .M06_AXI_wvalid(conn_m06_axi_WVALID),
        .M07_ACLK(softprocessor_clk),
        .M07_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .M07_AXI_araddr(conn_m07_axi_ARADDR),
        .M07_AXI_arprot(conn_m07_axi_ARPROT),
        .M07_AXI_arready(conn_m07_axi_ARREADY),
        .M07_AXI_arvalid(conn_m07_axi_ARVALID),
        .M07_AXI_awaddr(conn_m07_axi_AWADDR),
        .M07_AXI_awprot(conn_m07_axi_AWPROT),
        .M07_AXI_awready(conn_m07_axi_AWREADY),
        .M07_AXI_awvalid(conn_m07_axi_AWVALID),
        .M07_AXI_bready(conn_m07_axi_BREADY),
        .M07_AXI_bresp(conn_m07_axi_BRESP),
        .M07_AXI_bvalid(conn_m07_axi_BVALID),
        .M07_AXI_rdata(conn_m07_axi_RDATA),
        .M07_AXI_rready(conn_m07_axi_RREADY),
        .M07_AXI_rresp(conn_m07_axi_RRESP),
        .M07_AXI_rvalid(conn_m07_axi_RVALID),
        .M07_AXI_wdata(conn_m07_axi_WDATA),
        .M07_AXI_wready(conn_m07_axi_WREADY),
        .M07_AXI_wstrb(conn_m07_axi_WSTRB),
        .M07_AXI_wvalid(conn_m07_axi_WVALID),
        .M08_ACLK(softprocessor_clk),
        .M08_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .M08_AXI_araddr(conn_m08_axi_ARADDR),
        .M08_AXI_arready(conn_m08_axi_ARREADY),
        .M08_AXI_arvalid(conn_m08_axi_ARVALID),
        .M08_AXI_awaddr(conn_m08_axi_AWADDR),
        .M08_AXI_awready(conn_m08_axi_AWREADY),
        .M08_AXI_awvalid(conn_m08_axi_AWVALID),
        .M08_AXI_bready(conn_m08_axi_BREADY),
        .M08_AXI_bresp(conn_m08_axi_BRESP),
        .M08_AXI_bvalid(conn_m08_axi_BVALID),
        .M08_AXI_rdata(conn_m08_axi_RDATA),
        .M08_AXI_rready(conn_m08_axi_RREADY),
        .M08_AXI_rresp(conn_m08_axi_RRESP),
        .M08_AXI_rvalid(conn_m08_axi_RVALID),
        .M08_AXI_wdata(conn_m08_axi_WDATA),
        .M08_AXI_wready(conn_m08_axi_WREADY),
        .M08_AXI_wstrb(conn_m08_axi_WSTRB),
        .M08_AXI_wvalid(conn_m08_axi_WVALID),
        .M09_ACLK(softprocessor_clk),
        .M09_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .M09_AXI_araddr(conn_m09_axi_ARADDR),
        .M09_AXI_arready(conn_m09_axi_ARREADY),
        .M09_AXI_arvalid(conn_m09_axi_ARVALID),
        .M09_AXI_awaddr(conn_m09_axi_AWADDR),
        .M09_AXI_awready(conn_m09_axi_AWREADY),
        .M09_AXI_awvalid(conn_m09_axi_AWVALID),
        .M09_AXI_bready(conn_m09_axi_BREADY),
        .M09_AXI_bresp(conn_m09_axi_BRESP),
        .M09_AXI_bvalid(conn_m09_axi_BVALID),
        .M09_AXI_rdata(conn_m09_axi_RDATA),
        .M09_AXI_rready(conn_m09_axi_RREADY),
        .M09_AXI_rresp(conn_m09_axi_RRESP),
        .M09_AXI_rvalid(conn_m09_axi_RVALID),
        .M09_AXI_wdata(conn_m09_axi_WDATA),
        .M09_AXI_wready(conn_m09_axi_WREADY),
        .M09_AXI_wstrb(conn_m09_axi_WSTRB),
        .M09_AXI_wvalid(conn_m09_axi_WVALID),
        .M10_ACLK(softprocessor_clk),
        .M10_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .M10_AXI_araddr(conn_m10_axi_ARADDR),
        .M10_AXI_arready(conn_m10_axi_ARREADY),
        .M10_AXI_arvalid(conn_m10_axi_ARVALID),
        .M10_AXI_awaddr(conn_m10_axi_AWADDR),
        .M10_AXI_awready(conn_m10_axi_AWREADY),
        .M10_AXI_awvalid(conn_m10_axi_AWVALID),
        .M10_AXI_bready(conn_m10_axi_BREADY),
        .M10_AXI_bresp(conn_m10_axi_BRESP),
        .M10_AXI_bvalid(conn_m10_axi_BVALID),
        .M10_AXI_rdata(conn_m10_axi_RDATA),
        .M10_AXI_rready(conn_m10_axi_RREADY),
        .M10_AXI_rresp(conn_m10_axi_RRESP),
        .M10_AXI_rvalid(conn_m10_axi_RVALID),
        .M10_AXI_wdata(conn_m10_axi_WDATA),
        .M10_AXI_wready(conn_m10_axi_WREADY),
        .M10_AXI_wstrb(conn_m10_axi_WSTRB),
        .M10_AXI_wvalid(conn_m10_axi_WVALID),
        .M11_ACLK(softprocessor_clk),
        .M11_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .M11_AXI_araddr(conn_m11_axi_ARADDR),
        .M11_AXI_arready(conn_m11_axi_ARREADY),
        .M11_AXI_arvalid(conn_m11_axi_ARVALID),
        .M11_AXI_awaddr(conn_m11_axi_AWADDR),
        .M11_AXI_awready(conn_m11_axi_AWREADY),
        .M11_AXI_awvalid(conn_m11_axi_AWVALID),
        .M11_AXI_bready(conn_m11_axi_BREADY),
        .M11_AXI_bresp(conn_m11_axi_BRESP),
        .M11_AXI_bvalid(conn_m11_axi_BVALID),
        .M11_AXI_rdata(conn_m11_axi_RDATA),
        .M11_AXI_rready(conn_m11_axi_RREADY),
        .M11_AXI_rresp(conn_m11_axi_RRESP),
        .M11_AXI_rvalid(conn_m11_axi_RVALID),
        .M11_AXI_wdata(conn_m11_axi_WDATA),
        .M11_AXI_wready(conn_m11_axi_WREADY),
        .M11_AXI_wstrb(conn_m11_axi_WSTRB),
        .M11_AXI_wvalid(conn_m11_axi_WVALID),
        .M12_ACLK(softprocessor_clk),
        .M12_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .M12_AXI_araddr(conn_m12_axi_ARADDR),
        .M12_AXI_arready(conn_m12_axi_ARREADY),
        .M12_AXI_arvalid(conn_m12_axi_ARVALID),
        .M12_AXI_awaddr(conn_m12_axi_AWADDR),
        .M12_AXI_awready(conn_m12_axi_AWREADY),
        .M12_AXI_awvalid(conn_m12_axi_AWVALID),
        .M12_AXI_bready(conn_m12_axi_BREADY),
        .M12_AXI_bresp(conn_m12_axi_BRESP),
        .M12_AXI_bvalid(conn_m12_axi_BVALID),
        .M12_AXI_rdata(conn_m12_axi_RDATA),
        .M12_AXI_rready(conn_m12_axi_RREADY),
        .M12_AXI_rresp(conn_m12_axi_RRESP),
        .M12_AXI_rvalid(conn_m12_axi_RVALID),
        .M12_AXI_wdata(conn_m12_axi_WDATA),
        .M12_AXI_wready(conn_m12_axi_WREADY),
        .M12_AXI_wstrb(conn_m12_axi_WSTRB),
        .M12_AXI_wvalid(conn_m12_axi_WVALID),
        .M13_ACLK(softprocessor_clk),
        .M13_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .M13_AXI_araddr(conn_m13_axi_ARADDR),
        .M13_AXI_arready(conn_m13_axi_ARREADY),
        .M13_AXI_arvalid(conn_m13_axi_ARVALID),
        .M13_AXI_awaddr(conn_m13_axi_AWADDR),
        .M13_AXI_awready(conn_m13_axi_AWREADY),
        .M13_AXI_awvalid(conn_m13_axi_AWVALID),
        .M13_AXI_bready(conn_m13_axi_BREADY),
        .M13_AXI_bresp(conn_m13_axi_BRESP),
        .M13_AXI_bvalid(conn_m13_axi_BVALID),
        .M13_AXI_rdata(conn_m13_axi_RDATA),
        .M13_AXI_rready(conn_m13_axi_RREADY),
        .M13_AXI_rresp(conn_m13_axi_RRESP),
        .M13_AXI_rvalid(conn_m13_axi_RVALID),
        .M13_AXI_wdata(conn_m13_axi_WDATA),
        .M13_AXI_wready(conn_m13_axi_WREADY),
        .M13_AXI_wstrb(conn_m13_axi_WSTRB),
        .M13_AXI_wvalid(conn_m13_axi_WVALID),
        .S00_ACLK(softprocessor_clk),
        .S00_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .S00_AXI_araddr(mb_M_AXI_DP_ARADDR),
        .S00_AXI_arprot(mb_M_AXI_DP_ARPROT),
        .S00_AXI_arready(mb_M_AXI_DP_ARREADY),
        .S00_AXI_arvalid(mb_M_AXI_DP_ARVALID),
        .S00_AXI_awaddr(mb_M_AXI_DP_AWADDR),
        .S00_AXI_awprot(mb_M_AXI_DP_AWPROT),
        .S00_AXI_awready(mb_M_AXI_DP_AWREADY),
        .S00_AXI_awvalid(mb_M_AXI_DP_AWVALID),
        .S00_AXI_bready(mb_M_AXI_DP_BREADY),
        .S00_AXI_bresp(mb_M_AXI_DP_BRESP),
        .S00_AXI_bvalid(mb_M_AXI_DP_BVALID),
        .S00_AXI_rdata(mb_M_AXI_DP_RDATA),
        .S00_AXI_rready(mb_M_AXI_DP_RREADY),
        .S00_AXI_rresp(mb_M_AXI_DP_RRESP),
        .S00_AXI_rvalid(mb_M_AXI_DP_RVALID),
        .S00_AXI_wdata(mb_M_AXI_DP_WDATA),
        .S00_AXI_wready(mb_M_AXI_DP_WREADY),
        .S00_AXI_wstrb(mb_M_AXI_DP_WSTRB),
        .S00_AXI_wvalid(mb_M_AXI_DP_WVALID));
  jahwa_daq_system_axi_timer_0_0 axi_timer_0
       (.capturetrig0(1'b0),
        .capturetrig1(1'b0),
        .freeze(1'b0),
        .interrupt(axi_timer_0_intr),
        .s_axi_aclk(softprocessor_clk),
        .s_axi_araddr(mb_axi_interconnect_0_M02_AXI_ARADDR[4:0]),
        .s_axi_aresetn(rst_ps7_0_100M_peripheral_aresetn),
        .s_axi_arready(mb_axi_interconnect_0_M02_AXI_ARREADY),
        .s_axi_arvalid(mb_axi_interconnect_0_M02_AXI_ARVALID),
        .s_axi_awaddr(mb_axi_interconnect_0_M02_AXI_AWADDR[4:0]),
        .s_axi_awready(mb_axi_interconnect_0_M02_AXI_AWREADY),
        .s_axi_awvalid(mb_axi_interconnect_0_M02_AXI_AWVALID),
        .s_axi_bready(mb_axi_interconnect_0_M02_AXI_BREADY),
        .s_axi_bresp(mb_axi_interconnect_0_M02_AXI_BRESP),
        .s_axi_bvalid(mb_axi_interconnect_0_M02_AXI_BVALID),
        .s_axi_rdata(mb_axi_interconnect_0_M02_AXI_RDATA),
        .s_axi_rready(mb_axi_interconnect_0_M02_AXI_RREADY),
        .s_axi_rresp(mb_axi_interconnect_0_M02_AXI_RRESP),
        .s_axi_rvalid(mb_axi_interconnect_0_M02_AXI_RVALID),
        .s_axi_wdata(mb_axi_interconnect_0_M02_AXI_WDATA),
        .s_axi_wready(mb_axi_interconnect_0_M02_AXI_WREADY),
        .s_axi_wstrb(mb_axi_interconnect_0_M02_AXI_WSTRB),
        .s_axi_wvalid(mb_axi_interconnect_0_M02_AXI_WVALID));
  jahwa_daq_system_axi_timer_1_0 axi_timer_1
       (.capturetrig0(1'b0),
        .capturetrig1(1'b0),
        .freeze(1'b0),
        .interrupt(axi_timer_1_intr),
        .s_axi_aclk(softprocessor_clk),
        .s_axi_araddr(mb_axi_interconnect_0_M03_AXI_ARADDR[4:0]),
        .s_axi_aresetn(rst_ps7_0_100M_peripheral_aresetn),
        .s_axi_arready(mb_axi_interconnect_0_M03_AXI_ARREADY),
        .s_axi_arvalid(mb_axi_interconnect_0_M03_AXI_ARVALID),
        .s_axi_awaddr(mb_axi_interconnect_0_M03_AXI_AWADDR[4:0]),
        .s_axi_awready(mb_axi_interconnect_0_M03_AXI_AWREADY),
        .s_axi_awvalid(mb_axi_interconnect_0_M03_AXI_AWVALID),
        .s_axi_bready(mb_axi_interconnect_0_M03_AXI_BREADY),
        .s_axi_bresp(mb_axi_interconnect_0_M03_AXI_BRESP),
        .s_axi_bvalid(mb_axi_interconnect_0_M03_AXI_BVALID),
        .s_axi_rdata(mb_axi_interconnect_0_M03_AXI_RDATA),
        .s_axi_rready(mb_axi_interconnect_0_M03_AXI_RREADY),
        .s_axi_rresp(mb_axi_interconnect_0_M03_AXI_RRESP),
        .s_axi_rvalid(mb_axi_interconnect_0_M03_AXI_RVALID),
        .s_axi_wdata(mb_axi_interconnect_0_M03_AXI_WDATA),
        .s_axi_wready(mb_axi_interconnect_0_M03_AXI_WREADY),
        .s_axi_wstrb(mb_axi_interconnect_0_M03_AXI_WSTRB),
        .s_axi_wvalid(mb_axi_interconnect_0_M03_AXI_WVALID));
  jahwa_daq_system_axi_timer_2_0 axi_timer_2
       (.capturetrig0(1'b0),
        .capturetrig1(1'b0),
        .freeze(1'b0),
        .interrupt(axi_timer_2_intr),
        .s_axi_aclk(softprocessor_clk),
        .s_axi_araddr(mb_axi_interconnect_0_M04_AXI_ARADDR[4:0]),
        .s_axi_aresetn(rst_ps7_0_100M_peripheral_aresetn),
        .s_axi_arready(mb_axi_interconnect_0_M04_AXI_ARREADY),
        .s_axi_arvalid(mb_axi_interconnect_0_M04_AXI_ARVALID),
        .s_axi_awaddr(mb_axi_interconnect_0_M04_AXI_AWADDR[4:0]),
        .s_axi_awready(mb_axi_interconnect_0_M04_AXI_AWREADY),
        .s_axi_awvalid(mb_axi_interconnect_0_M04_AXI_AWVALID),
        .s_axi_bready(mb_axi_interconnect_0_M04_AXI_BREADY),
        .s_axi_bresp(mb_axi_interconnect_0_M04_AXI_BRESP),
        .s_axi_bvalid(mb_axi_interconnect_0_M04_AXI_BVALID),
        .s_axi_rdata(mb_axi_interconnect_0_M04_AXI_RDATA),
        .s_axi_rready(mb_axi_interconnect_0_M04_AXI_RREADY),
        .s_axi_rresp(mb_axi_interconnect_0_M04_AXI_RRESP),
        .s_axi_rvalid(mb_axi_interconnect_0_M04_AXI_RVALID),
        .s_axi_wdata(mb_axi_interconnect_0_M04_AXI_WDATA),
        .s_axi_wready(mb_axi_interconnect_0_M04_AXI_WREADY),
        .s_axi_wstrb(mb_axi_interconnect_0_M04_AXI_WSTRB),
        .s_axi_wvalid(mb_axi_interconnect_0_M04_AXI_WVALID));
  jahwa_daq_system_dff_en_reset_vector_0_0 dff_en_reset_vector_0
       (.clk(softprocessor_clk),
        .d(xlconstant_0_dout),
        .en(dff_en_reset_vector_0_en),
        .q(dff_en_reset_vector_0_q),
        .reset(reset_1));
  jahwa_daq_system_mdm_0_0 mdm_0
       (.Dbg_Capture_0(microblaze_0_debug_CAPTURE),
        .Dbg_Clk_0(microblaze_0_debug_CLK),
        .Dbg_Disable_0(microblaze_0_debug_DISABLE),
        .Dbg_Reg_En_0(microblaze_0_debug_REG_EN),
        .Dbg_Rst_0(microblaze_0_debug_RST),
        .Dbg_Shift_0(microblaze_0_debug_SHIFT),
        .Dbg_TDI_0(microblaze_0_debug_TDI),
        .Dbg_TDO_0(microblaze_0_debug_TDO),
        .Dbg_Update_0(microblaze_0_debug_UPDATE),
        .Debug_SYS_Rst(mdm_debug_sys_rst_1));
  (* BMM_INFO_PROCESSOR = "microblaze-le > jahwa_daq_system mb_softprocessor_0/microblaze_local_memory_0/ilmb_bram_ctrl_0" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  jahwa_daq_system_microblaze_0_0 microblaze_0
       (.Byte_Enable(microblaze_0_dlmb_1_BE),
        .Clk(softprocessor_clk),
        .DCE(microblaze_0_dlmb_1_CE),
        .DReady(microblaze_0_dlmb_1_READY),
        .DUE(microblaze_0_dlmb_1_UE),
        .DWait(microblaze_0_dlmb_1_WAIT),
        .D_AS(microblaze_0_dlmb_1_ADDRSTROBE),
        .Data_Addr(microblaze_0_dlmb_1_ABUS),
        .Data_Read(microblaze_0_dlmb_1_READDBUS),
        .Data_Write(microblaze_0_dlmb_1_WRITEDBUS),
        .Dbg_Capture(microblaze_0_debug_CAPTURE),
        .Dbg_Clk(microblaze_0_debug_CLK),
        .Dbg_Disable(microblaze_0_debug_DISABLE),
        .Dbg_Reg_En(microblaze_0_debug_REG_EN),
        .Dbg_Shift(microblaze_0_debug_SHIFT),
        .Dbg_TDI(microblaze_0_debug_TDI),
        .Dbg_TDO(microblaze_0_debug_TDO),
        .Dbg_Update(microblaze_0_debug_UPDATE),
        .Debug_Rst(microblaze_0_debug_RST),
        .ICE(microblaze_0_ilmb_1_CE),
        .IFetch(microblaze_0_ilmb_1_READSTROBE),
        .IReady(microblaze_0_ilmb_1_READY),
        .IUE(microblaze_0_ilmb_1_UE),
        .IWAIT(microblaze_0_ilmb_1_WAIT),
        .I_AS(microblaze_0_ilmb_1_ADDRSTROBE),
        .Instr(microblaze_0_ilmb_1_READDBUS),
        .Instr_Addr(microblaze_0_ilmb_1_ABUS),
        .Interrupt(axi_intc_0_interrupt_INTERRUPT),
        .Interrupt_Address({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_AXI_DP_ARADDR(mb_M_AXI_DP_ARADDR),
        .M_AXI_DP_ARPROT(mb_M_AXI_DP_ARPROT),
        .M_AXI_DP_ARREADY(mb_M_AXI_DP_ARREADY),
        .M_AXI_DP_ARVALID(mb_M_AXI_DP_ARVALID),
        .M_AXI_DP_AWADDR(mb_M_AXI_DP_AWADDR),
        .M_AXI_DP_AWPROT(mb_M_AXI_DP_AWPROT),
        .M_AXI_DP_AWREADY(mb_M_AXI_DP_AWREADY),
        .M_AXI_DP_AWVALID(mb_M_AXI_DP_AWVALID),
        .M_AXI_DP_BREADY(mb_M_AXI_DP_BREADY),
        .M_AXI_DP_BRESP(mb_M_AXI_DP_BRESP),
        .M_AXI_DP_BVALID(mb_M_AXI_DP_BVALID),
        .M_AXI_DP_RDATA(mb_M_AXI_DP_RDATA),
        .M_AXI_DP_RREADY(mb_M_AXI_DP_RREADY),
        .M_AXI_DP_RRESP(mb_M_AXI_DP_RRESP),
        .M_AXI_DP_RVALID(mb_M_AXI_DP_RVALID),
        .M_AXI_DP_WDATA(mb_M_AXI_DP_WDATA),
        .M_AXI_DP_WREADY(mb_M_AXI_DP_WREADY),
        .M_AXI_DP_WSTRB(mb_M_AXI_DP_WSTRB),
        .M_AXI_DP_WVALID(mb_M_AXI_DP_WVALID),
        .Read_Strobe(microblaze_0_dlmb_1_READSTROBE),
        .Reset(rst_ps7_0_100M_mb_reset),
        .Write_Strobe(microblaze_0_dlmb_1_WRITESTROBE));
  microblaze_local_memory_0_imp_17QMV78 microblaze_local_memory_0
       (.BRAM_PORTB_addr(axi_bram_ctrl_0_BRAM_PORTA_ADDR),
        .BRAM_PORTB_clk(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .BRAM_PORTB_din(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .BRAM_PORTB_dout(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .BRAM_PORTB_en(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .BRAM_PORTB_rst(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .BRAM_PORTB_we(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .DLMB_abus(microblaze_0_dlmb_1_ABUS),
        .DLMB_addrstrobe(microblaze_0_dlmb_1_ADDRSTROBE),
        .DLMB_be(microblaze_0_dlmb_1_BE),
        .DLMB_ce(microblaze_0_dlmb_1_CE),
        .DLMB_readdbus(microblaze_0_dlmb_1_READDBUS),
        .DLMB_readstrobe(microblaze_0_dlmb_1_READSTROBE),
        .DLMB_ready(microblaze_0_dlmb_1_READY),
        .DLMB_ue(microblaze_0_dlmb_1_UE),
        .DLMB_wait(microblaze_0_dlmb_1_WAIT),
        .DLMB_writedbus(microblaze_0_dlmb_1_WRITEDBUS),
        .DLMB_writestrobe(microblaze_0_dlmb_1_WRITESTROBE),
        .ILMB_abus(microblaze_0_ilmb_1_ABUS),
        .ILMB_addrstrobe(microblaze_0_ilmb_1_ADDRSTROBE),
        .ILMB_ce(microblaze_0_ilmb_1_CE),
        .ILMB_readdbus(microblaze_0_ilmb_1_READDBUS),
        .ILMB_readstrobe(microblaze_0_ilmb_1_READSTROBE),
        .ILMB_ready(microblaze_0_ilmb_1_READY),
        .ILMB_ue(microblaze_0_ilmb_1_UE),
        .ILMB_wait(microblaze_0_ilmb_1_WAIT),
        .LMB_CLK(softprocessor_clk),
        .SYS_RST(sys_rst_1));
  jahwa_daq_system_rst_ps7_0_100M_0 rst_ps7_0_100M
       (.aux_reset_in(aux_rst_in_1),
        .bus_struct_reset(sys_rst_1),
        .dcm_locked(1'b1),
        .ext_reset_in(xlconstant_0_dout),
        .interconnect_aresetn(rst_ps7_0_100M_interconnect_aresetn),
        .mb_debug_sys_rst(mdm_debug_sys_rst_1),
        .mb_reset(rst_ps7_0_100M_mb_reset),
        .peripheral_aresetn(rst_ps7_0_100M_peripheral_aresetn),
        .slowest_sync_clk(softprocessor_clk));
  jahwa_daq_system_xlconcat_0_0 xlconcat_0
       (.In0(axi_timer_0_intr),
        .In1(axi_timer_1_intr),
        .In2(axi_timer_2_intr),
        .dout(xlconcat_0_dout));
  jahwa_daq_system_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule

module microblaze_local_memory_0_imp_17QMV78
   (BRAM_PORTB_addr,
    BRAM_PORTB_clk,
    BRAM_PORTB_din,
    BRAM_PORTB_dout,
    BRAM_PORTB_en,
    BRAM_PORTB_rst,
    BRAM_PORTB_we,
    DLMB_abus,
    DLMB_addrstrobe,
    DLMB_be,
    DLMB_ce,
    DLMB_readdbus,
    DLMB_readstrobe,
    DLMB_ready,
    DLMB_ue,
    DLMB_wait,
    DLMB_writedbus,
    DLMB_writestrobe,
    ILMB_abus,
    ILMB_addrstrobe,
    ILMB_ce,
    ILMB_readdbus,
    ILMB_readstrobe,
    ILMB_ready,
    ILMB_ue,
    ILMB_wait,
    LMB_CLK,
    SYS_RST);
  input [18:0]BRAM_PORTB_addr;
  input BRAM_PORTB_clk;
  input [31:0]BRAM_PORTB_din;
  output [31:0]BRAM_PORTB_dout;
  input BRAM_PORTB_en;
  input BRAM_PORTB_rst;
  input [3:0]BRAM_PORTB_we;
  input [0:31]DLMB_abus;
  input DLMB_addrstrobe;
  input [0:3]DLMB_be;
  output DLMB_ce;
  output [0:31]DLMB_readdbus;
  input DLMB_readstrobe;
  output DLMB_ready;
  output DLMB_ue;
  output DLMB_wait;
  input [0:31]DLMB_writedbus;
  input DLMB_writestrobe;
  input [0:31]ILMB_abus;
  input ILMB_addrstrobe;
  output ILMB_ce;
  output [0:31]ILMB_readdbus;
  input ILMB_readstrobe;
  output ILMB_ready;
  output ILMB_ue;
  output ILMB_wait;
  input LMB_CLK;
  input SYS_RST;

  wire [18:0]BRAM_PORTB_1_ADDR;
  wire BRAM_PORTB_1_CLK;
  wire [31:0]BRAM_PORTB_1_DIN;
  wire [31:0]BRAM_PORTB_1_DOUT;
  wire BRAM_PORTB_1_EN;
  wire BRAM_PORTB_1_RST;
  wire [3:0]BRAM_PORTB_1_WE;
  wire [0:31]Conn1_ABUS;
  wire Conn1_ADDRSTROBE;
  wire [0:3]Conn1_BE;
  wire Conn1_CE;
  wire [0:31]Conn1_READDBUS;
  wire Conn1_READSTROBE;
  wire Conn1_READY;
  wire Conn1_UE;
  wire Conn1_WAIT;
  wire [0:31]Conn1_WRITEDBUS;
  wire Conn1_WRITESTROBE;
  wire [0:31]Conn2_ABUS;
  wire Conn2_ADDRSTROBE;
  wire [0:3]Conn2_BE;
  wire Conn2_CE;
  wire [0:31]Conn2_READDBUS;
  wire Conn2_READSTROBE;
  wire Conn2_READY;
  wire Conn2_UE;
  wire Conn2_WAIT;
  wire [0:31]Conn2_WRITEDBUS;
  wire Conn2_WRITESTROBE;
  wire [0:31]Conn3_ABUS;
  wire Conn3_ADDRSTROBE;
  wire Conn3_CE;
  wire [0:31]Conn3_READDBUS;
  wire Conn3_READSTROBE;
  wire Conn3_READY;
  wire Conn3_UE;
  wire Conn3_WAIT;
  wire [0:31]Conn_ABUS;
  wire Conn_ADDRSTROBE;
  wire [0:3]Conn_BE;
  wire Conn_CE;
  wire [0:31]Conn_READDBUS;
  wire Conn_READSTROBE;
  wire Conn_READY;
  wire Conn_UE;
  wire Conn_WAIT;
  wire [0:31]Conn_WRITEDBUS;
  wire Conn_WRITESTROBE;
  wire [0:31]ilmb_bram_ctrl_0_BRAM_PORT_ADDR;
  wire ilmb_bram_ctrl_0_BRAM_PORT_CLK;
  wire [0:31]ilmb_bram_ctrl_0_BRAM_PORT_DIN;
  wire [31:0]ilmb_bram_ctrl_0_BRAM_PORT_DOUT;
  wire ilmb_bram_ctrl_0_BRAM_PORT_EN;
  wire ilmb_bram_ctrl_0_BRAM_PORT_RST;
  wire [0:3]ilmb_bram_ctrl_0_BRAM_PORT_WE;
  wire microblaze_0_clk;
  wire sys_rst;

  assign BRAM_PORTB_1_ADDR = BRAM_PORTB_addr[18:0];
  assign BRAM_PORTB_1_CLK = BRAM_PORTB_clk;
  assign BRAM_PORTB_1_DIN = BRAM_PORTB_din[31:0];
  assign BRAM_PORTB_1_EN = BRAM_PORTB_en;
  assign BRAM_PORTB_1_RST = BRAM_PORTB_rst;
  assign BRAM_PORTB_1_WE = BRAM_PORTB_we[3:0];
  assign BRAM_PORTB_dout[31:0] = BRAM_PORTB_1_DOUT;
  assign Conn2_ABUS = DLMB_abus[0:31];
  assign Conn2_ADDRSTROBE = DLMB_addrstrobe;
  assign Conn2_BE = DLMB_be[0:3];
  assign Conn2_READSTROBE = DLMB_readstrobe;
  assign Conn2_WRITEDBUS = DLMB_writedbus[0:31];
  assign Conn2_WRITESTROBE = DLMB_writestrobe;
  assign Conn3_ABUS = ILMB_abus[0:31];
  assign Conn3_ADDRSTROBE = ILMB_addrstrobe;
  assign Conn3_READSTROBE = ILMB_readstrobe;
  assign DLMB_ce = Conn2_CE;
  assign DLMB_readdbus[0:31] = Conn2_READDBUS;
  assign DLMB_ready = Conn2_READY;
  assign DLMB_ue = Conn2_UE;
  assign DLMB_wait = Conn2_WAIT;
  assign ILMB_ce = Conn3_CE;
  assign ILMB_readdbus[0:31] = Conn3_READDBUS;
  assign ILMB_ready = Conn3_READY;
  assign ILMB_ue = Conn3_UE;
  assign ILMB_wait = Conn3_WAIT;
  assign microblaze_0_clk = LMB_CLK;
  assign sys_rst = SYS_RST;
  jahwa_daq_system_dlmb_0_0 dlmb_0
       (.LMB_ABus(Conn1_ABUS),
        .LMB_AddrStrobe(Conn1_ADDRSTROBE),
        .LMB_BE(Conn1_BE),
        .LMB_CE(Conn2_CE),
        .LMB_Clk(microblaze_0_clk),
        .LMB_ReadDBus(Conn2_READDBUS),
        .LMB_ReadStrobe(Conn1_READSTROBE),
        .LMB_Ready(Conn2_READY),
        .LMB_UE(Conn2_UE),
        .LMB_Wait(Conn2_WAIT),
        .LMB_WriteDBus(Conn1_WRITEDBUS),
        .LMB_WriteStrobe(Conn1_WRITESTROBE),
        .M_ABus(Conn2_ABUS),
        .M_AddrStrobe(Conn2_ADDRSTROBE),
        .M_BE(Conn2_BE),
        .M_DBus(Conn2_WRITEDBUS),
        .M_ReadStrobe(Conn2_READSTROBE),
        .M_WriteStrobe(Conn2_WRITESTROBE),
        .SYS_Rst(sys_rst),
        .Sl_CE(Conn1_CE),
        .Sl_DBus(Conn1_READDBUS),
        .Sl_Ready(Conn1_READY),
        .Sl_UE(Conn1_UE),
        .Sl_Wait(Conn1_WAIT));
  jahwa_daq_system_ilmb_0_0 ilmb_0
       (.LMB_ABus(Conn_ABUS),
        .LMB_AddrStrobe(Conn_ADDRSTROBE),
        .LMB_BE(Conn_BE),
        .LMB_CE(Conn3_CE),
        .LMB_Clk(microblaze_0_clk),
        .LMB_ReadDBus(Conn3_READDBUS),
        .LMB_ReadStrobe(Conn_READSTROBE),
        .LMB_Ready(Conn3_READY),
        .LMB_UE(Conn3_UE),
        .LMB_Wait(Conn3_WAIT),
        .LMB_WriteDBus(Conn_WRITEDBUS),
        .LMB_WriteStrobe(Conn_WRITESTROBE),
        .M_ABus(Conn3_ABUS),
        .M_AddrStrobe(Conn3_ADDRSTROBE),
        .M_BE({1'b0,1'b0,1'b0,1'b0}),
        .M_DBus({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_ReadStrobe(Conn3_READSTROBE),
        .M_WriteStrobe(1'b0),
        .SYS_Rst(sys_rst),
        .Sl_CE(Conn_CE),
        .Sl_DBus(Conn_READDBUS),
        .Sl_Ready(Conn_READY),
        .Sl_UE(Conn_UE),
        .Sl_Wait(Conn_WAIT));
  (* BMM_INFO_ADDRESS_SPACE = "byte  0x00000000 32 > jahwa_daq_system mb_softprocessor_0/microblaze_local_memory_0/lmb_bram_0" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  jahwa_daq_system_ilmb_bram_ctrl_0_0 ilmb_bram_ctrl_0
       (.BRAM_Addr_A(ilmb_bram_ctrl_0_BRAM_PORT_ADDR),
        .BRAM_Clk_A(ilmb_bram_ctrl_0_BRAM_PORT_CLK),
        .BRAM_Din_A({ilmb_bram_ctrl_0_BRAM_PORT_DOUT[31],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[30],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[29],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[28],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[27],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[26],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[25],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[24],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[23],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[22],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[21],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[20],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[19],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[18],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[17],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[16],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[15],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[14],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[13],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[12],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[11],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[10],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[9],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[8],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[7],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[6],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[5],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[4],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[3],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[2],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[1],ilmb_bram_ctrl_0_BRAM_PORT_DOUT[0]}),
        .BRAM_Dout_A(ilmb_bram_ctrl_0_BRAM_PORT_DIN),
        .BRAM_EN_A(ilmb_bram_ctrl_0_BRAM_PORT_EN),
        .BRAM_Rst_A(ilmb_bram_ctrl_0_BRAM_PORT_RST),
        .BRAM_WEN_A(ilmb_bram_ctrl_0_BRAM_PORT_WE),
        .LMB1_ABus(Conn_ABUS),
        .LMB1_AddrStrobe(Conn_ADDRSTROBE),
        .LMB1_BE(Conn_BE),
        .LMB1_ReadStrobe(Conn_READSTROBE),
        .LMB1_WriteDBus(Conn_WRITEDBUS),
        .LMB1_WriteStrobe(Conn_WRITESTROBE),
        .LMB_ABus(Conn1_ABUS),
        .LMB_AddrStrobe(Conn1_ADDRSTROBE),
        .LMB_BE(Conn1_BE),
        .LMB_Clk(microblaze_0_clk),
        .LMB_ReadStrobe(Conn1_READSTROBE),
        .LMB_Rst(sys_rst),
        .LMB_WriteDBus(Conn1_WRITEDBUS),
        .LMB_WriteStrobe(Conn1_WRITESTROBE),
        .Sl1_CE(Conn_CE),
        .Sl1_DBus(Conn_READDBUS),
        .Sl1_Ready(Conn_READY),
        .Sl1_UE(Conn_UE),
        .Sl1_Wait(Conn_WAIT),
        .Sl_CE(Conn1_CE),
        .Sl_DBus(Conn1_READDBUS),
        .Sl_Ready(Conn1_READY),
        .Sl_UE(Conn1_UE),
        .Sl_Wait(Conn1_WAIT));
  jahwa_daq_system_lmb_bram_0_0 lmb_bram_0
       (.addra({ilmb_bram_ctrl_0_BRAM_PORT_ADDR[0],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[1],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[2],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[3],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[4],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[5],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[6],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[7],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[8],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[9],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[10],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[11],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[12],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[13],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[14],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[15],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[16],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[17],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[18],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[19],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[20],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[21],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[22],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[23],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[24],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[25],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[26],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[27],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[28],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[29],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[30],ilmb_bram_ctrl_0_BRAM_PORT_ADDR[31]}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,BRAM_PORTB_1_ADDR}),
        .clka(ilmb_bram_ctrl_0_BRAM_PORT_CLK),
        .clkb(BRAM_PORTB_1_CLK),
        .dina({ilmb_bram_ctrl_0_BRAM_PORT_DIN[0],ilmb_bram_ctrl_0_BRAM_PORT_DIN[1],ilmb_bram_ctrl_0_BRAM_PORT_DIN[2],ilmb_bram_ctrl_0_BRAM_PORT_DIN[3],ilmb_bram_ctrl_0_BRAM_PORT_DIN[4],ilmb_bram_ctrl_0_BRAM_PORT_DIN[5],ilmb_bram_ctrl_0_BRAM_PORT_DIN[6],ilmb_bram_ctrl_0_BRAM_PORT_DIN[7],ilmb_bram_ctrl_0_BRAM_PORT_DIN[8],ilmb_bram_ctrl_0_BRAM_PORT_DIN[9],ilmb_bram_ctrl_0_BRAM_PORT_DIN[10],ilmb_bram_ctrl_0_BRAM_PORT_DIN[11],ilmb_bram_ctrl_0_BRAM_PORT_DIN[12],ilmb_bram_ctrl_0_BRAM_PORT_DIN[13],ilmb_bram_ctrl_0_BRAM_PORT_DIN[14],ilmb_bram_ctrl_0_BRAM_PORT_DIN[15],ilmb_bram_ctrl_0_BRAM_PORT_DIN[16],ilmb_bram_ctrl_0_BRAM_PORT_DIN[17],ilmb_bram_ctrl_0_BRAM_PORT_DIN[18],ilmb_bram_ctrl_0_BRAM_PORT_DIN[19],ilmb_bram_ctrl_0_BRAM_PORT_DIN[20],ilmb_bram_ctrl_0_BRAM_PORT_DIN[21],ilmb_bram_ctrl_0_BRAM_PORT_DIN[22],ilmb_bram_ctrl_0_BRAM_PORT_DIN[23],ilmb_bram_ctrl_0_BRAM_PORT_DIN[24],ilmb_bram_ctrl_0_BRAM_PORT_DIN[25],ilmb_bram_ctrl_0_BRAM_PORT_DIN[26],ilmb_bram_ctrl_0_BRAM_PORT_DIN[27],ilmb_bram_ctrl_0_BRAM_PORT_DIN[28],ilmb_bram_ctrl_0_BRAM_PORT_DIN[29],ilmb_bram_ctrl_0_BRAM_PORT_DIN[30],ilmb_bram_ctrl_0_BRAM_PORT_DIN[31]}),
        .dinb(BRAM_PORTB_1_DIN),
        .douta(ilmb_bram_ctrl_0_BRAM_PORT_DOUT),
        .doutb(BRAM_PORTB_1_DOUT),
        .ena(ilmb_bram_ctrl_0_BRAM_PORT_EN),
        .enb(BRAM_PORTB_1_EN),
        .rsta(ilmb_bram_ctrl_0_BRAM_PORT_RST),
        .rstb(BRAM_PORTB_1_RST),
        .wea({ilmb_bram_ctrl_0_BRAM_PORT_WE[0],ilmb_bram_ctrl_0_BRAM_PORT_WE[1],ilmb_bram_ctrl_0_BRAM_PORT_WE[2],ilmb_bram_ctrl_0_BRAM_PORT_WE[3]}),
        .web(BRAM_PORTB_1_WE));
endmodule

module s00_couplers_imp_2NZU2K
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]s00_couplers_to_s00_couplers_ARADDR;
  wire [2:0]s00_couplers_to_s00_couplers_ARPROT;
  wire s00_couplers_to_s00_couplers_ARREADY;
  wire s00_couplers_to_s00_couplers_ARVALID;
  wire [31:0]s00_couplers_to_s00_couplers_AWADDR;
  wire [2:0]s00_couplers_to_s00_couplers_AWPROT;
  wire s00_couplers_to_s00_couplers_AWREADY;
  wire s00_couplers_to_s00_couplers_AWVALID;
  wire s00_couplers_to_s00_couplers_BREADY;
  wire [1:0]s00_couplers_to_s00_couplers_BRESP;
  wire s00_couplers_to_s00_couplers_BVALID;
  wire [31:0]s00_couplers_to_s00_couplers_RDATA;
  wire s00_couplers_to_s00_couplers_RREADY;
  wire [1:0]s00_couplers_to_s00_couplers_RRESP;
  wire s00_couplers_to_s00_couplers_RVALID;
  wire [31:0]s00_couplers_to_s00_couplers_WDATA;
  wire s00_couplers_to_s00_couplers_WREADY;
  wire [3:0]s00_couplers_to_s00_couplers_WSTRB;
  wire s00_couplers_to_s00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = s00_couplers_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = s00_couplers_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid = s00_couplers_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = s00_couplers_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = s00_couplers_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid = s00_couplers_to_s00_couplers_AWVALID;
  assign M_AXI_bready = s00_couplers_to_s00_couplers_BREADY;
  assign M_AXI_rready = s00_couplers_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = s00_couplers_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = s00_couplers_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = s00_couplers_to_s00_couplers_WVALID;
  assign S_AXI_arready = s00_couplers_to_s00_couplers_ARREADY;
  assign S_AXI_awready = s00_couplers_to_s00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = s00_couplers_to_s00_couplers_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_s00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_s00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = s00_couplers_to_s00_couplers_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_s00_couplers_RVALID;
  assign S_AXI_wready = s00_couplers_to_s00_couplers_WREADY;
  assign s00_couplers_to_s00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_s00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_s00_couplers_ARREADY = M_AXI_arready;
  assign s00_couplers_to_s00_couplers_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_s00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_s00_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_s00_couplers_AWREADY = M_AXI_awready;
  assign s00_couplers_to_s00_couplers_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_s00_couplers_BREADY = S_AXI_bready;
  assign s00_couplers_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign s00_couplers_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign s00_couplers_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign s00_couplers_to_s00_couplers_RREADY = S_AXI_rready;
  assign s00_couplers_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_couplers_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign s00_couplers_to_s00_couplers_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_s00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_s00_couplers_WVALID = S_AXI_wvalid;
endmodule

module s00_couplers_imp_BCGOZL
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wid,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [11:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output [0:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [11:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output [0:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [11:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [11:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [3:0]S_AXI_arlen;
  input [1:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [3:0]S_AXI_awlen;
  input [1:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input [11:0]S_AXI_wid;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_s00_couplers_ARADDR;
  wire [1:0]auto_pc_to_s00_couplers_ARBURST;
  wire [3:0]auto_pc_to_s00_couplers_ARCACHE;
  wire [11:0]auto_pc_to_s00_couplers_ARID;
  wire [7:0]auto_pc_to_s00_couplers_ARLEN;
  wire [0:0]auto_pc_to_s00_couplers_ARLOCK;
  wire [2:0]auto_pc_to_s00_couplers_ARPROT;
  wire [3:0]auto_pc_to_s00_couplers_ARQOS;
  wire auto_pc_to_s00_couplers_ARREADY;
  wire [2:0]auto_pc_to_s00_couplers_ARSIZE;
  wire auto_pc_to_s00_couplers_ARVALID;
  wire [31:0]auto_pc_to_s00_couplers_AWADDR;
  wire [1:0]auto_pc_to_s00_couplers_AWBURST;
  wire [3:0]auto_pc_to_s00_couplers_AWCACHE;
  wire [11:0]auto_pc_to_s00_couplers_AWID;
  wire [7:0]auto_pc_to_s00_couplers_AWLEN;
  wire [0:0]auto_pc_to_s00_couplers_AWLOCK;
  wire [2:0]auto_pc_to_s00_couplers_AWPROT;
  wire [3:0]auto_pc_to_s00_couplers_AWQOS;
  wire auto_pc_to_s00_couplers_AWREADY;
  wire [2:0]auto_pc_to_s00_couplers_AWSIZE;
  wire auto_pc_to_s00_couplers_AWVALID;
  wire [11:0]auto_pc_to_s00_couplers_BID;
  wire auto_pc_to_s00_couplers_BREADY;
  wire [1:0]auto_pc_to_s00_couplers_BRESP;
  wire auto_pc_to_s00_couplers_BVALID;
  wire [31:0]auto_pc_to_s00_couplers_RDATA;
  wire [11:0]auto_pc_to_s00_couplers_RID;
  wire auto_pc_to_s00_couplers_RLAST;
  wire auto_pc_to_s00_couplers_RREADY;
  wire [1:0]auto_pc_to_s00_couplers_RRESP;
  wire auto_pc_to_s00_couplers_RVALID;
  wire [31:0]auto_pc_to_s00_couplers_WDATA;
  wire auto_pc_to_s00_couplers_WLAST;
  wire auto_pc_to_s00_couplers_WREADY;
  wire [3:0]auto_pc_to_s00_couplers_WSTRB;
  wire auto_pc_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_auto_pc_ARADDR;
  wire [1:0]s00_couplers_to_auto_pc_ARBURST;
  wire [3:0]s00_couplers_to_auto_pc_ARCACHE;
  wire [11:0]s00_couplers_to_auto_pc_ARID;
  wire [3:0]s00_couplers_to_auto_pc_ARLEN;
  wire [1:0]s00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]s00_couplers_to_auto_pc_ARPROT;
  wire [3:0]s00_couplers_to_auto_pc_ARQOS;
  wire s00_couplers_to_auto_pc_ARREADY;
  wire [2:0]s00_couplers_to_auto_pc_ARSIZE;
  wire s00_couplers_to_auto_pc_ARVALID;
  wire [31:0]s00_couplers_to_auto_pc_AWADDR;
  wire [1:0]s00_couplers_to_auto_pc_AWBURST;
  wire [3:0]s00_couplers_to_auto_pc_AWCACHE;
  wire [11:0]s00_couplers_to_auto_pc_AWID;
  wire [3:0]s00_couplers_to_auto_pc_AWLEN;
  wire [1:0]s00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]s00_couplers_to_auto_pc_AWPROT;
  wire [3:0]s00_couplers_to_auto_pc_AWQOS;
  wire s00_couplers_to_auto_pc_AWREADY;
  wire [2:0]s00_couplers_to_auto_pc_AWSIZE;
  wire s00_couplers_to_auto_pc_AWVALID;
  wire [11:0]s00_couplers_to_auto_pc_BID;
  wire s00_couplers_to_auto_pc_BREADY;
  wire [1:0]s00_couplers_to_auto_pc_BRESP;
  wire s00_couplers_to_auto_pc_BVALID;
  wire [31:0]s00_couplers_to_auto_pc_RDATA;
  wire [11:0]s00_couplers_to_auto_pc_RID;
  wire s00_couplers_to_auto_pc_RLAST;
  wire s00_couplers_to_auto_pc_RREADY;
  wire [1:0]s00_couplers_to_auto_pc_RRESP;
  wire s00_couplers_to_auto_pc_RVALID;
  wire [31:0]s00_couplers_to_auto_pc_WDATA;
  wire [11:0]s00_couplers_to_auto_pc_WID;
  wire s00_couplers_to_auto_pc_WLAST;
  wire s00_couplers_to_auto_pc_WREADY;
  wire [3:0]s00_couplers_to_auto_pc_WSTRB;
  wire s00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_s00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = auto_pc_to_s00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = auto_pc_to_s00_couplers_ARCACHE;
  assign M_AXI_arid[11:0] = auto_pc_to_s00_couplers_ARID;
  assign M_AXI_arlen[7:0] = auto_pc_to_s00_couplers_ARLEN;
  assign M_AXI_arlock[0] = auto_pc_to_s00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = auto_pc_to_s00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = auto_pc_to_s00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = auto_pc_to_s00_couplers_ARSIZE;
  assign M_AXI_arvalid = auto_pc_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_s00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = auto_pc_to_s00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = auto_pc_to_s00_couplers_AWCACHE;
  assign M_AXI_awid[11:0] = auto_pc_to_s00_couplers_AWID;
  assign M_AXI_awlen[7:0] = auto_pc_to_s00_couplers_AWLEN;
  assign M_AXI_awlock[0] = auto_pc_to_s00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = auto_pc_to_s00_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = auto_pc_to_s00_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = auto_pc_to_s00_couplers_AWSIZE;
  assign M_AXI_awvalid = auto_pc_to_s00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_s00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_s00_couplers_WDATA;
  assign M_AXI_wlast = auto_pc_to_s00_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = auto_pc_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = s00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[11:0] = s00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[11:0] = s00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = s00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = s00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_s00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_s00_couplers_BID = M_AXI_bid[11:0];
  assign auto_pc_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_s00_couplers_RID = M_AXI_rid[11:0];
  assign auto_pc_to_s00_couplers_RLAST = M_AXI_rlast;
  assign auto_pc_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_pc_ARID = S_AXI_arid[11:0];
  assign s00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[3:0];
  assign s00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[1:0];
  assign s00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_auto_pc_AWID = S_AXI_awid[11:0];
  assign s00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[3:0];
  assign s00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[1:0];
  assign s00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign s00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign s00_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_auto_pc_WID = S_AXI_wid[11:0];
  assign s00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign s00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  jahwa_daq_system_auto_pc_1 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_s00_couplers_ARADDR),
        .m_axi_arburst(auto_pc_to_s00_couplers_ARBURST),
        .m_axi_arcache(auto_pc_to_s00_couplers_ARCACHE),
        .m_axi_arid(auto_pc_to_s00_couplers_ARID),
        .m_axi_arlen(auto_pc_to_s00_couplers_ARLEN),
        .m_axi_arlock(auto_pc_to_s00_couplers_ARLOCK),
        .m_axi_arprot(auto_pc_to_s00_couplers_ARPROT),
        .m_axi_arqos(auto_pc_to_s00_couplers_ARQOS),
        .m_axi_arready(auto_pc_to_s00_couplers_ARREADY),
        .m_axi_arsize(auto_pc_to_s00_couplers_ARSIZE),
        .m_axi_arvalid(auto_pc_to_s00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_s00_couplers_AWADDR),
        .m_axi_awburst(auto_pc_to_s00_couplers_AWBURST),
        .m_axi_awcache(auto_pc_to_s00_couplers_AWCACHE),
        .m_axi_awid(auto_pc_to_s00_couplers_AWID),
        .m_axi_awlen(auto_pc_to_s00_couplers_AWLEN),
        .m_axi_awlock(auto_pc_to_s00_couplers_AWLOCK),
        .m_axi_awprot(auto_pc_to_s00_couplers_AWPROT),
        .m_axi_awqos(auto_pc_to_s00_couplers_AWQOS),
        .m_axi_awready(auto_pc_to_s00_couplers_AWREADY),
        .m_axi_awsize(auto_pc_to_s00_couplers_AWSIZE),
        .m_axi_awvalid(auto_pc_to_s00_couplers_AWVALID),
        .m_axi_bid(auto_pc_to_s00_couplers_BID),
        .m_axi_bready(auto_pc_to_s00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_s00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_s00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_s00_couplers_RDATA),
        .m_axi_rid(auto_pc_to_s00_couplers_RID),
        .m_axi_rlast(auto_pc_to_s00_couplers_RLAST),
        .m_axi_rready(auto_pc_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_s00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_s00_couplers_WDATA),
        .m_axi_wlast(auto_pc_to_s00_couplers_WLAST),
        .m_axi_wready(auto_pc_to_s00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_s00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_s00_couplers_WVALID),
        .s_axi_araddr(s00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(s00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(s00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(s00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(s00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(s00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(s00_couplers_to_auto_pc_ARREADY),
        .s_axi_arsize(s00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(s00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(s00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(s00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(s00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(s00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(s00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(s00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(s00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(s00_couplers_to_auto_pc_AWREADY),
        .s_axi_awsize(s00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(s00_couplers_to_auto_pc_BID),
        .s_axi_bready(s00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(s00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(s00_couplers_to_auto_pc_RID),
        .s_axi_rlast(s00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(s00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(s00_couplers_to_auto_pc_WDATA),
        .s_axi_wid(s00_couplers_to_auto_pc_WID),
        .s_axi_wlast(s00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(s00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_pc_WVALID));
endmodule
