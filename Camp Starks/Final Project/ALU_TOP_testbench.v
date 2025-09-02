module ALU_TOP_testbench ();
parameter DATA_SIZE = 8;
parameter OPCODE_SIZE = 3;

reg [DATA_SIZE-1:0]A,B;
reg [OPCODE_SIZE-1:0]OPCODE;
reg clk,rstn,CIN;

wire [DATA_SIZE-1:0]RESULT;
wire COUT,ZERO_FLAG;
integer i;

ALU_TOP #(.DATA_SIZE(DATA_SIZE),.OPCODE_SIZE(OPCODE_SIZE)) dut(.A(A),.B(B),.CIN(CIN),.OPCODE(OPCODE),.clk(clk),.rstn(rstn),.RESULT(RESULT),.COUT(COUT),.ZERO_FLAG(ZERO_FLAG));

initial begin
    clk=0;
    forever #10 clk=~clk;
end
initial begin
    rstn=0;
    @(negedge clk);
    rstn=1;
    OPCODE=0;
        for (i =0 ;i<20;i=i+1 ) begin
                A=$random;
                B=$random;
                CIN=$random;
               repeat(2) @(negedge clk);
                
                case (OPCODE)
                    3'd0  : if ({COUT,RESULT} !== (A+B+CIN)) begin $display("Addition failed: %d + %d + %d != %d_%d", A, B, CIN, COUT, RESULT); $stop; end
                    3'd1  : if ({COUT,RESULT} !== (A-B-CIN)) begin $display("Subtraction failed: %d - %d - %d != %d_%d", A, B, CIN, COUT, RESULT); $stop; end
                    3'd2  : if ({COUT,RESULT} !== (A+1)) begin $display("Increment A failed: %d + 1 != %d_%d", A, COUT, RESULT); $stop; end
                    3'd3  : if ({COUT,RESULT} !== (B-1)) begin $display("Increment B failed: %d - 1 != %d_%d", B, COUT, RESULT); $stop; end
                    3'd4  : if (RESULT !== (A&B)) begin $display("AND failed: %b & %b != %b", A, B, RESULT); $stop; end
                    3'd5  : if (RESULT !== (A|B)) begin $display("OR failed: %b | %b != %b", A, B, RESULT); $stop; end
                    3'd6  : if (RESULT !== (A^B)) begin $display("XOR failed: %b ^ %b != %b", A, B, RESULT); $stop; end
                    3'd7  : if (RESULT !== (~A)) begin $display("NOT failed: ~%b != %b", A, RESULT); $stop; end
                    default: begin $display("Unknown OPCODE: %d. Test stopped.", OPCODE); $stop; end
                endcase
                OPCODE=OPCODE+1;
        end
        $display("All Test Passed ");
        $stop;

end

endmodule //ALU_TOP_testbench