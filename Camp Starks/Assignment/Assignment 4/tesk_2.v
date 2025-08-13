module tesk_2 (input [9:0]D,output reg[3:0]Y);
always @(*) begin
    case (D)
     {{9{1'b0}}, 1'b1}:Y={4{1'b0}};
     {{8{1'b0}}, 2'b10}:Y={{3{1'b0}}, 1'b1};
        4:Y=2;
        8:Y=3;
        16:Y=4;
        32:Y=5;
        64:Y=6;
        128:Y=7;
        256:Y=8;
        512:Y=9;
        default: Y=0;
    endcase
end

endmodule //tesk.2

module tesk_2_testbench ();
reg [9:0] D;
wire [3:0] Y;
integer i;
tesk_2 dut (D, Y);
initial begin
    for (i =0 ;i<2048;i=i+1 ) begin
        D=$random;
        #10;
        
        case (D)
            10'b0000000001: if (Y != 0) begin $display("Error: D=%d, Y=%b", D, Y);$stop;end
            10'b0000000010: if (Y != 1) begin $display("Error: D=%d, Y=%b", D, Y);$stop;end
            10'b0000000100: if (Y != 2) begin $display("Error: D=%d, Y=%b", D, Y);$stop;end
            10'b0000001000: if (Y != 3) begin $display("Error: D=%d, Y=%b", D, Y);$stop;end
            10'b0000010000: if (Y != 4) begin $display("Error: D=%d, Y=%b", D, Y);$stop;end
            10'b0000100000: if (Y != 5) begin $display("Error: D=%d, Y=%b", D, Y);$stop;end
            10'b0001000000: if (Y != 6) begin $display("Error: D=%d, Y=%b", D, Y);$stop;end
            10'b0010000000: if (Y != 7) begin $display("Error: D=%d, Y=%b", D, Y);$stop;end
            10'b0100000000: if (Y != 8) begin $display("Error: D=%d, Y=%b", D, Y);$stop;end
            10'b1000000000: if (Y != 9) begin $display("Error: D=%d, Y=%b", D, Y);$stop;end
    endcase
    if((D&(D-1))!=0&& Y!=0)
        begin
            $display("Error: D=%d, Y=%b", D, Y);
            $stop;
        end
    end
    $display("Test completed successfully.");
    $stop;
end

endmodule