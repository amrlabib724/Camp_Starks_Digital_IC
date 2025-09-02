vlib work      
vlog Shift_right_Left_Register.v Shift_right_Left_Register_testbensh.v     
vsim -voptargs=+acc work.Shift_right_Left_Register_testbensh
add wave *
run -all
#quit -sim