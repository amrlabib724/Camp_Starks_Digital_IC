module mux2x1(a,b,sel,y);
    input wire a;
    input wire b;
    input wire sel;
    output reg y;

always @(*) begin
    case (sel)
        1'b0: y = a;
        1'b1: y = b;
    endcase
end

endmodule
