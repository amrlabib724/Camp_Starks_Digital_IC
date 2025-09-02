module Mux_3x1 (in_0,in_1,in_2,sel,out);
input in_0,in_1,in_2;
input [1:0]sel;
output reg out;
always @(*) begin
    case (sel) 
   2'b00 : out = in_0;
   2'b01 : out = in_1;
   2'b10 , 2'b11:out =in_2;

    default: out=1'b0;
endcase
    
end


endmodule //Mux_3x1