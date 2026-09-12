`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 13.09.2026 02:33:00
// Design Name: 
// Module Name: mux_4to1
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


module mux_4to1(
    input logic in_mux_data [3:0],
    input logic [1:0] in_mux_sel,
    output logic out_mux
);
    always_comb begin
        case (in_mux_sel)
            2'd0: out_mux = in_mux_data [0];
            2'd1: out_mux = in_mux_data [1];
            2'd2: out_mux = in_mux_data [2];
            2'd3: out_mux = in_mux_data [3];
            default: out_mux = 1'b0;
        endcase
    end
endmodule
