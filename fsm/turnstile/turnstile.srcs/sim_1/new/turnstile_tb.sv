`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 24.09.2026 04:03:26
// Design Name: 
// Module Name: turnstile_tb
// Project Name: turnstile_fsm
// Target Devices: ZYNQ Ultrascale+ MPSoC AUP-ZU3 4GB Development Board
// Tool Versions: 2025.2
// Description: Based on "Getting Started with FPGAs" by "Russel Merrick"
// 
// Dependencies: turnstile_fsm
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module turnstile_tb;     
    logic in_clk = 1'b0 , in_rst_n;
    logic in_coin = 1'b0, in_push = 1'b0;
    logic out_locked;
    
    always #5 in_clk = ~in_clk;
    
    turnstile_fsm uut_inst (.*);

    initial begin
        $monitor("| Time = %0t | p_state = %s | in_coin = %b | in_push %b | n_state = %s | op = %b |", 
                $time, uut_inst.r_curr_state, in_coin, in_push, uut_inst.r_next_state, out_locked);
        
        in_rst_n = 1'b0;
        #5;
        reset: 
            assert(uut_inst.r_curr_state == 0 && uut_inst.r_next_state == 0) 
            else $warning("reset: ps or ns not locked");
        #10; in_rst_n = 1'b1;

        @(posedge in_clk);

        @(posedge in_clk); in_coin = 1'b0; in_push = 1'b0;  //hold locked (ps)
        #2; 
        lock_00: 
            assert(uut_inst.r_curr_state == 0 && uut_inst.r_next_state == 0) 
            else $warning("lock_00: ps or ns not locked");

        @(posedge in_clk); in_coin = 1'b0; in_push = 1'b1;  //hold locked (ps)
        #2;
        lock_01: 
            assert(uut_inst.r_curr_state == 0 && uut_inst.r_next_state == 0) 
            else $warning("lock_01: ps or ns not locked");

        @(posedge in_clk); in_coin = 1'b1; in_push = 1'b0;  //locked -> unlocked
        #2;
        lock_10: 
            assert(uut_inst.r_curr_state == 0 && uut_inst.r_next_state == 1) 
            else $warning("lock_10: ps not locked or ns not unlocked");
        
        @(posedge in_clk); in_coin = 1'b0; in_push = 1'b0;  //hold unlocked (ps)
        #2;
        unlock_00: 
            assert(uut_inst.r_curr_state == 1 && uut_inst.r_next_state == 1) 
            else $warning("unlock_00: ps or ns not unlocked");
        
        @(posedge in_clk); in_coin = 1'b1; in_push = 1'b0;  //hold unlocked (ps)
        #2;
        unlock_10: 
            assert(uut_inst.r_curr_state == 1 && uut_inst.r_next_state == 1) 
            else $warning("unlock_10: ps or ns not unlocked");

        @(posedge in_clk); in_coin = 1'b0; in_push = 1'b1;  //unlocked -> locked
        #2;
        unlock_01:
            assert(uut_inst.r_curr_state == 1 && uut_inst.r_next_state == 0) 
            else $warning("unlock_01: ps not unlocked or ns not locked");
        
        @(posedge in_clk); in_coin = 1'b1; in_push = 1'b1;  //locked -> unlocked (toggling state)
        #2;
        lock_11:
            assert(uut_inst.r_curr_state == 0 && uut_inst.r_next_state == 1) 
            else $warning("lock_11: ps not locked or ns not unlocked");
        
        @(posedge in_clk); // unlocked -> locked (toggling state)
        #2;
        unlock_11:
            assert(uut_inst.r_curr_state == 1 && uut_inst.r_next_state == 0) 
            else $warning("unlock_11: ps not unlocked or ns not locked");

        @(posedge in_clk); in_coin = 1'b0; in_push = 1'b0;  //hold locked
        #2;
        end_hold_00:
            assert(uut_inst.r_curr_state == 0 && uut_inst.r_next_state == 0) 
            else $warning("end_hold_00: ps or ns not locked");
        
        repeat(2); @(posedge in_clk);
        #2; $finish;
    end

endmodule
