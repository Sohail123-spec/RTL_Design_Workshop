# Module 4 — Pre-Layout Timing Analysis and Importance of Good Clock Tree

## Overview

Module 4 focuses on timing modelling and clock distribution. It begins with track information, standard-cell LEF generation, timing libraries and delay tables, then moves into timing analysis using OpenSTA. The module introduces setup time, hold time, clock jitter and uncertainty, followed by clock tree synthesis with TritonCTS.

The final part studies timing with real clocks and examines how clock-tree buffering and clock distribution affect setup and hold behavior.

## Learning Objectives

- Understand how layout/grid information is related to routing tracks.
- Understand the role of LEF and timing-library information in physical implementation.
- Explain delay tables and their use in timing modelling.
- Perform basic setup timing analysis using OpenSTA.
- Understand flip-flop setup and hold requirements.
- Understand clock jitter and uncertainty.
- Understand the purpose of clock tree synthesis.
- Explain clock buffering, H-tree distribution and clock-net shielding.
- Analyze setup and hold timing using real clocks.
- Understand the effect of CTS buffer sizing on timing.

## Topics Covered

### SKY130_D4_SK1 — Timing Modelling Using Delay Tables

- Lab steps to convert grid information to track information
- Lab steps to convert Magic layout to standard-cell LEF
- Introduction to timing libraries and steps to include a new cell in synthesis
- Introduction to delay tables
- Delay table usage Part 1
- Delay table usage Part 2
- Lab steps to configure synthesis settings to fix slack and include `vsdinv`

### SKY130_D4_SK2 — Timing Analysis with Ideal Clocks Using OpenSTA

- Setup timing analysis and introduction to flip-flop setup time
- Introduction to clock jitter and uncertainty
- Lab steps to configure OpenSTA for post-synthesis timing analysis
- Lab steps to optimize synthesis to reduce setup violations
- Lab steps to perform basic timing analysis

### SKY130_D4_SK3 — Clock Tree Synthesis, TritonCTS and Signal Integrity

- Clock tree routing and buffering using H-Tree algorithm
- Crosstalk and clock-net shielding
- Lab steps to run CTS using TritonCTS
- Lab steps to verify CTS results

### SKY130_D4_SK4 — Timing Analysis with Real Clocks Using OpenSTA

- Setup timing analysis using real clocks
- Hold timing analysis using real clocks
- Lab steps to analyze timing with real clocks using OpenSTA
- Lab steps to execute OpenSTA with correct timing libraries and CTS assignment
- Lab steps to observe the impact of bigger CTS buffers on setup and hold timing

## Timing Analysis Concepts

### Setup Time

Setup time is the required interval during which input data must be stable before the active clock edge of a sequential element. A setup violation indicates that data is not arriving with sufficient timing margin before the capture edge.

### Hold Time

Hold time is the required interval during which data must remain stable after the active clock edge. A hold violation indicates that data changes too soon after the capture edge.

### Clock Jitter and Uncertainty

Clock jitter represents variation in clock arrival timing. Clock uncertainty accounts for timing variations and margins used during analysis. Both influence the available timing budget.

### Delay Tables

Delay tables provide cell-delay information as a function of relevant operating conditions such as input transition and output load. They allow timing tools to estimate the behavior of library cells during analysis.

## Clock Tree Synthesis

```text
Clock Source
     ↓
Clock Distribution
     ↓
Buffering / H-Tree Structure
     ↓
Clock Sinks / Flip-Flops
```

CTS attempts to distribute the clock to sequential elements while controlling skew, delay and signal-integrity effects. The module also introduces shielding and crosstalk considerations for clock nets.

## Ideal Clock vs Real Clock

With an ideal clock, clock arrival is represented without the physical effects introduced by the clock network. After CTS, the real clock network has actual propagation and distribution characteristics, allowing setup and hold timing to be analyzed with a more physical clock model.

## Figures and Practical Evidence

### 1. Track, LEF and Timing-Library Preparation

![Grid Stack](./Images/grid_stack.png)

![Track Information](./Images/track_info.png)

![Port Layer](./Images/PORT_Layer.png)

![Edit Cell A](./Images/EDIT_CELL_A.png)

![Edit Cell Y](./Images/EDIT_CELL_Y.png)

![Expand Cell](./Images/Expand_cell.png)

![Foreign Sky130 Cell Step](./Images/Foreign_sky130_fc_hd_step%201.png)

![Characterised for Every Cell](./Images/Characterised%20for%20every%20cell.png)

![Slow Timing Library](./Images/sky130_fd_sc_hd__slow.lib.png)

![Typical Timing Library](./Images/sky130_fd_sc_hd__typical.lib.png)

### 2. Delay Tables and SDC Constraints

![Base SDC](./Images/Base.sdc.png)

![My Base SDC](./Images/my_base.sdc.png)

![My Base SDC - Alternate](./Images/my_base_sdc.png)

![Vim My Base SDC](./Images/Vim_My_base_sdc.png)

![Vim Pre STA Constraint](./Images/vim%20pre_sta.con.png)

![Create Clock](./Images/Create_clock.png)

### 3. OpenSTA Pre-Layout Timing Analysis

![OpenSTA Prelayout Timing Analysis](./Images/OpenSTA_Prelayout_Timing_Analysis.png)

![Timing Analysis 1](./Images/Timing_Analysis_1.png)

![Timing Analysis 2](./Images/Timing_Analysis2.png)

![Timing Paths](./Images/Timing_paths.png)

![Setup Time](./Images/set_up_time.png)

![Hold Time](./Images/hold_time.png)

![Jitter Variation](./Images/Jitter_Variation.png)

![Synthesis](./Images/Synthesis.png)

![PicoRV32A Statistics](./Images/picorv32a_statistics.png)

### 4. Clock Tree Synthesis and Signal Integrity

![Clock Tree Synthesis](./Images/clock_tree_synthesis.png)

![Clock Tree Synthesis H-Tree](./Images/clock_tree_synthesis%28H-tree%29.png)

![Clock Tree Synthesis Buffering](./Images/clock_tree_synthesis%28Buffering%29.png)

![CTS TCL](./Images/cts_tcl.png)

![Run CTS](./Images/run_cts.png)

![Power Aware CTS](./Images/Power_Aware_CTS.png)

![Clock Net Shielding](./Images/Clock_net_sheilding.png)

![Crosstalk Delta Delay](./Images/Crosstalk_Delta_Delay.png)

### 5. Real-Clock Timing and Physical Results

![Timing Analysis with Real Clock](./Images/Timing_analysis_with_real_clock.png)

![Hold Analysis with Real Time](./Images/Hold_analysis_with_real_time.png)

![Placement Cell](./Images/Placement_cell.png)

![Placement Zoom Out](./Images/Placement_zoom_out.png)

![Macro](./Images/MACRO_sky130_dfstp4.png)

![VPWR Metal 1](./Images/VPWR_METAL1.png)

![VGND Metal 6](./Images/VGND_METAL6.png)

![Additional Practical Result](./Images/Screenshot%20%2838%29.png)

## Practical Interpretation

The timing workflow connects library data and SDC constraints to OpenSTA analysis. Timing reports can then be examined for critical paths, setup/hold behavior and available timing margin. CTS introduces the physical clock network, after which real-clock analysis can reveal effects that are not represented by an ideal clock.

## Key Takeaways

- Timing analysis depends on accurate cell and constraint information.
- Delay tables provide the cell timing behaviour used by timing analysis.
- OpenSTA can be used to examine timing paths and setup/hold conditions.
- Clock jitter and uncertainty reduce the available timing margin.
- CTS builds the clock network and uses buffering to distribute the clock.
- Crosstalk and shielding are important signal-integrity considerations for clock nets.
- Real-clock analysis includes the effects of the implemented clock network.

## Tools / Technologies

- OpenSTA
- TritonCTS
- Magic
- Sky130 timing libraries
- SDC constraints
- Standard-cell LEF / Liberty concepts
