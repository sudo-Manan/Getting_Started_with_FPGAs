`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.09.2026 23:05:15
// Design Name: 
// Module Name: led_toggle_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// `
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// have to manually run for 30 micro seconds for the clock to stabalize and be locked
module led_toggle_tb;
    logic tb_clk_n, tb_clk_p = 1'b0, tb_rst;
    logic tb_btn = 1'b0, tb_led;

    assign tb_clk_n = ~tb_clk_p;
    always begin
        #5 tb_clk_p = ~tb_clk_p;
    end

    top uut_toggle_led_inst (.clk_p(tb_clk_p), .clk_n(tb_clk_n),
             .rst(tb_rst),
             .i_btn(tb_btn), .o_led(tb_led));
    
    initial begin
        $display("| tb_btn | tb_led |");
        $monitor("|   %b   |   %b   |",tb_btn, tb_led);
        tb_rst = 1'b1;
        repeat(20) @(posedge tb_clk_p);
        @(posedge tb_clk_p); tb_rst = 1'b0;
        wait(uut_toggle_led_inst.clk_lock == 1'b1);
        @(posedge uut_toggle_led_inst.clk_10mhz);
        
        @(posedge uut_toggle_led_inst.clk_10mhz); tb_btn = 1'b1;
        @(posedge uut_toggle_led_inst.clk_10mhz); tb_btn = 1'b0;
        
        @(posedge uut_toggle_led_inst.clk_10mhz); tb_btn = 1'b1;
        @(posedge uut_toggle_led_inst.clk_10mhz); tb_btn = 1'b0;
        
        @(posedge uut_toggle_led_inst.clk_10mhz); tb_btn = 1'b1;
        @(posedge uut_toggle_led_inst.clk_10mhz); tb_btn = 1'b0;
        #100;
        @(posedge uut_toggle_led_inst.clk_10mhz); tb_btn = 1'b1;
        @(posedge uut_toggle_led_inst.clk_10mhz); tb_btn = 1'b0;
        
        @(posedge uut_toggle_led_inst.clk_10mhz); tb_btn = 1'b1;
        @(posedge uut_toggle_led_inst.clk_10mhz); tb_btn = 1'b0;
        
        @(posedge uut_toggle_led_inst.clk_10mhz); tb_btn = 1'b1;
        @(posedge uut_toggle_led_inst.clk_10mhz); tb_btn = 1'b0;
        @(posedge uut_toggle_led_inst.clk_10mhz)
        @(posedge uut_toggle_led_inst.clk_10mhz); $finish;
    end

endmodule
