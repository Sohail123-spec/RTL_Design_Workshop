# Synthesis and Physical-Design Plan / Results Record

## Objective
Take the verified RTL through the available Sky130HD OpenROAD-flow-scripts (ORFS) implementation flow, preserve generated artifacts, and report measured results without inventing limits or claiming foundry signoff.

## Recorded project flow
The supplied audit archive includes stage outputs, logs, and reports for:
1. RTL synthesis and synthesized netlist.
2. Floorplanning and power-distribution network generation.
3. Placement and placement optimization.
4. Clock-tree synthesis (CTS).
5. Global routing and detailed routing.
6. Final extraction/reporting and final database/netlist generation.
7. GDSII generation.
8. DRC report/count and LVS comparison.

Primary paths:
- Results: `flow/results/sky130hd/pump_protection_controller/base/`
- Reports: `flow/reports/sky130hd/pump_protection_controller/base/`
- Logs: `flow/logs/sky130hd/pump_protection_controller/base/`
- Stage screenshots: `Water_Pump_Dry_Run_Controller/docs/evidence/P6/` through `P13/` (within this project folder).

## Reported observations from the archived run
- Synthesis report: 50 standard cells; area 454.1856 library area units; sequential area 180.1728 (39.67%); `synth_check.txt` says zero problems.
- Floorplan timing: TNS/WNS 0; worst slack +15.26 ns.
- Placement timing: TNS/WNS 0; worst slack +14.57 ns.
- CTS timing: TNS/WNS 0; worst slack +14.82 ns; no setup/hold violations reported in the recorded report.
- Global-route timing: TNS/WNS 0; worst slack +14.80 ns.
- Final timing report: TNS/WNS 0; worst slack +14.80 ns; `core_clock period_min` about 1.47 ns and fmax about 678.21 MHz under the included constraints.
- GDSII: `6_final.gds` and final database/DEF/SPEF/netlist artifacts are present.
- DRC: `6_drc_count.rpt` reports 0 for the included run/checks.
- LVS: `flow/logs/sky130hd/pump_protection_controller/base/6_lvs.log` reports “Congratulations! Netlists match.”

These are recorded observations from the archived run, not a claim of foundry signoff. Timing depends on the supplied SDC, libraries, corner, and flow. The reports include warnings, including virtual-clock/SDC-related warnings and a dangling-net warning; these must not be silently omitted from a formal signoff statement.

## Reproduction and acceptance
- Do not rerun the flow merely to recreate screenshots; use the archived outputs unless a source/configuration change or reproducibility requirement justifies a rerun.
- If RTL, SDC, platform configuration, or flow settings change, rerun the affected verification and implementation stages and keep old evidence clearly distinguished from new evidence.
- A stage is PASS only when its output and relevant report are present and reviewed. A GDS file alone does not prove timing or signoff success.
- Before formal submission, archive the exact flow invocation/configuration and review the full final report/warnings in addition to the screenshots.
