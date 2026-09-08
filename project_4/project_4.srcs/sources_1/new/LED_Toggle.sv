`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 08.09.2026 16:19:19
// Design Name: 
// Module Name: LED_Toggle
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


module LED_Toggle(
    input logic toggle_clk, toggle_btn,
    output logic toggle_led);
    
    logic r_btn, r_led;
    
    always_ff @(posedge toggle_clk) begin
        r_btn <= toggle_btn;
        if (!toggle_btn && r_btn) r_led <= ~r_led;
    end
    
    assign toggle_led = r_led;
    
endmodule
