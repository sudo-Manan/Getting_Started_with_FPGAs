`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2026 13:37:04
// Design Name: LED_Toggle
// Module Name: LED_Toggle
// Project Name: Project3: Blinking an LED
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


module LED_Toggle(
    input logic clk_10mhz, i_btn,
    output logic o_led);
    
    logic r_btn, r_led;
    
    always_ff @(posedge clk_10mhz) begin
        r_btn <= i_btn;
        if (!i_btn && r_btn) r_led <= ~r_led;
    end
    
    assign o_led = r_led;
    
endmodule
