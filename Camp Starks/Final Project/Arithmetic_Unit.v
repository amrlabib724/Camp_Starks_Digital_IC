module Arithmetic_Unit (A,B,CIN,OPCODE,RESULT,COUT,ZERO_FLAG);
parameter DATA_SIZE = 8;
parameter OPCODE_SIZE = 3;

input [DATA_SIZE-1:0]A,B;
input [OPCODE_SIZE-1:0]OPCODE;
input CIN;

output reg [DATA_SIZE-1:0]RESULT;
output reg COUT,ZERO_FLAG;

always @(*) begin
    case (OPCODE)
       3'b000 : {COUT,RESULT}= A+B+CIN;
       3'b001 : {COUT,RESULT}= A-B-CIN;
       3'b010 : {COUT,RESULT}= A+1;
       3'b011 : {COUT,RESULT}= B-1;
        default: {COUT,RESULT}=0;
    endcase
    if (COUT==0) begin
        ZERO_FLAG=1'b1;
    end
    else begin
        ZERO_FLAG=1'b0;
    end
end

endmodule //ALU