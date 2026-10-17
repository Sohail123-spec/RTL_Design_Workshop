# Method and analysis flow

**Author:** MD Soahil Ahmed

The supplied table summarizes post-route static timing analysis across 16 process/voltage/temperature (PVT) conditions. The stated flow uses a routed design database, route timing constraints, extracted parasitics, and corner-specific Liberty timing models.

A reproducible run should confirm the design database, SDC, SPEF, and all required `sky130_fd_sc_hd__*.lib` files; load the design and constraints; apply the correct corner libraries and parasitics; then emit setup, hold, and unconstrained-path reports for each corner.

**Important:** this package does not contain the original detailed timing paths, Tcl script, or raw logs. The summary table is the only numeric input used to regenerate the charts and corner review sheets.
