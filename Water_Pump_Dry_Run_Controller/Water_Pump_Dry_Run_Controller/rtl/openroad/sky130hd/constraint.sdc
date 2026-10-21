current_design pump_protection_controller

set clk_name core_clock
set clk_port_name clk
set clk_period 20.0
set clk_io_pct 0.2

set clk_port [get_ports $clk_port_name]

create_clock -name $clk_name -period $clk_period $clk_port

set clk_io_name vclk_$clk_name
create_clock -name $clk_io_name -period $clk_period

set_input_delay [expr $clk_period * $clk_io_pct] \
    -clock $clk_io_name [all_inputs -no_clocks]

set_output_delay [expr $clk_period * $clk_io_pct] \
    -clock $clk_io_name [all_outputs]
