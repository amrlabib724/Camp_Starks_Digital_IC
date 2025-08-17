module Type_FF_testbench ();
reg Clk, Reset, D;
wire Q_DFF, Qn_DFF, Q_Dtt, Qn_Dtt;
integer i;
// Instantiate the Type flip-flop
Type_FF #( .Type("DFF") ) type_dff_inst (.Clk(Clk), .Reset(Reset), .D(D), .Q(Q_DFF), .Qn(Qn_DFF));
Type_FF #( .Type("TFF") ) type_tff_inst (.Clk(Clk), .Reset(Reset), .D(D), .Q(Q_Dtt), .Qn(Qn_Dtt));


  // Clock generation
    initial begin
        Clk = 0;
        forever #10 Clk = ~Clk; // 50 MHz clock    
    end

initial begin
    Reset = 0;
    @(negedge Clk);
    Reset = 1;  
    for (i = 0; i < 20; i = i + 1) begin
        D = $random % 2;
        @(negedge Clk);
        end
        $stop;
end

    initial begin
        $monitor("Time: %0t ns, D: %b, Q_DFF: %b, Qn_DFF: %b Q_TFF: %b, Qn_TFF: %b ", $time, D, Q_DFF, Qn_DFF,Q_Dtt, Qn_Dtt);
    end

    endmodule //Type_FF_testbench