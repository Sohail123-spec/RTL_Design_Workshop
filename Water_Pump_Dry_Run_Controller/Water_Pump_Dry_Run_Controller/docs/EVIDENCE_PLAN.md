# Evidence Plan and Captured Evidence Inventory

Evidence is stored under `docs/evidence/Pxx/`. This table reflects the checkpoint naming used by the current captured project evidence. The checkpoint names are a local evidence organization scheme, not a claim that a particular external rubric has identical numbering.

| Checkpoint | Purpose | Captured evidence / status |
|---|---|---|
| P0 | Proposal and environment baseline | `environment_audit.txt`; historical environment/reference-flow evidence only. Proposal submission is user-reported. |
| P1 | Frozen specification and architecture decisions | Source-of-truth docs and `environment_audit_2026-10-21.txt`; accepted Q-001–Q-010 policies recorded. |
| P2 | RTL implementation | `P2/P2_rtl_module.png` and `rtl/pump_protection_controller.v`. |
| P3 | Initial compile/test evidence | `P3/pump_controller_testbench_pass.png`. A full compile transcript is not separately archived in this folder. |
| P4 | Simulation and waveform evidence | Four testbench VCD files and four Surfer waveform screenshots: main, reset, lockout-1, persistent-fault. |
| P5 | Safety and corner cases | Screenshots for reset, lockout-1, persistent-fault, and invalid parameter behavior. |
| P6 | Synthesis | Synthesis check/statistics/pass and netlist-file screenshots; generated synthesis netlist and reports are in the ORFS output tree. |
| P7 | Flow configuration and floorplan | ORFS dry-run, floorplan timing/path/database screenshots, and floorplan report output. |
| P8 | Placement | Placement timing/path/database screenshots and placement report output. |
| P9 | CTS | CTS timing/path/database/layout screenshots and CTS report output. |
| P10 | Global routing | Global-route timing/path/violation screenshots. |
| P11 | Final timing/DRC/layout review | Final timing summary, violation checks, DRC count, and routed-layout screenshots. |
| P12 | GDSII generation and visual inspection | Final GDS file listing plus GDS Inspector 2D and 3D layout screenshots. |
| P13 | LVS | Screenshot of `6_lvs.log` reporting that compared netlists match. |
| P14 | Final artifact handoff and integrity inventory | `P14/README.md` and `P14/SHA256SUMS.txt`; identifies the included final GDS, reports, source RTL, and generated artifacts by SHA-256. |
| P15 | Final report/demo | `docs/FINAL_REPORT.md`, `P15/README.md`, and the archived generated final-layout overview (when present). |

## Important interpretation notes
- VCD files and waveform screenshots support the recorded simulation evidence; the prior run summary records main 18 checks, reset 9, lockout-1 5, and persistent-fault 9, with each testbench reporting its pass message.
- Stage timing numbers are specific to the archived configuration and reports. Preserve warnings and constraints context when reporting them.
- A zero DRC count is limited to the included flow's checks and does not imply foundry signoff.
- The LVS log says the compared netlists match; state this as the result of that comparison.
- Do not count the P0 reference GCD flow as a water-pump implementation result.
- The final report and artifact manifest are now present. A fresh reproducible command transcript was not generated in this documentation pass; capture it only if required by the trainer and without implying that a rerun occurred.
