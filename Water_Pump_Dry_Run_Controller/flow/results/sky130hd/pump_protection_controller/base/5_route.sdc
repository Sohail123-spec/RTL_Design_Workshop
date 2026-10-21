###############################################################################
# Created by write_sdc
###############################################################################
current_design pump_protection_controller
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name core_clock -period 20.0000 [get_ports {clk}]
set_propagated_clock [get_clocks {core_clock}]
create_clock -name vclk_core_clock -period 20.0000 
set_input_delay 4.0000 -clock [get_clocks {vclk_core_clock}] -add_delay [get_ports {dry_run_fault}]
set_input_delay 4.0000 -clock [get_clocks {vclk_core_clock}] -add_delay [get_ports {pump_demand}]
set_input_delay 4.0000 -clock [get_clocks {vclk_core_clock}] -add_delay [get_ports {reset}]
set_output_delay 4.0000 -clock [get_clocks {vclk_core_clock}] -add_delay [get_ports {fault_status}]
set_output_delay 4.0000 -clock [get_clocks {vclk_core_clock}] -add_delay [get_ports {pump_enable}]
###############################################################################
# Environment
###############################################################################
###############################################################################
# Design Rules
###############################################################################
