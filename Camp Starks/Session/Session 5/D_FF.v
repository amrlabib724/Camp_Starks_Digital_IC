module D_FF ( PRE,E,Clk,D,Q);
input  PRE,E,Clk,D;
output reg  Q;
always @(posedge Clk or negedge PRE) begin
    if (~PRE) begin
        Q<=1;
    end
    else begin
        if (E) begin
            Q<=D;
        end
    end
end
endmodule //D_FF