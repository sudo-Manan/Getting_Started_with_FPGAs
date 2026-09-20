`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 20.09.2026 05:26:40
// Design Name: 
// Module Name: param_up_counter
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


module param_up_counter #(parameter N = 10)(
    input logic in_clk, in_rst_n,
    output logic [$clog2(N+1) - 1:0] out_count
);
    
    always_ff @(posedge in_clk) begin
        if (!in_rst_n) begin
            out_count <= '0;
        end
        else if (out_count == N) begin
            out_count <= '0;
        end
        else begin
            out_count <= out_count + 1;
        end
    end

endmodule
