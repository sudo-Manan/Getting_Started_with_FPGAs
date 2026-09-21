`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2026 06:21:25
// Design Name: 
// Module Name: fifo
// Project Name: Basic Building Blocks
// Target Devices: ZYNQ Ultrascale+ MPSoC AUP-ZU3 4GB Development Board
// Tool Versions: 2025.2
// Description: Based on "Getting Started with FPGAs" by "Russel Merrick"
// synchronous fifo
// Parameters: 
// WIDTH - Width of the FIFO
// DEPTH - Max number of items able to be stored in the FIFO
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sync_fifo #(parameter WIDTH = 8, DEPTH = 256) (
    input logic in_clk, in_rst_n,
    // write
    input logic in_wr_en, 
    input logic [WIDTH-1:0] in_wr_data,
    output logic out_full,
    // read
    input logic in_rd_en,
    output logic [WIDTH-1:0] out_rd_data,
    output logic out_rd_valid, out_empty
);

    logic [WIDTH-1:0] r_mem [DEPTH-1:0];
    logic [$clog2(DEPTH)-1:0] wr_ptr, rd_ptr;
    logic [$clog2(DEPTH):0] r_count;

    always_ff @(posedge in_clk) begin
        if (in_wr_en && !out_full) begin
            r_mem[wr_ptr] <= in_wr_data;
        end
    end

    always_ff @(posedge in_clk) begin
        if (!in_rst_n) begin
            out_rd_valid <= 0;
            out_rd_data <= '0;
        end
        else begin
            out_rd_valid <= in_rd_en && !out_empty;
            if (in_rd_en && !out_empty) begin
                out_rd_data <= r_mem[rd_ptr];
            end
        end
    end

    always_ff @(posedge in_clk) begin
        if (!in_rst_n) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
        end
        else begin
            if (in_wr_en && !out_full) begin
                if (wr_ptr == DEPTH-1) wr_ptr <= 0;
                else wr_ptr <= wr_ptr + 1;
            end
            if (in_rd_en && !out_empty) begin
                if (rd_ptr == DEPTH - 1) rd_ptr <= 0;
                else rd_ptr <= rd_ptr + 1;
            end
        end
    end

    always_ff @(posedge in_clk) begin
        if(!in_rst_n) r_count <= 0;
        else begin
            case ({(in_rd_en && !out_empty), (in_wr_en && !out_full)}) 
                2'b01: r_count <= r_count + 1;
                2'b10: r_count <= r_count - 1;
                default: r_count <= r_count;
            endcase
        end
    end
    
    assign out_full = (r_count == DEPTH);
    assign out_empty = (r_count == '0);

endmodule