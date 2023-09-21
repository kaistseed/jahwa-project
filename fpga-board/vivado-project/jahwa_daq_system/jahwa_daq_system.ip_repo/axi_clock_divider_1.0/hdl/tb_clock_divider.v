`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2023 01:16:10 PM
// Design Name: 
// Module Name: tb_clock_divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_clock_divider;
    //////////////////////////////////////////////////////////////////////
    //                       Localparams Declaration                    //
    //////////////////////////////////////////////////////////////////////
    // Global parameters
    localparam CLK_PERIOD = 10; // 100 MHz
    
    //////////////////////////////////////////////////////////////////////
    //               Internal Wire and Register Declaration             //
    //////////////////////////////////////////////////////////////////////
    // Global control signals
    reg r_clk;
    reg r_rstn;

    // Input data
    reg r_start;
    reg [31:0] r_div_factor;
    reg [31:0] r_active_count;

    // Output clock
    wire w_clk_div;

    //////////////////////////////////////////////////////////////////////
    //                            Main Logic                            //
    //////////////////////////////////////////////////////////////////////
    // Generate clock
    always
    begin
        #(CLK_PERIOD/2);
        r_clk = ~r_clk;
    end

    // Reset logic
    initial
    begin
        // Reset signal
        #(CLK_PERIOD);
        r_rstn = 0;
        #(CLK_PERIOD);
        r_rstn = 1;
    end

    // Module instantiation
    clock_divider clock_divider_inst
    (
        // Global control signals
        .I_CLK(r_clk),
        .I_RSTn(r_rstn),

        // Input data
        .I_START(r_start),
        .I_DIV_FACTOR(r_div_factor),
        .I_ACTIVE_COUNT(r_active_count),
        
        // Output clock
        .O_CLK_DIV(w_clk_div)
    );

    // Testbench logic
    initial
    begin
        // Initialize internal registers
        r_clk = 0;
        r_rstn = 1;
        r_start = 0;
        r_div_factor = 0;
        r_active_count = 0;

        // Wait for 10 clock cycles
        #(CLK_PERIOD*10);

        // Set the number of clock cycles to be divided
        #(CLK_PERIOD/2);
        r_div_factor = 2;
        r_active_count = 4;
        #(CLK_PERIOD);
        r_start = 1;

        // Wait for 20 clock cycles
        #(CLK_PERIOD*20);
        r_start = 0;

        // Set the number of clock cycles to be divided
        #(CLK_PERIOD/2);
        r_div_factor = 4;
        r_active_count = 10;
        #(CLK_PERIOD);
        r_start = 1;

        // Wait for 100 clock cycles
        #(CLK_PERIOD*60);
        r_start = 0;

        // Set the number of clock cycles to be divided
        #(CLK_PERIOD/2);
        r_div_factor = 8;
        r_active_count = 10;
        #(CLK_PERIOD);
        r_start = 1;

        // Wait for 100 clock cycles
        #(CLK_PERIOD*120);
        r_start = 0;

        // Finish the simulation
        $finish();
    end

endmodule
