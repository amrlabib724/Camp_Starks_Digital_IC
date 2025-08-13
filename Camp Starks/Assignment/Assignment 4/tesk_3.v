module tesk_3 #(parameter N=1)(A,,B,C);
input [N-1:0] A,B;
output [N-1:0] C;
assign C = A + B;
endmodule //tesk_3
module tesk_3_testbench ();
reg  A, B,C_expected;
wire  C;
integer i;
tesk_3 #(.N(1)) dut (.A(A),.B(B),.C(C));
initial begin
    for (i = 0; i < 20; i = i + 1) begin
        A = $random;
        B = $random;
        C_expected = A + B;
        #10;
        if (C != C_expected) begin
            $display("Error: A=%b, B=%b, C=%b, Expected=%b", A, B, C, C_expected);
            $stop;
        end
    end
    $display("Test completed successfully.");
    $stop;
end
endmodule //tesk_3_testbench
