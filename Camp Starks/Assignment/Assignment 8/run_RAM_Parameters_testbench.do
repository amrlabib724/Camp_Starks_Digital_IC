vlib work      
vlog RAM_Parameters.v 
vlog RAM_Parameters_testbench.v   
vsim -voptargs=+acc work.RAM_Parameters_testbench 
add wave *
run -all
#quit -sim