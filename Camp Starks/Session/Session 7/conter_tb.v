module conter_tb ();
parameter A=2'b00;
parameter B=2'b01;
parameter C=2'b10;
parameter D=2'b11;
reg rst,clk;
wire [1:0] y;
conter #(.A(A),B.(B),.C(C),.D(D)) (.clk(clk),.rst(rst),.y(y));

initial begin
    clk=0;
    #10 clk=~clk;
end
endmodule //conter_tb