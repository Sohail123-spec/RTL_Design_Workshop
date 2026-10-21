# Final Project Report

## Digital Water Pump Dry-Run Protection and Automatic Restart Controller

**Snapshot date:** 2026-10-21  
**Technology / flow:** Sky130HD through OpenROAD-flow-scripts  
**Status:** RTL simulation and the archived synthesis-to-GDS flow have been run; this report summarizes the evidence included in this snapshot.

## 1. Project objective

The project implements a digital controller intended to disable pump operation when an external dry-run detector asserts a fault, retain fault status/lockout behavior according to the RTL design, and support controlled restart behavior. The controller receives a digital `dry_run_fault` signal; it does not implement a physical water-flow sensor or analog sensor interface.

## 2. RTL and verification evidence

The project includes the RTL module at `rtl/pump_protection_controller.v` and four testbenches:
- `pump_protection_controller_tb.v`
- `pump_protection_controller_reset_tb.v`
- `pump_protection_controller_lockout1_tb.v`
- `pump_protection_controller_persistent_fault_tb.v`

The recorded run summary in the project handoff reports:
- Main testbench: 18 checks, all passed.
- Reset testbench: 9 checks, all passed.
- Lockout-1 testbench: 5 checks, all passed.
- Persistent-fault testbench: 9 checks, all passed.

Surfer waveform screenshots and VCD files are retained under `docs/evidence/P4/`; additional safety/corner-case screenshots are under P5. These values are transcribed from the archived project notes and evidence inventory; this documentation pass did not rerun the simulations.

## 3. Synthesis

The included `synth_stat.txt` reports a synthesized module area of **454.185600** library area units. The included `synth_check.txt` says **“Found and reported 0 problems.”**. These are results of the archived synthesis run and are specific to its library and configuration.

## 4. Physical-design flow

The archive contains stage outputs and reports for floorplanning, placement, clock-tree synthesis, global routing, detailed routing, and final reporting. Final outputs include ODB, DEF, Verilog, SPEF, CDL, and GDS files.

| Metric | Archived result |
|---|---:|
| Final report TNS | 0.00 |
| Final report WNS | 0.00 |
| Reported worst slack | 14.80 ns |
| `core_clock` minimum period | 1.47 ns |
| Reported `core_clock` fmax | 678.21 MHz |
| DRC count report | 0 |
| LVS log netlist-match message | Present |

The final report also includes a virtual clock entry with no launch/capture paths; its `period_min = 0.00` and `fmax = inf` are not meaningful as a real clock performance result. Timing results depend on the included constraints, library, corner, and flow settings. Positive reported slack is not a universal timing guarantee.

The DRC count is the content of the included `6_drc_count.rpt`. It applies only to the checks represented by this flow run and is not a claim of foundry signoff. The LVS statement is limited to the comparison represented by the included LVS log.

## 5. GDSII and handoff

The final GDS is included at `flow/results/sky130hd/pump_protection_controller/base/6_final.gds`. GDS Inspector 2D and 3D views are documented in P12. P14 adds a SHA-256 manifest for important source and generated artifacts to help identify the exact snapshot.

## 6. Limitations and known cautions

- The controller relies on an external digital dry-run detector.
- The RTL does not implement analog sensor conditioning, asynchronous-input synchronization, or motor power circuitry.
- The reported timing and physical verification results are configuration-specific.
- Warnings recorded in the flow logs should be retained and reviewed; this report does not assert that all warnings were eliminated.
- No independent rerun was performed during this report-writing pass.
- No foundry signoff is claimed.

## 7. Demonstration checklist

1. Explain the fault input and pump-control outputs.
2. Show the RTL and the four self-checking testbenches.
3. Show Surfer waveforms and VCD files from P4 and corner-case evidence from P5.
4. Show synthesis statistics/checks in P6.
5. Show floorplan, placement, CTS, and global-route reports in P7–P10.
6. Show final timing/DRC/layout evidence in P11.
7. Show GDS Inspector 2D/3D views in P12 and the LVS match result in P13.
8. Show the artifact integrity manifest in P14.
9. Explain the limitations above without claiming foundry signoff.

## 8. Pre-push status

Documentation and final handoff material have been updated in this snapshot. Before publishing, inspect the actual Git working tree, `.gitignore`, staged diff, and all candidate files for secrets or machine-specific data. Decide deliberately whether to commit generated databases, logs, GDS, screenshots, and VCDs. Do not push until that review is complete.
