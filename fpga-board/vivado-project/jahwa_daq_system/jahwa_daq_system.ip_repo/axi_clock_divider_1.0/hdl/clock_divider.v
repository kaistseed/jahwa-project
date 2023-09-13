//*********************************************************************************
//                      [ MODULE ]                                                
//                                                                                
// Institution       : Korea Advanced Institute of Science and Technology         
// Engineer          : Dalta Imam Maulana                                         
//                                                                                
// Project Name      : Jahwa Data Acquisition System                                     
//                                                                                
// Create Date       : 05/30/2022
// File Name         : clock_divider.v                                           
// Module Dependency : -                                                          
//                                                                                
// Target Device     : Xilinx FPGA                                                     
// Tool Version      : Vivado 2020.2                                          
//                                                                                
// Description:                                                                   
//      This module is used to divide the clock frequency. It receives the clock
//      signal and the number of clock cycles to be divided. The output is the
//      divided clock signal.
//      For example, if the input clock is 100 MHz and I_DIV_FACTOR value is 10, the
//      output clock will be 10 MHz.
//       
//*********************************************************************************

module clock_divider
    //////////////////////////////////////////////////////////////////////
    //              Module Parameters and Ports Declaration             //
    //////////////////////////////////////////////////////////////////////
    (
        // Global control signals
        input wire I_CLK,
        input wire I_RSTn,

        // Input data
        input wire I_START,
        input wire [31:0] I_DIV_FACTOR,
        input wire [31:0] I_ACTIVE_COUNT,
        
        // Output clock
        output wire O_CLK_DIV,
        output wire [31:0] O_ACTIVE_COUNT
    );

    //////////////////////////////////////////////////////////////////////
    //                    Internal Register Declaration                 //
    //////////////////////////////////////////////////////////////////////
    reg r_clk_div;
    reg r_clk_div_out;
    reg [31:0] r_div_count;
    reg [31:0] r_active_count;

    //////////////////////////////////////////////////////////////////////
    //                            Main Logic                            //
    //////////////////////////////////////////////////////////////////////
    // Counter logic
    always @(posedge I_CLK or negedge I_RSTn or negedge I_START)
    begin
        if (!I_RSTn || !I_START)
        begin
            r_div_count <= 0;
        end
        else
        begin
            if (I_START)
            begin
                if (r_div_count < I_DIV_FACTOR-1)
                begin
                    r_div_count <= r_div_count + 1;
                end
                else
                begin
                    r_div_count <= 0;
                end
            end
            else
            begin
                r_div_count <= r_div_count;
            end
        end
    end

    // Clock divider logic
    always @(posedge I_CLK or negedge I_RSTn)
    begin
        if (!I_RSTn)
        begin
            r_clk_div <= 0;
        end
        else
        begin
            if (r_div_count <= (I_DIV_FACTOR/2)-1)
            begin
                r_clk_div <= 0;
            end
            else
            begin
                r_clk_div <= 1;
            end
        end
    end

    // Active count logic
    always @(posedge r_clk_div or negedge I_RSTn or negedge I_START)
    begin
        if (!I_RSTn || !I_START)
        begin
            r_active_count <= 0;
        end
        else
        begin
            if (I_START)
            begin
                if (r_active_count < I_ACTIVE_COUNT+1)
                begin
                    r_active_count <= r_active_count + 1;
                end
                else
                begin
                    r_active_count <= r_active_count;
                end
            end
            else
            begin
                r_active_count <= r_active_count;
            end
        end
    end

    // Generate clock divider output that is active when I_START is high
    always @(posedge I_CLK or negedge I_RSTn)
    begin
        if (!I_RSTn)
        begin
            r_clk_div_out <= 0;
        end
        else
        begin
            if (r_active_count < I_ACTIVE_COUNT+1)
            begin
                r_clk_div_out <= r_clk_div;
            end
            else
            begin
                r_clk_div_out <= 0;
            end
        end
    end

    assign O_CLK_DIV = r_clk_div_out & I_START;
    assign O_ACTIVE_COUNT = r_active_count;

endmodule
