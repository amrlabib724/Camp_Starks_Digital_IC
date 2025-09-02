module sync_RAM_testbench();
parameter MEM_WIDTH =16 ;
parameter MEM_DEPTH = 1024;
parameter ADRR_SIZE = 10;

reg clk,rst,blk_sel,wr_en,rd_en;
reg [ADRR_SIZE-1:0]addr_wr,addr_rd ;
reg [MEM_WIDTH-1:0]din;

wire  [MEM_WIDTH-1:0] dout;

integer i;

sync_RAM #(MEM_WIDTH,MEM_DEPTH,ADRR_SIZE) dut(clk,rst,din,addr_wr,addr_rd,wr_en,rd_en,blk_sel,dout);
initial begin
    clk =0;
    forever #10 clk=~clk;
end
initial begin
    $readmemh ("mem.dat",dut.MEM);
    rst=1;
    @(negedge clk);
    rst=0;
    rd_en=0;
    addr_rd=0;
    for (i = 0;i<1000 ; i=i+1) begin
        din=$random;
        wr_en=$random;
        addr_wr=$random;
        blk_sel=$random;
        @(negedge clk);

    end
    $stop;
    wr_en=0;
    addr_rd=0;
    for (i = 0;i<1000 ; i=i+1) begin
        din=$random;
        rd_en=$random;
        addr_rd=$random;
        blk_sel=$random;
        @(negedge clk);
    end
        $stop;

     for (i = 0;i<1000 ; i=i+1) begin
        din=$random;
        wr_en=$random;
        addr_wr=$random;
        rd_en=$random;
        addr_rd=~addr_wr;
        blk_sel=$random;
        @(negedge clk);
    end
    $stop;
end
initial begin
    $monitor("din = %d |wr_en=%b |addr_wr=%d |rd_en=%b |addr_rd=%d |blk_sel=%b |dout=%d",din,wr_en,addr_wr,rd_en,addr_rd,blk_sel,dout);
end

endmodule //sync_RAM