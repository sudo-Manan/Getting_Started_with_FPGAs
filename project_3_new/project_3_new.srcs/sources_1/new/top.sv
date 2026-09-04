`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2026 13:49:21
// Design Name: LED_Toggle
// Module Name: top
// Project Name: Project3: Blinking an LED
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
    input logic clk_p, clk_n, rst, 
    input logic i_btn,
    output logic o_led);
    
    logic clk_10mhz, clk_lock;
    
    clk_wiz_0 inst_clk_gen (.clk_in1_p(clk_p), .clk_in1_n(clk_n), .reset(rst), 
            .locked(clk_lock), .clk_out1(clk_10mhz));
    LED_Toggle inst_led_toggle (.clk_10mhz(clk_10mhz), .i_btn(i_btn && clk_lock), .o_led(o_led));
    
endmodule
