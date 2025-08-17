module D_FF_testbench ();
reg Clk, Reset, D;
wire Q, Qn;
integer i;  
// Instantiate the D flip-flop
D_FF d_ff_inst (.Clk(Clk), .Reset(Reset), .D(D), .Q(Q), .Qn(Qn));

  // Clock generation
    initial begin
        Clk = 0;
        forever #10 Clk = ~Clk; // 50 MHz clock    
    end
    initial begin
        Reset = 0;
        @(negedge Clk);
        Reset = 1;
        for (i =0 ;i<20 ;i=i+1 ) begin
            D=$random % 2;
            @(negedge Clk);
            if (Qn !== ~D) begin
                $display("Error at time %0t ns: D=%b Q=%b Qn=%b", $time, D, Q, Qn);
                $stop;
            end
            
        end
        $stop;
    end
   
    initial begin
        $monitor("Time: %0t ns, D: %b, Q: %b, Qn: %b", $time, D, Q, Qn);
    end 

endmodule //D_ff_testbench