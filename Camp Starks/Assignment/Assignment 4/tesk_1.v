module tesk_1 (D,A,B,C,sel,out,out_bar);

input [2:0] D;
input A, B, C,sel;

output reg  out, out_bar;
wire w_0, w_1, w_2;

and And_0(w_0, D[0], D[1]);
or Or_0(w_1, w_0, D[2]);
xnor Xor_0(w_2, A, B,C);
always @(*) begin
    case (sel)
        1'b0: begin
            out = w_1;
        end
        1'b1: begin
            out = w_2;
        end
        default: out = 1'b0; 

    endcase
    out_bar = ~out; 

    
end

endmodule //tesk_1
module tesk_1_testbench ();

reg [2:0] D;
reg A, B, C, sel,out_expected;
wire out, out_bar;
integer i;

tesk_1 dut (D, A, B, C, sel, out, out_bar);
initial begin
for (i =0 ;i<20 ; i=i+1) begin
    D= $random;
    A= $random;
    B= $random;
    C= $random;
    sel= $random;
    out_expected = (sel == 1'b0) ? (D[0] & D[1]) | D[2] : ~(A ^ B ^ C);
    #10;
    if (out != out_expected) begin
        $display("Eerror");
        $stop;
    end
end
    $stop;
end

initial begin
    $monitor("out=%b ,out_expected=%b, out_bar=%b", out, out_bar,out_expected);
end


endmodule //tesk_1