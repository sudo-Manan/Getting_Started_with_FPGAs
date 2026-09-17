`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 16.09.2026 23:06:47
// Design Name: 
// Module Name: demux_1to4
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


module demux_1to4(
    input logic in_d,
    input logic in_sel1, in_sel0,
    output logic out_d3, out_d2, out_d1, out_d0
);
    
    assign out_d0 = (in_sel1 ~^ in_sel0) & in_d;
    assign out_d1 = (!in_sel1 & in_sel0) & in_d;
    assign out_d2 = (in_sel1 & !in_sel0) & in_d;
    assign out_d3 = (in_sel1 & in_sel0) & in_d;

endmodule
