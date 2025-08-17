module Type_FF #(parameter  Type ="DFF")  (Clk, Reset, D, Q, Qn);
input Clk, Reset, D;
output  Q, Qn;
wire Clk_out; 


   generate
     if (Type == "DFF") begin
        D_FF d_ff_inst (.Clk(Clk), .Reset(Reset), .D(D), .Q(Q), .Qn(Qn));
    end 
    else if (Type == "TFF") begin
        T_FF t_ff_inst (.T(D), .clk(Clk), .res(Reset), .Q(Q), .Q_bar(Qn));
    end 
    
   endgenerate



endmodule //Type_FF
