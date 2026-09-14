`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 13.09.2026 02:33:59
// Design Name: 
// Module Name: demux_4to1
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


module demux_4to1(
    input logic in_d,
    input logic [1:0] in_sel,
    output logic out3, out2, out1, out0
);
    always_comb begin
        {out3, out2, out1, out0} = 4'b0;
        case (in_sel)
            2'b00: out0 = in_d;
            2'b01: out1 = in_d;
            2'b10: out2 = in_d;
            2'b11:  out3 = in_d;
        endcase
    end
endmodule
