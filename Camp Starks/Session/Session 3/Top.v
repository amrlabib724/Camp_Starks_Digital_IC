module moduleName #( parameter Type="Priority") ( in,sel,out_encoder,out_Demux);
input [3:0] in;
input [1:0] sel ;
output [3:0] out_Demux,out_encoder;
generate
    if (Type=="Priority") begin
        Demux_4x1 D1 (.sel(sel),.Y(out_Demux),.D(in[0]));
    end else begin
        priority_encoder p1(.in(in),.out(out_encoder));
    end

endgenerate
    
endmodule