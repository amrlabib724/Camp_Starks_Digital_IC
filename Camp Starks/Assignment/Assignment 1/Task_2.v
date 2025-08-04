module Task_2(a,b,c,f);
input a,b,c;
output f;
wire a_xor_b,b_xnor_c;
assign a_xor_b=a^b;
assign b_xnor_c=~(b^c);
assign f=a_xor_b&b_xnor_c&c;

endmodule