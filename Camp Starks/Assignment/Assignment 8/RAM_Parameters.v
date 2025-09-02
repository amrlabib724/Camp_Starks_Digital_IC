module RAM_Parameters (
    din,addr,wr_en,rd_en,blk_sel,adder_en,dout_en,clk,rst,dout,parity_out
);
    parameter MEM_WIDTH = 16;
    parameter MEM_DEPTH = 1024;
    parameter ADDR_SIZE = 10;
    parameter ADDER_PIPELINE = 0;
    parameter DOUT_PIPELINE = 1;
    parameter PARITY_ENABLE = 1;

    input  [MEM_WIDTH-1:0] din;
    input  [ADDR_SIZE-1:0] addr;
    input  wr_en, rd_en, blk_sel, adder_en, dout_en, clk, rst;

    output reg [MEM_WIDTH-1:0] dout;
    output reg parity_out;

    reg [MEM_WIDTH-1:0] MEM [0:MEM_DEPTH-1];

    reg [ADDR_SIZE-1:0] addr_pipe;
    reg [ADDR_SIZE-1:0] addr_direct;
    reg [MEM_WIDTH-1:0] dout_pipe;
    reg [MEM_WIDTH-1:0] dout_direct;

    // Address pipeline logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            addr_pipe <= 0;
            addr_direct <= 0;
        end else if (ADDER_PIPELINE && adder_en) begin
            addr_pipe <= addr;
            addr_direct <= addr_pipe;
        end else begin
            addr_direct <= addr;
        end
    end

    // Memory read/write logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            dout_direct <= 0;
        end else if (blk_sel) begin
            if (wr_en)
                MEM[addr_direct] <= din;
            if (rd_en)
                dout_direct <= MEM[addr_direct];
        end
    end

    // Output pipeline logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            dout_pipe <= 0;
            dout <= 0;
        end else if (DOUT_PIPELINE && dout_en) begin
            dout_pipe <= dout_direct;
            dout <= dout_pipe;
        end else begin
            dout <= dout_direct;
        end
    end

    // Parity logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            parity_out <= 0;
        end else if (PARITY_ENABLE) begin
            parity_out <= ^dout;
        end else begin
            parity_out <= 0;
        end
    end

endmodule//RAM Parameters



