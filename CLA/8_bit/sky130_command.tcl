#read lib
read_liberty -lib sky130.lib

read_verilog CLA.v

synth -top carry_lookahead_adder

abc  -liberty sky130.lib

write_verilog -noattr CLA_Netlist.v

show -prefix CLA_dot -notitle -colors 2 -width -format dot
tee -o CLA.json stat  -liberty "sky130.lib" -json
