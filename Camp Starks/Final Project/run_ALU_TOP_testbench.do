vlib work 
vlog Logic_Unit.v
vlog Arithmetic_Unit.v    
vlog ALU_TOP.v 
vlog ALU_TOP_testbench.v   
vsim -voptargs=+acc work.ALU_TOP_testbench 
add wave *
run -all
#quit -sim