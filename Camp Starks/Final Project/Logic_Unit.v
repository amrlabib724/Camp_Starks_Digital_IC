module Logic_Unit (A,B,OPCODE,RESULT,COUT,ZERO_FLAG);
parameter DATA_SIZE = 8;
parameter OPCODE_SIZE = 3;

input [DATA_SIZE-1:0]A,B;
input [OPCODE_SIZE-1:0]OPCODE;


output reg [DATA_SIZE-1:0]RESULT;
output reg COUT,ZERO_FLAG;

always @(*) begin
    case (OPCODE)
       3'b100 : RESULT= A&B;
       3'b101 : RESULT= A|B;
       3'b110 : RESULT= A^B;
       3'b111 : RESULT= ~A;
        default: RESULT=0;
    endcase
    COUT=0;
    if (RESULT==0) begin
        ZERO_FLAG=1'b1;
    end
    else begin
        ZERO_FLAG=1'b0;
    end
end
endmodule //Logic_Unit