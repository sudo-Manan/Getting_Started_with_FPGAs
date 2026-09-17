`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 16.09.2026 23:34:20
// Design Name: 
// Module Name: demux_lfsr_project_top
// Project Name: Project5: Selectively Blinking an LED
// Target Devices: ZYNQ Ultrascale+ MPSoC AUP-ZU3 4GB Development Board
// Tool Versions: 2025.2
// Description: Based on "Getting Started with FPGAs" by "Russel Merrick"
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module demux_lfsr_project_top(
    input logic sys_clk_p, sys_clk_n,
    input logic in_sw1, in_sw0,
    output logic out_led3, out_led2, out_led1, out_led0
    );
    
    logic r_lfsr_toggle = 1'b0;
    logic w_lfsr_done;
    logic clk_100mhz, clk_p_100mhz;
    
    IBUFDS IBUFDS_inst (
      .O(clk_p_100mhz),   // 1-bit output: Buffer output
      .I(sys_clk_p),   // 1-bit input: Diff_p buffer input (connect directly to top-level port)
      .IB(sys_clk_n)  // 1-bit input: Diff_n buffer input (connect directly to top-level port)
    );
    
    BUFG BUFG_inst (
      .O(clk_100mhz), // 1-bit output: Clock output.
      .I(clk_p_100mhz)  // 1-bit input: Clock input.
    );
    
    lfsr_24 lfsr_inst (.in_clk(clk_100mhz),
      .out_lfsr_data(),
      .out_lfsr_done(w_lfsr_done)
    );
    
    always_ff @(posedge clk_100mhz) begin
        if (w_lfsr_done) r_lfsr_toggle <= !r_lfsr_toggle;
    end
    
    demux_1to4 demux_inst(.in_d(r_lfsr_toggle),
      .in_sel1(in_sw1), .in_sel0(in_sw0),
      .out_d3(out_led3), .out_d2(out_led2), 
      .out_d1(out_led1), .out_d0(out_led0)
    );
    
endmodule
