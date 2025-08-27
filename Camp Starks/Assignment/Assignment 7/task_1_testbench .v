module task_1_testbench ();
parameter  S0 =2'b00 ;
parameter  S1 =2'b01 ;
parameter  S2 =2'b10 ;
parameter  S3 =2'b11 ;

reg  clk,rst,in;
wire y;
integer i;

task_1 #(S0,S1,S2,S3) dut (clk,rst,in,y);
initial begin
    clk=0;
    forever #10 clk=~clk;
end

initial begin
    rst=1'b1;
    @(negedge clk);
    rst=1'b0;
    for (i =0 ;i<15 ;i=i+1 ) begin
        in=$random;
        @(negedge clk);
        
    end
   
    $stop;
end
initial begin
     $monitor ("IN =%b | Y =%b ",in,y);
end
endmodule //task_1