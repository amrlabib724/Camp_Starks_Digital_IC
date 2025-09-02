module n_bit_adder #(parameter size=4) (A,B,cin,sum,cout);
input [size-1:0]A,B;
input cin;
output [size-1:0]sum;
output cout;

assign {cout,sum}=A+B+cin;

endmodule //n_bit_adder