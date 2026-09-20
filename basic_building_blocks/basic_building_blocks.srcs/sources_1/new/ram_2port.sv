`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 20.09.2026 06:20:02
// Design Name: 
// Module Name: ram_2port
// Project Name: Basic Building Blocks
// Target Devices: ZYNQ Ultrascale+ MPSoC AUP-ZU3 4GB Development Board
// Tool Versions: 2025.2
// Description: Based on "Getting Started with FPGAs" by "Russel Merrick"
// assumes same clock for read and write operations, thereby no clock domain crossing
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ram_2port #(parameter WIDTH = 16, DEPTH = 256)(
    // write
    input logic in_wr_clk,
    input logic in_wr_valid,
    input logic [$clog2(DEPTH)-1:0] in_wr_addr,
    input logic [WIDTH-1:0] in_wr_d,
    //read
    input logic in_rd_clk, in_rd_en,
    input logic [$clog2(DEPTH)-1:0] in_rd_addr,
    output logic out_rd_valid,
    output logic [WIDTH-1:0] out_rd_d
);
    logic [WIDTH-1:0] r_mem [DEPTH-1:0];

    always_ff @(posedge in_wr_clk) begin
        if (in_wr_valid) begin
            r_mem[in_wr_addr] <= in_wr_d;
        end
    end
    
    always_ff @(posedge in_rd_clk) begin
        out_rd_valid <= in_rd_en;
        if (in_rd_en) begin 
            out_rd_d <= r_mem[in_rd_addr];
        end
    end

endmodule
