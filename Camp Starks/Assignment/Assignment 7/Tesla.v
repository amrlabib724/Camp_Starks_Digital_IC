module Tesla (speed_limit,car_speed,leading_distance,clk,rst,unlock_doors,accelerate_car);
parameter STOP =2'b00 ;
parameter ACCELERATE =2'b01 ;
parameter DECELERATE =2'b10 ;
parameter MIN_DISTANCE =7'd40 ;

input [7:0] speed_limit,car_speed ;
input [6:0] leading_distance;
input clk, rst;

output reg unlock_doors,accelerate_car;

reg [1:0]cs,ns;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        cs<=STOP;
    end
    else begin
        cs<=ns;
    end
end


always @( * ) begin
    case (cs)
       STOP : begin
       
           if (leading_distance>=MIN_DISTANCE) begin
            ns=ACCELERATE;
            end
           else begin
            ns=STOP;
            end
         end
       ACCELERATE : begin
               if ((leading_distance<MIN_DISTANCE)||(car_speed>speed_limit)) begin
                ns=DECELERATE;
               end
               
               else begin
                ns=ACCELERATE; 
               end
         
          end
        DECELERATE : begin
                 if (car_speed==0) begin
                ns=STOP;
               end
               else if((leading_distance>=MIN_DISTANCE)||(car_speed>speed_limit)) begin
                ns=ACCELERATE;
               end
               else begin
                ns=DECELERATE;
               end
          end  
       
        default: ns=STOP;
    endcase
     
end


always @( * ) begin
    case (cs)
       STOP : begin
              unlock_doors=1'b1;
              accelerate_car=1'b0;
          
         end
       ACCELERATE : begin
              unlock_doors=1'b0;
              accelerate_car=1'b1;
         
          end
        DECELERATE : begin
                unlock_doors=1'b0;
              accelerate_car=1'b0;
          end  
       
        default: begin
              unlock_doors=1'b01;
             accelerate_car=1'b0;
        end
    endcase
     
end
endmodule //Tesla