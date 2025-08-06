module mux4x1_tb();
reg a,b,c,d;
reg[1:0]sel;
wire y;
initial
begin
  a=1;
  b=0;
  c=1;
  d=0;
  sel=2'b00;
  #20
  sel=2'b01;
  #20
  sel=2'b11;
  #10
  #100 $stop ;

end
mux4x1 DUT (a,b,c,d,sel,y);
endmodule
