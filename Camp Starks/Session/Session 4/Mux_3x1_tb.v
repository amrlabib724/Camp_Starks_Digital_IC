module Mux_3x1_tb ();
reg in_0,in_1,in_2;
reg [1:0] sel;
wire out_1,out1;
integer i;
Mux_3x1 mux_0 (.in_0(in_0),.in_1(in_1),.in_2(in_2),.out(out_1),.sel(sel));
Mux_3x1_1 mux_1 (.in_0(in_0),.in_1(in_1),.in_2(in_2),.out(out_2),.sel(sel));
initial begin
    for ( i=0 ;i<20;i=i+1 ) begin
        in_0=$random;
        in_1=$random;
        in_2=$random;
        sel =$random;
        #10;
        if (out_1 != out_2) begin
            $stop;
        end

    end
end
initial begin
    $monitor ("out_0 = %d , out_1 = %d , sel=%d ,in_0=%d ,in_1=%d , in_2=%d ",out_1,out_2,sel,in_0,in_1,in_2);
end

endmodule //Mux_3x1_tb