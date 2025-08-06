module mux_4x1_Gates (in0,in1,in2,in3,c0,c1,out);

    input in0, in1, in2, in3,c0,c1;
    output out;
    wire [5:0] w;


not not0 (w[0],c0);
not not1 (w[1],c1);


and and0 (w[2],in0,w[0],w[1]); 
and and1 (w[3],in1,c0,w[1]);   
and and2 (w[4],in2,w[0],c1);
and and3 (w[5],in3,c0,c1); 



or or0 (out,w[2],w[3],w[4],w[5]);

endmodule //mux_4x1_Gates