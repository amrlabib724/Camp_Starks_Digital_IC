module Shift_right_Left_Register_testbensh();

reg clk,si,Left_Right;

wire [7:0]P_out;

integer i;

Shift_right_Left_Register dut (.clk(clk),.si(si),.Left_Right(Left_Right),.P_out(P_out));
initial begin
    clk=0;
    forever #10 clk=~clk;
end

initial begin
    Left_Right=0;
    for (i = 0;i<30;i=i+1 ) begin
        si=$random;
        @(negedge clk);
    end
    Left_Right=1;
    for (i =0 ;i<30 ;i=i+1 ) begin
        si=$random;
        @(negedge clk);
    end
    $stop;
end

initial begin
    $monitor("P_out = %b , Si = %b ,Left_Right = %b  ",P_out,si,Left_Right);
end

endmodule //Shift_right_Left_Register_testbensh