`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 08.09.2026 16:38:02
// Design Name: 
// Module Name: top
// Project Name: Project4: Debouncing a Switch
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


module top(
    input logic top_in_clk_p, top_in_clk_n, top_in_rst,
    input logic top_in_sw1, top_in_sw0,
    output logic top_out_led1, top_out_led0
    );
    
    logic w_debounced_sw1, w_debounced_sw0;
    logic clk_10mhz;
    
    clk_wiz_0 inst_clk_gen (.clk_in1_p(top_in_clk_p), .clk_in1_n(top_in_clk_n), .reset(top_in_rst), 
        .locked(), .clk_out1(clk_10mhz));
    
    Debounce_Filter #(.DEBOUNCE_LIMIT(100000)) debounce_inst_10ms(.in_clk(clk_10mhz), 
        .in_bouncy(top_in_sw0), .out_debounced(w_debounced_sw0));
    
    Debounce_Filter #(.DEBOUNCE_LIMIT(200000)) debounce_inst_20ms(.in_clk(clk_10mhz), 
        .in_bouncy(top_in_sw1), .out_debounced(w_debounced_sw1));
    
    LED_Toggle led0_inst (.toggle_clk(clk_10mhz), .toggle_btn(w_debounced_sw0), .toggle_led(top_out_led0));
    
    LED_Toggle led1_inst (.toggle_clk(clk_10mhz), .toggle_btn(w_debounced_sw1), .toggle_led(top_out_led1));

endmodule
