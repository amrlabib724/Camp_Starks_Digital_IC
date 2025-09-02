module vending_machine (clk,rstn,D_in,Q_in,dispnse,change);
parameter WAIT=2'b00;
parameter Q_25=2'b01;
parameter Q_50=2'b10;
input clk,rstn,D_in,Q_in;
output dispnse,change;

reg [1:0] cs,ns;
always @(posedge clk or negedge rstn) begin
    if (~ rstn) begin
        cs<=WAIT;
    end
    else
    ns<=cs;
end


always @(*) begin
   case (cs)
    WAIT:  if (Q_in) 
        ns=Q_25;
        else
        ns=WAIT;
    Q_25: if (Q_in)
        ns=Q_50
        else
            ns=Q_25;
    Q_50: if (Q_in)
        ns=WAIT;
        else
            ns=Q_50;
    default: ns=WAIT;
   endcase 

end
always @(*) begin
    if(cs==WAIT&&D_in==1)begin
        dispnse=1'b1;
        change=1'b1;
        end
    else if (cs==Q_50&&Q_in==1) begin
        dispnse=1'b1;
        change=1'b0;
    end
    else  begin
         dispnse=1'b0;
        change=1'b0;
    end

end

endmodule //vending_machine