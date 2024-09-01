# 16-bit Carry Save Adder SDC

# Define the clock
create_clock -name clk -period 10.0 [get_ports clk]

# Input delay
set_input_delay 2.0 -clock clk [get_ports {a b c}]

# Output delay
set_output_delay 2.0 -clock clk [get_ports sum]

# False path (optional)
set_false_path -from [get_ports rst_n] -to [get_ports sum]

