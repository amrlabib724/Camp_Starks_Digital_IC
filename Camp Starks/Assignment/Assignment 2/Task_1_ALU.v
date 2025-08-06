module Task_1_ALU (A, B, opcode, ALU_Out);
    input [3:0] A ;
    input [3:0] B;
    input [1:0] opcode;
    output reg [3:0] ALU_Out;

    
    always @(*) begin
        case (opcode)
            2'b00: ALU_Out = A + B; 
            2'b01: ALU_Out = A - B; 
            2'b10: ALU_Out = A | B; 
            2'b11: ALU_Out = A ^ B; 
            default: ALU_Out = 4'b0000; 
        endcase
    end
endmodule //Task_1_ALU