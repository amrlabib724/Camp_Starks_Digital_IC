module T_FF_tb();
  reg T, clk_tb, res;
  wire Q, Q_bar;
  integer i;

  // Instantiate DUT
  T_FF dut (.T(T), .clk(clk_tb), .res(res), .Q(Q), .Q_bar(Q_bar));

  // Clock generation
  initial begin
      clk_tb = 0;
      forever #10 clk_tb = ~clk_tb; 
  end

initial begin
    res =0;
    T = 0;
    @(negedge clk_tb);
    res = 1;
    for (i = 0;i<20 ; i=i+1) begin
        T= $random % 2;
        @(negedge clk_tb);
         if (Q_bar !== ~Q) begin
              $display("Error at time %0t: Q=%b Q_bar=%b (not complement)", $time, Q, Q_bar);
              $stop;
          end
    end
    $display("Test completed successfully");
    $stop;
end

initial begin
      $monitor(" T: %b, res: %b, Q: %b, Q_bar: %b",T,res, Q, Q_bar);
end
endmodule