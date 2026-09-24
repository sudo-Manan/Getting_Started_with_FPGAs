`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2026 04:45:47
// Design Name: 
// Module Name: turnstile_tb
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


module turnstile_tb;

    logic in_clk = 1'b0, in_rst_n = 1'b0, in_coin = 1'b0, in_push = 1'b0;
    logic out_locked;

    turnstile_fsm dut_inst (.*);

    always #1 in_clk = ~in_clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;

        #10; in_rst_n = 1'b1;

        #10; assert (out_locked == 1'b1);

        in_coin = 1'b1;
        #10; assert(out_locked == 1'b0);

        in_push = 1'b1;
        #10; assert(out_locked == 1'b1);

        in_coin = 1'b0;
        #10; assert(out_locked == 1'b1);

        in_push = 1'b0;
        #10; assert(out_locked == 1'b1);

        #10; $finish;
    end

endmodule
