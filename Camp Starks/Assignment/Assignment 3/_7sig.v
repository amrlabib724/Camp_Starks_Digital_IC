module _7sig #(parameter N_bit=4)(A,B,op,enable,Out_7_sig);
input [N_bit-1:0] A, B;
input [1:0] op;
input enable;

output reg [6:0] Out_7_sig;

wire [N_bit:0] ALU_output;


Task_1_ALU #(.N_bit(N_bit))instance_ALU (.A(A), .B(B), .opcode(op), .ALU_Out(ALU_output));
always @(*) begin
    if (enable) begin
        case (ALU_output[N_bit-1:0])
           4'd0: Out_7_sig = {6'b111111,1'b0}; 
           4'd1: Out_7_sig = {1'b0,2'b11,4'b0000}; 
           4'd2: Out_7_sig = {2'b11,1'b0,2'b11,1'b0,1'b1}; 
           4'd3: Out_7_sig = {4'b1111,2'b00,1'b1} ; 
           4'd4: Out_7_sig = {1'b0,2'b11,2'b00,2'b11}; 
           4'd5: Out_7_sig = {1'b1,1'b0,2'b11,1'b0,2'b11}; 
           4'd6: Out_7_sig = {1'b1,1'b0,5'b11111}; 
           4'd7: Out_7_sig = {3'b111,4'b0000}; 
           4'd8: Out_7_sig = {7'b1111111}; 
           4'd9: Out_7_sig = {4'b1111,1'b0,2'b11}; 
           4'hA: Out_7_sig = {3'b111,1'b0,3'b111} ;
           4'hB: Out_7_sig = {2'b00,5'b11111}; 
           4'hC: Out_7_sig = {1'b1,2'b00,3'b111,1'b0}; 
           4'hD: Out_7_sig = {1'b0,4'b1111,1'b0,1'b1}; 
           4'hE: Out_7_sig = {1'b1,2'b00,4'b1111}; 
           4'hF: Out_7_sig = {1'b1,3'b000,3'b111};           
            default: Out_7_sig = {7'b00000};
        endcase
        
    end
    else begin
        Out_7_sig = 7'b0000000; 
    end
    
end

endmodule //7_sig