module Type_FF_testbench_Gloden ();
reg Clk, Reset, D;
wire Q_DFF, Qn_DFF, Q_Dtt, Qn_Dtt;
wire Q_dff_Golden, Qn_dff_Golden, Q_tff_Golden, Qn_tff_Golden;
integer i;
// Instantiate the Type flip-flop
Type_FF #( .Type("DFF") ) type_dff_inst (.Clk(Clk), .Reset(Reset), .D(D), .Q(Q_DFF), .Qn(Qn_DFF));
Type_FF #( .Type("TFF") ) type_tff_inst (.Clk(Clk), .Reset(Reset), .D(D), .Q(Q_Dtt), .Qn(Qn_Dtt));
// Instantiate the Golden flip-flop
D_FF d_ff_golden_inst (.Clk(Clk), .Reset(Reset), .D(D), .Q(Q_dff_Golden), .Qn(Qn_dff_Golden));
T_FF t_ff_golden_inst (.T(D), .clk(Clk), .res(Reset), .Q(Q_tff_Golden), .Q_bar(Qn_tff_Golden));

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
        if (Q_DFF !=Q_dff_Golden || Qn_DFF != Qn_dff_Golden) begin
            $display("Error");         
            $stop;
        end
        if (Q_Dtt !=Q_tff_Golden || Qn_Dtt != Qn_tff_Golden) begin
            $display("Error");         
            $stop;
        end
end
        $stop;
    end
    initial begin
        $monitor("Time: %0t ns, D: %b, Q_DFF: %b, Qn_DFF: %b Q_TFF: %b, Qn_TFF: %b Q_dff_Golden :%b, Qn_dff_Golden :%b, Q_tff_Golden:%b , Qn_tff_Golden:%b ",
         $time, D, Q_DFF, Qn_DFF,Q_Dtt, Qn_Dtt,Q_dff_Golden, Qn_dff_Golden, Q_tff_Golden, Qn_tff_Golden);
    end

    endmodule //Type_FF_testbench