module task_1 (clk, rst, in ,y);
parameter  S0 =2'b00 ;
parameter  S1 =2'b01 ;
parameter  S2 =2'b10 ;
parameter  S3 =2'b11 ;

input clk,rst,in;
output reg y;
reg [1:0]cs,ns;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        cs<=S0;
    end
    else begin
        cs<=ns;
    end
end

always @( * ) begin
    case (cs)
       S0 : begin
       
           if (in) begin
            ns=S1;
            end
           else begin
            ns=S0;
            end
         end
       S1 : begin
               if (in) begin
                ns=S2;
               end
               else begin
                ns=S1;
               end
         
          end
        S2 : begin
                 if (in) begin
                ns=S3;
               end
               else begin
                ns=S2;
               end
          end  
         S3 : begin
                 if (in) begin
                ns=S1;
               end
               else begin
                ns=S0;
               end
          end  
         
        default: ns=S0;
    endcase
     
end


always @(*) begin
    if (cs==S2 && in==1'b1) begin
        y=1'b1;
    end
    else begin
        y=1'b0;
    end
end

endmodule //task_1
