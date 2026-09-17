`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 16.09.2026 23:26:10
// Design Name: 
// Module Name: lfsr_24
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


module lfsr_24(
    input logic in_clk,
    output logic [23:0] out_lfsr_data,
    output logic out_lfsr_done
);
    logic [23:0] r_lfsr;
    logic w_xnor;
    
    always_ff @(posedge in_clk) r_lfsr <= {r_lfsr[22:0], w_xnor};
    
    assign w_xnor = r_lfsr[23] ~^ r_lfsr[22];
    assign out_lfsr_done = (r_lfsr == 24'b0);
    assign out_lfsr_data = r_lfsr;
    
endmodule
