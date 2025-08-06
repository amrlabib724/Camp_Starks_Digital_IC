module adder(A,B,C);
  parameter WIDTH=16;
  input [WIDTH-1:0]A;
  input [WIDTH-1:0]B;
  output [WIDTH-1:0]C;
  assign C=A+B;
  
endmodule 
module substractor(w,y,z);
parameter WIDTH=16;
  input [WIDTH-1:0]w;
  input [WIDTH-1:0]y;
  output [WIDTH-1:0]z;
  assign z=w-y;
endmodule 


module unit_math (A,B,C,Z);
parameter WIDTH=16;
input  [WIDTH-1:0] A;
input  [WIDTH-1:0] B;
input  [WIDTH-1:0] C;
output  [WIDTH-1:0] Z;

    wire [WIDTH-1:0] SUM;

    adder #(.WIDTH(WIDTH)) u_adder (.A(A),.B(B),.C(SUM));

    subtractor #(.WIDTH(WIDTH)) u_subtractor (.x(SUM),.y(C),.z(Z));

endmodule
module math_dut();
  
endmodule 
  
