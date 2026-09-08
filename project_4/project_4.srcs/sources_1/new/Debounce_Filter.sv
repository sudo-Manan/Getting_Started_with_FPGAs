`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 08.09.2026 16:29:55
// Design Name: 
// Module Name: Debounce_Filter
// Project Name: Project4: Debouncing a Switch
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


module Debounce_Filter #(parameter DEBOUNCE_LIMIT=20)(
    input logic in_clk, in_bouncy,
    output logic out_debounced
);
    
    logic [$clog2(DEBOUNCE_LIMIT)-1:0] r_count = 0;
    logic r_state = 1'b0;
    
    always_ff @(posedge in_clk) begin
        if (in_bouncy != r_state && r_count < DEBOUNCE_LIMIT-1) r_count <= r_count + 1;
        else if (r_count == DEBOUNCE_LIMIT - 1) begin
            r_state <= in_bouncy;
            r_count <= 0;
        end
        else r_count <= 0;
    end
    
    assign out_debounced = r_state;
    
endmodule
