module mux_2x1_Gate (in0,in1,sel,y);
input in0,in1,sel;
output y;
wire w0,w1,w2;
and and1(w0,in0,in1);
not not1(w1,in1);
and and2(w2,w1,sel);
or or1(y,w0,w2);


endmodule //mux_2x1_Gate