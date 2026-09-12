`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2026 18:34:18
// Design Name: 
// Module Name: Debounce_Filter_tb
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


module Debounce_Filter_tb;
    logic r_clk = 1'b1, r_bouncy = 1'b0;
    logic w_debounced;
    
    always #2 r_clk = ~r_clk;
    
    Debounce_Filter #( .DEBOUNCE_LIMIT(4) ) uut (.in_clk(r_clk), .in_bouncy(r_bouncy), .out_debounced(w_debounced));
    
    initial begin
        repeat(3) @(posedge r_clk);
        @(posedge r_clk); r_bouncy = 1'b1;
        
        @(posedge r_clk); r_bouncy = 1'b0;
         
        @(posedge r_clk); r_bouncy = 1'b1;
        repeat(6) @(posedge r_clk);  
        @(posedge r_clk); r_bouncy = 1'b0;
        repeat(6) @(posedge r_clk);       
        $display("Test Complete!");
        
        $finish;
    end
    
endmodule
