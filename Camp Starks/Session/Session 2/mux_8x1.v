module mux_8x1(in0,in1,in2,in3,in4,in5,in6,in7,sel,y);
input in0,in1,in2,in3,in4,in5,in6,in7;
input [2:0] sel;
output y;
wire w0,w1,w2,w3,w4,w5 ;
 mux_2x1 mux0 (.a(in0),.b(in1),.y(w0),.sel(sel[0])) ;
 mux_2x1 mux1 (.a(in2),.b(in3),.y(w1),.sel(sel[0]) );
 mux_2x1 mux2 (.a(in4),.b(in5),.y(w2),.sel(sel[0])) ;
 mux_2x1 mux3 (.a(in6),.b(in7),.y(w3),.sel(sel[0])) ;
 mux_2x1 mux4 (.a(w0),.b(w1),.y(w4),.sel(sel[1])) ;
 mux_2x1 mux5 (.a(w2),.b(w3),.y(w5),.sel(sel[1])) ;
 mux_2x1 mux6 (.a(w4),.b(w5),.y(y),.sel(sel[2])) ;





endmodule