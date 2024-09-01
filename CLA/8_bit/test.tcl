read_sky130.lib
read_verilog CLA.v
link_design carry_lookahead_adder
read_sdc CLA.sdc
report_checks -path_delay max -format full
report_checks -path_delay min -format full
