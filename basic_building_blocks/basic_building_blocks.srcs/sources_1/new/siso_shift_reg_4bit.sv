`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 13.09.2026 03:00:53
// Design Name: 
// Module Name: siso_shift_reg_4bit
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


module siso_shift_reg_4bit(
    input logic in_clk, in_data,
    output logic out_data
    );
    logic [3:0] r_shift;
    always_ff @(posedge in_clk) begin
        r_shift[3:1] <= r_shift[2:0];
        r_shift[0] <= in_data;
    end
    assign out_data = r_shift[3];
endmodule
