module RAM_Parameters_testbench ();
parameter MEM_WIDTH =16 ;
parameter MEM_DEPTH =1024 ;
parameter ADDR_SIZE =10 ;

reg [MEM_WIDTH-1:0]din;
reg [ADDR_SIZE-1:0]addr;
reg wr_en,rd_en,blk_sel,adder_en,dout_en,clk,rst;

wire  [MEM_WIDTH-1:0] dout0,dout1 ;
wire  parity_out0,parity_out1;

integer i;

RAM_Parameters #(MEM_WIDTH,MEM_DEPTH,ADDR_SIZE,0,1,1)RAM_Parameters_instant0(
    din,addr,wr_en,rd_en,blk_sel,adder_en,dout_en,clk,rst,dout0,parity_out0
);
RAM_Parameters #(MEM_WIDTH,MEM_DEPTH,ADDR_SIZE,1,0,0)RAM_Parameters_instant1(
    din,addr,wr_en,rd_en,blk_sel,adder_en,dout_en,clk,rst,dout1,parity_out1
);
initial begin
    clk=0;
    forever #10 clk=~clk;  
end
initial begin
    $readmemh ("mem.bat",RAM_Parameters_instant0.MEM);
    $readmemh ("mem.bat",RAM_Parameters_instant1.MEM);
    rst=1;
    @(negedge clk);
    rst=0;
    for (i =0 ;i<1000 ;i=i+1 ) begin
        din=$random;
        addr=$random;
        wr_en=$random;
        rd_en=$random;
        blk_sel=$random;
        adder_en=$random;
        dout_en=$random;
        @(negedge clk);
    end
    $stop;

end
initial begin
    $monitor("dout0=%d parity0=%b dout1=%d parity1=%b", dout0, parity_out0, dout1, parity_out1);
end
endmodule //RAM_Parameters_testbench
