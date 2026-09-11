# Module 4 — Pre-Layout Timing Analysis and Importance of Good Clock Tree

## Overview

This module focuses on timing modelling, pre-layout timing analysis with OpenSTA, clock-tree synthesis using TritonCTS, signal integrity, and timing analysis with real clocks.

## Topics Covered

### SKY130_D4_SK1 — Timing modelling using delay tables

- Lab steps to convert grid info to track info
- Lab steps to convert Magic layout to standard-cell LEF
- Introduction to timing libraries and steps to include a new cell in synthesis
- Introduction to delay tables
- Delay table usage — Part 1
- Delay table usage — Part 2
- Lab steps to configure synthesis settings to fix slack and include `vsdinv`

### SKY130_D4_SK2 — Timing analysis with ideal clocks using OpenSTA

- Setup timing analysis and introduction to flip-flop setup time
- Introduction to clock jitter and uncertainty
- Lab steps to configure OpenSTA for post-synth timing analysis
- Lab steps to optimize synthesis to reduce setup violations
- Lab steps to do basic timing

### SKY130_D4_SK3 — Clock tree synthesis TritonCTS and signal integrity

- Clock tree routing and buffering using H-Tree algorithm
- Crosstalk and clock net shielding
- Lab steps to run CTS using TritonCTS
- Lab steps to verify CTS ru

### SKY130_D4_SK4 — Timing analysis with real clocks using OpenSTA

- Setup timing analysis using real clocks
- Hold timing analysis using real clocks
- Lab steps to analyze timing with real clocks using OpenSTA
- Lab steps to execute OpenSTA with right timing libraries and CTS assignment
- Lab steps to observe impact of bigger CTS buffers on setup and hold timing

## Practical Focus

The practical material connects timing libraries and delay tables to synthesis and timing analysis, then introduces clock-tree construction and signal-integrity concerns before analyzing setup and hold timing with real clocks.

## Figures / Practical Evidence

All figures supplied with Module 4 are retained in the `Images` directory.

- **Base.sdc** — [Figure](<./Images/Base.sdc.png>)
- **Characterised for every cell** — [Figure](<./Images/Characterised for every cell.png>)
- **Clock net sheilding** — [Figure](<./Images/Clock_net_sheilding.png>)
- **Create clock** — [Figure](<./Images/Create_clock.png>)
- **Crosstalk Delta Delay** — [Figure](<./Images/Crosstalk_Delta_Delay.png>)
- **EDIT CELL A** — [Figure](<./Images/EDIT_CELL_A.png>)
- **EDIT CELL Y** — [Figure](<./Images/EDIT_CELL_Y.png>)
- **Expand cell** — [Figure](<./Images/Expand_cell.png>)
- **Foreign sky130 fc hd step 1** — [Figure](<./Images/Foreign_sky130_fc_hd_step 1.png>)
- **Hold analysis with real time** — [Figure](<./Images/Hold_analysis_with_real_time.png>)
- **Jitter Variation** — [Figure](<./Images/Jitter_Variation.png>)
- **MACRO sky130 dfstp4** — [Figure](<./Images/MACRO_sky130_dfstp4.png>)
- **OpenSTA Prelayout Timing Analysis** — [Figure](<./Images/OpenSTA_Prelayout_Timing_Analysis.png>)
- **PORT Layer** — [Figure](<./Images/PORT_Layer.png>)
- **Placement cell** — [Figure](<./Images/Placement_cell.png>)
- **Placement zoom out** — [Figure](<./Images/Placement_zoom_out.png>)
- **Power Aware CTS** — [Figure](<./Images/Power_Aware_CTS.png>)
- **Screenshot (38)** — [Figure](<./Images/Screenshot (38).png>)
- **Synthesis** — [Figure](<./Images/Synthesis.png>)
- **Timing Analysis2** — [Figure](<./Images/Timing_Analysis2.png>)
- **Timing Analysis 1** — [Figure](<./Images/Timing_Analysis_1.png>)
- **Timing analysis with real clock** — [Figure](<./Images/Timing_analysis_with_real_clock.png>)
- **Timing paths** — [Figure](<./Images/Timing_paths.png>)
- **VGND METAL6** — [Figure](<./Images/VGND_METAL6.png>)
- **VPWR METAL1** — [Figure](<./Images/VPWR_METAL1.png>)
- **Vim My base sdc** — [Figure](<./Images/Vim_My_base_sdc.png>)
- **clock tree synthesis(Buffering)** — [Figure](<./Images/clock_tree_synthesis(Buffering).png>)
- **clock tree synthesis(H-tree)** — [Figure](<./Images/clock_tree_synthesis(H-tree).png>)
- **clock tree synthesis** — [Figure](<./Images/clock_tree_synthesis.png>)
- **cts tcl** — [Figure](<./Images/cts_tcl.png>)
- **grid stack** — [Figure](<./Images/grid_stack.png>)
- **hold time** — [Figure](<./Images/hold_time.png>)
- **my base.sdc** — [Figure](<./Images/my_base.sdc.png>)
- **my base sdc** — [Figure](<./Images/my_base_sdc.png>)
- **picorv32a statistics** — [Figure](<./Images/picorv32a_statistics.png>)
- **run cts** — [Figure](<./Images/run_cts.png>)
- **set up time** — [Figure](<./Images/set_up_time.png>)
- **sky130 fd sc hd  slow.lib** — [Figure](<./Images/sky130_fd_sc_hd__slow.lib.png>)
- **sky130 fd sc hd  typical.lib** — [Figure](<./Images/sky130_fd_sc_hd__typical.lib.png>)
- **track info** — [Figure](<./Images/track_info.png>)
- **vim pre sta.con** — [Figure](<./Images/vim pre_sta.con.png>)

## Key Takeaways

- Timing libraries and delay tables provide timing information used during implementation analysis.
- OpenSTA is used for pre-layout/post-synthesis timing analysis and for setup/hold analysis.
- Clock jitter and uncertainty affect timing analysis.
- TritonCTS builds and buffers the clock tree, with H-Tree routing and clock-net shielding introduced as important concepts.
- Real-clock analysis allows setup and hold behavior to be examined after clock-tree synthesis.
- CTS buffer sizing can affect setup and hold timing.
