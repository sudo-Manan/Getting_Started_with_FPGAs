`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 24.09.2026 04:01:17
// Design Name: 
// Module Name: turnstile_fsm
// Project Name: turnstile_fsm
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


//moore_fsm
module turnstile_fsm(
    input logic in_clk, in_rst_n,
    input logic in_coin, in_push,
    output logic out_locked
    );

    typedef enum logic {
        locked = 1'b0, unlocked = 1'b1
    } state_t;

    state_t r_curr_state, r_next_state;

    always_ff @(posedge in_clk or negedge in_rst_n) begin
        if(!in_rst_n) 
            r_curr_state <= locked;
        else 
            r_curr_state <= r_next_state;
    end

    always_comb begin
        r_next_state = r_curr_state;
        case (r_curr_state)
            locked:
                if (in_coin) 
                    r_next_state = unlocked;
            unlocked: 
                if (in_push)
                    r_next_state = locked;
        endcase
    end

    assign out_locked = r_curr_state ~^ locked;

endmodule
