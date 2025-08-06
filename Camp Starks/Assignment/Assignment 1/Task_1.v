module Task_1(A,B,C,D,E,F,sel,out,out_bar);
input A,B,C,D,E,F,sel;
output out,out_bar;
wire ABC,DEF;
assign ABC=A&B&C;
assign DEF=~(D^E^F);
assign out=(sel)?DEF:ABC;
assign out_bar=~out;
endmodule