module ALU #(parameter N_bit=4) (A, B, opcode, ALU_Out);
    input [N_bit-1:0] A ;
    input [N_bit-1:0] B;
    input [1:0] opcode;
    output reg [N_bit:0] ALU_Out;

    
    always @(*) begin
        case (opcode)
            2'b00: ALU_Out = A + B; 
            2'b10: ALU_Out = {1'b0,A - B}; 
            2'b01: ALU_Out = {1'b0,A | B}; 
            2'b11: ALU_Out = {1'b0,A ^ B}; 
            default: ALU_Out = 5'b00000; 
        endcase
    end
endmodule //ALU
