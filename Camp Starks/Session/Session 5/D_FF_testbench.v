module D_FF_testbench ();
reg  PRE,E,Clk,D;
wire Q;
D_FF (.PRE(PRE),.E(E),.Clk(Clk),.D(D),.Q(Q));
initial begin
    Clk=0;
    forever #10 Clk=~Clk;
end
initial begin
    PRE=0;
    @(negedge Clk);
    PRE=1;
    for (i =0 ;i<30 ;i=i+1 ) begin
        E=$random;
        D=$random;
        PRE=$random;
        @(negedge Clk);
        if (E && Q!=D) begin
            $display ("Eroor in E ");
            $stop;
        end
        if (PRE==0&&Q!=1'b1) begin
            $display ("Eroor in PRE ");
            $stop;
        end

    end
end
endmodule //D_FF_testbench