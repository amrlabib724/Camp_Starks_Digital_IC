module ALU_tb ();
reg  [3:0] A,B;
reg [1:0]opcode;
reg [4:0]Y_ex;
wire [4:0]Y_out;
ALU #(.N_bit(4)) dut(.A(A),.B(B),.opcode(opcode),.ALU_Out(Y_out));
initial begin
    A=5;B=4;Y_ex=9;opcode=2'b00;//A=0101 B=0100
    #10;
    opcode=2'b10;Y_ex=1;
    #10;
    opcode=01;Y_ex=0101;
    #10;
    opcode=2'b11;Y_ex=0001;
    #10;
    $stop;

end
initial begin
    $monitor("A = %b , B= %b , Y_out= %b ",A,B,Y_out);
    #10;
end



endmodule //ALU_tb