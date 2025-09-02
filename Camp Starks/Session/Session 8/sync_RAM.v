module sync_RAM (clk,rst,din,addr_wr,addr_rd,wr_en,rd_en,blk_sel,dout );
parameter MEM_WIDTH =16 ;
parameter MEM_DEPTH = 1024;
parameter ADRR_SIZE = 10;

input clk,rst,blk_sel,wr_en,rd_en;
input [ADRR_SIZE-1:0]addr_wr,addr_rd ;
input [MEM_WIDTH-1:0]din;

output reg [MEM_WIDTH-1:0] dout;

reg [MEM_WIDTH-1:0] MEM [MEM_DEPTH-1:0];
always @(posedge clk ) begin
    if (rst) begin
       dout<=0; 
    end
    else begin
        if (blk_sel) begin
            if (wr_en) begin
                MEM[addr_wr]<=din;
            end
            if (rd_en) begin
                dout <=MEM[addr_rd];
            end
        end
    end
end

endmodule //sync_RAM
