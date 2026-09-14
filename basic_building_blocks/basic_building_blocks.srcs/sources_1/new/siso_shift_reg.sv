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


module siso_shift_reg(
    input logic in_clk, in_d,
    output logic out
);
    logic [3:0] r_reg;

    always_ff @(posedge in_clk) begin
        r_reg[0] <= in_d;
        r_reg[3:1] <= r_reg[2:0];
    end

    assign out_data = r_reg[3];

endmodule
