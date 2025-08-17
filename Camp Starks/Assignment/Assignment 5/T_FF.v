module T_FF (
    input T,       
    input clk,     
    input res,   
    output reg Q,  
    output Q_bar   
);

always @(posedge clk or negedge res) begin
    if (!res) begin
        Q <= 1'b0;   
    end 
    else if (T) begin
        Q <= ~Q;     
    end
end

assign Q_bar = ~Q;  
endmodule
