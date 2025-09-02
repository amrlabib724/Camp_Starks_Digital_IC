module Shift_right_Left_Register (clk,si,Left_Right,P_out );
input clk,si,Left_Right;
output reg [7:0] P_out;
always @(posedge clk ) begin
    
    if (Left_Right) begin
        P_out<={si,P_out[7:1]};
    end
    else begin
        P_out<={P_out[6:0],si};
    end
end
endmodule
