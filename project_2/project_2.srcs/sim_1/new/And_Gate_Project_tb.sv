`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2026 04:55:10
// Design Name: 
// Module Name: And_Gate_Project_tb
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


module And_Gate_Project_tb;
    logic i_sw0, i_sw1;
    logic o_and, o_xor;
    
    And_Gate_Project uut (i_sw0, i_sw1, o_and, o_xor);
    
    initial begin
        $monitor("| in1 = %0b | in2 = %0b | and = %0b | xor = %0b |", i_sw0, i_sw1, o_and, o_xor);
        #10; i_sw0 = 1'b0; i_sw1 = 1'b0;
        #10; i_sw0 = 1'b1; i_sw1 = 1'b0;
        #10; i_sw0 = 1'b1; i_sw1 = 1'b1;
        #10; i_sw0 = 1'b0; i_sw1 = 1'b1;
        #10; $finish;
    end
    
endmodule
