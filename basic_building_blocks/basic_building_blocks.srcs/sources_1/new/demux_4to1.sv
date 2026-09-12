`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2026 02:33:59
// Design Name: 
// Module Name: demux_4to1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module demux_4to1(
    input logic in_demux_data,
    input logic [1:0] in_demux_sel,
    output logic out_demux [3:0]
);
    assign out_demux[0] = !in_demux_sel[1] & !in_demux_sel[0]? in_demux_data : 1'b0;
    assign out_demux[1] = !in_demux_sel[1] & in_demux_sel[0]? in_demux_data : 1'b0;
    assign out_demux[2] = in_demux_sel[1] & !in_demux_sel[0]? in_demux_data : 1'b0;
    assign out_demux[3] = in_demux_sel[1] & in_demux_sel[0]? in_demux_data : 1'b0;
endmodule
