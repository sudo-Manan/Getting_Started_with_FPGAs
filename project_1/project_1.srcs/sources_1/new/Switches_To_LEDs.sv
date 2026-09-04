`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NA
// Engineer: Manan Jain
// 
// Create Date: 02.09.2026 00:25:58
// Design Name: Switches_To_LEDs
// Module Name: Switches_To_LEDs
// Project Name: Project1: Wiring Switches to LEDs 
// Target Devices: ZYNQ Ultrascale+ MPSoC AUP-ZU3 4GB Development Board
// Tool Versions: 2025.2
// Description: Based on "Getting Started with FPGAs" by "Russel Merrick" 
// 
// Dependencies: NA
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Switches_To_LEDs(
    input logic i_sw0, i_sw1, i_sw2, i_sw3,
    output logic o_led0, o_led1, o_led2, o_led3);
    
    assign {o_led3, o_led2, o_led1, o_led0}  = {i_sw3, i_sw2, i_sw1, i_sw0};
    
endmodule
