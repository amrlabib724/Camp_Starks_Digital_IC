module Mux_3x1_1 (in_0,in_1,in_2,sel,out);
input in_0,in_1,in_2;
input [1:0]sel;
output  out;
assign out=(sel==2'b00)? in_0: (sel==2'b01)? in_1:in_2;

endmodule //Mux_3x1_1
