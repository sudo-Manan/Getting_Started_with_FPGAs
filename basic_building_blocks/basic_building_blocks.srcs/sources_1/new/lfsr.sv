`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 14.09.2026 16:35:29
// Design Name: 
// Module Name: lfsr
// Project Name: Basic Building Blocks
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


module lfsr(
    input logic in_clk,
    output logic [2:0] out
);    
    logic w_xnor;
    
    always_ff @(posedge in_clk) out <= {out[1:0], w_xnor};
    assign w_xnor = ~(out[2] ^ out[1]);
    
endmodule
