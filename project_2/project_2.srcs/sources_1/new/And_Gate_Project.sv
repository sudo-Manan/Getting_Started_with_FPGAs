`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NA
// Engineer: Manan Jain
// 
// Create Date: 02.09.2026 07:30:41
// Design Name: And_Gate_Project
// Module Name: And_Gate_Project
// Project Name: Project2: Lighting an LED with Logic Gates
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


module And_Gate_Project(
    input logic i_sw0, i_sw1,
    output logic o_and, o_xor);
    
    assign o_and = i_sw0 & i_sw1;
    assign o_xor = i_sw0 ^ i_sw1;
    
endmodule
