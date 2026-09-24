`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2026 04:35:42
// Design Name: 
// Module Name: turnstile_fsm
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


module turnstile_fsm(
    input logic in_clk, in_rst_n,
    input logic in_coin, in_push,
    output logic out_locked
    );

    typedef enum logic {
        locked = 1'b0, unlocked = 1'b1
    } state_t;

    state_t r_curr_state;
    
    always_ff @(posedge in_clk or negedge in_rst_n) begin
        if (!in_rst_n)
            r_curr_state <= locked;
        else begin
            case (r_curr_state)
                locked:
                    if(in_coin) r_curr_state <= unlocked;
                unlocked:
                    if(in_push) r_curr_state <= locked;
            endcase
        end
    end

    assign out_locked = (r_curr_state == locked);
    
endmodule
