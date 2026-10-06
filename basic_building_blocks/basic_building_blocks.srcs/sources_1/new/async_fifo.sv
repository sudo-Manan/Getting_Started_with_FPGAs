`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 28.09.2026 01:35:21
// Design Name: 
// Module Name: async_fifo
// Project Name: Basic Building Blocks
// Target Devices: ZYNQ Ultrascale+ MPSoC AUP-ZU3 4GB Development Board
// Tool Versions: 2025.2
// Description:
// asynchronous fifo
// Parameters: 
// WIDTH - Width of the FIFO
// DEPTH - Max number of items able to be stored in the FIFO
// iterated from a block level based approach to a counter based design to 
// the current design (will be testing, updating, and improving it further)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// DEPTH must be a power of 2. Gray-code full/empty detection is only else the design will not infer properly
module async_fifo #(parameter WIDTH = 8, DEPTH = 64) (
    //write
    input logic wr_clk, wr_rst_n,
    input logic in_wr_en,
    input logic [WIDTH-1:0] in_wr_data,
    output logic out_full,
    //read
    input logic rd_clk, rd_rst_n,
    input logic in_rd_en,
    output logic [WIDTH-1:0] out_rd_data,
    output logic out_rd_valid, out_empty
);
    localparam ADDR_WIDTH = $clog2(DEPTH);

    logic [WIDTH-1:0] r_mem [DEPTH-1:0];

    logic [ADDR_WIDTH:0] wr_ptr_bin, wr_ptr_gray;
    logic [ADDR_WIDTH:0] rd_ptr_bin, rd_ptr_gray;

    logic [ADDR_WIDTH:0] r1_wr_ptr_gray, r2_wr_ptr_gray;
    logic [ADDR_WIDTH:0] r1_rd_ptr_gray, r2_rd_ptr_gray;

    //write
    // RAM bloack without reset
    always_ff @(posedge wr_clk) begin
        if (in_wr_en && !out_full)
            r_mem[wr_ptr_bin[ADDR_WIDTH-1:0]] <= in_wr_data;
    end
    // wr_ptr_bin updated in the other block on same posedge wr_clk
    
    always_ff @(posedge wr_clk or negedge wr_rst_n) begin
        if (!wr_rst_n) begin
            wr_ptr_bin <= 0;
            wr_ptr_gray <= 0;
            r1_rd_ptr_gray <= 0;
            r2_rd_ptr_gray <= 0;
        end
        else begin
            if (in_wr_en && !out_full) begin       
                wr_ptr_bin <= wr_ptr_bin + 1;
                wr_ptr_gray <= (wr_ptr_bin + 1) ^ ((wr_ptr_bin + 1) >> 1);
            end
            r1_rd_ptr_gray <= rd_ptr_gray;
            r2_rd_ptr_gray <= r1_rd_ptr_gray;
        end
    end

    //read
    always_ff @(posedge rd_clk) begin
        if (in_rd_en && !out_empty)
            out_rd_data <= r_mem[rd_ptr_bin[ADDR_WIDTH-1:0]];
    end
    // rd_ptr_bin updated in the other block on same posedge rd_clk

    always_ff @(posedge rd_clk or negedge rd_rst_n) begin
        if(!rd_rst_n) begin
            rd_ptr_bin <= 0;
            rd_ptr_gray <= 0;
            r1_wr_ptr_gray <= 0;
            r2_wr_ptr_gray <= 0;
            out_rd_valid <= 0;  // not resetting the data output as the output data will be considered invalid
        end
        else begin
            out_rd_valid <= in_rd_en && !out_empty;
            if (in_rd_en && !out_empty) begin
                rd_ptr_bin <= rd_ptr_bin + 1;
                rd_ptr_gray <= (rd_ptr_bin + 1) ^ ((rd_ptr_bin + 1) >> 1);
            end
            r1_wr_ptr_gray <= wr_ptr_gray;
            r2_wr_ptr_gray <= r1_wr_ptr_gray;
        end
    end 
    
    assign out_full = (wr_ptr_gray[ADDR_WIDTH] != r2_rd_ptr_gray[ADDR_WIDTH]) && 
        (wr_ptr_gray[ADDR_WIDTH-1] != r2_rd_ptr_gray[ADDR_WIDTH-1]) && 
        (wr_ptr_gray[ADDR_WIDTH-2:0] == r2_rd_ptr_gray[ADDR_WIDTH-2:0]);
    
    assign out_empty = (rd_ptr_gray == r2_wr_ptr_gray);

endmodule
