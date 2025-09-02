module ALU_TOP (A, B, CIN, OPCODE, clk, rstn, RESULT, COUT, ZERO_FLAG);
parameter DATA_SIZE = 8;
parameter OPCODE_SIZE = 3;

input [DATA_SIZE-1:0] A, B;
input [OPCODE_SIZE-1:0] OPCODE;
input clk, rstn, CIN;

output reg [DATA_SIZE-1:0] RESULT;
output reg COUT, ZERO_FLAG;

reg [DATA_SIZE-1:0] regA, regB;
reg [OPCODE_SIZE-1:0] regOPCODE;
reg regCIN;

wire [DATA_SIZE-1:0] arith_RESULT, logic_RESULT;
wire arith_COUT, logic_COUT;
wire arith_ZERO_FLAG, logic_ZERO_FLAG;

// D_FF For Data input
always @(posedge clk or negedge rstn) begin
    if (~rstn) begin
        regA <= 0;
        regB <= 0;
        regOPCODE <= 0;
        regCIN <= 0;
    end else begin
        regA <= A;
        regB <= B;
        regOPCODE <= OPCODE;
        regCIN <= CIN;
    end
end

// Instantiate both units
Arithmetic_Unit #(DATA_SIZE, OPCODE_SIZE) arith_unit_instant (
    .A(regA),
    .B(regB),
    .CIN(regCIN),
    .OPCODE(regOPCODE),
    .RESULT(arith_RESULT),
    .COUT(arith_COUT),
    .ZERO_FLAG(arith_ZERO_FLAG)
);

Logic_Unit #(DATA_SIZE, OPCODE_SIZE) logic_unit_insttant (
    .A(regA),
    .B(regB),
    .OPCODE(regOPCODE),
    .RESULT(logic_RESULT),
    .COUT(logic_COUT),
    .ZERO_FLAG(logic_ZERO_FLAG)
);

// D_FF For Data output
always @(posedge clk or negedge rstn) begin
    if (~rstn) begin
        RESULT <= 0;
        COUT <= 0;
        ZERO_FLAG <= 0;
    end else begin
        if (regOPCODE<=3'd3) begin
            RESULT <= arith_RESULT;
            COUT <= arith_COUT;
            ZERO_FLAG <= arith_ZERO_FLAG;
        end else begin
            RESULT <= logic_RESULT;
            COUT <= logic_COUT;
            ZERO_FLAG <= logic_ZERO_FLAG;
        end
    end
end
endmodule // ALU_TOP