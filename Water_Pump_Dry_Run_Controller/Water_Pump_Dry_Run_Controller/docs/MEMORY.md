# Project Memory / Engineering Log

Append a dated entry after every meaningful checkpoint; do not erase earlier entries. This file is the handoff record for continuing in another chat or with another engineer.

## Current source of truth
- **Project:** Digital Water Pump Dry-Run Protection and Automatic Restart Controller.
- **Application:** Digital pump protection for water supply/agriculture/irrigation use cases.
- **Detection boundary:** External active-high digital `dry_run_fault`; RTL does not measure flow or water level.
- **Inputs proposed:** `clk`, `reset`, `pump_demand`, `dry_run_fault`.
- **Outputs proposed:** `pump_enable`, `fault_status`.
- **Sequential elements:** FSM, lockout timer/counter, fault-status register.
- **Configuration:** `LOCKOUT_CYCLES` Verilog parameter; no runtime bus/config interface in V1.
- **Reset proposal:** Active-high synchronous reset.
- **Status:** P1 decisions accepted; RTL simulation and the main Sky130HD physical-design flow have been run. Current handoff is documentation synchronization and pre-push repository hygiene. See `docs/PROGRESS.md` for checkpoint statuses and limitations.

## Hard constraints
- No processor, firmware, OS, cloud, bus, memory, or analog front end.
- No physical sensor or motor driver implemented in this RTL project.
- Do not claim RTL alone guarantees physical pump safety.
- Do not invent area/timing limits or claim GDS feasibility before actual flow results.
- Follow trainer checklist and require evidence for every PASS.
- Keep the design compact, self-checking, and explainable.

## Dated log

### 2026-10-15 — Initial documentation baseline
- Reviewed trainer checklist screenshots and proposal fields.
- Selected processor-free pump dry-run protection controller concept.
- Chose external digital fault input (Option A).
- Prepared proposal answers; user reported submitting the form.
- Created initial project specification, architecture, decision log, RTL plan, verification plan, physical-design plan, evidence plan, progress log, and memory log.
- **Result:** Documentation baseline created; P0 remains IN PROGRESS; P1 is NOT STARTED/PASS not claimed.
- **Next:** Resolve open architecture decisions and identify the actual training platform/constraints before RTL.

## Append template
### YYYY-MM-DD — Checkpoint/change
- Reason:
- Files changed:
- Commands/tests:
- Actual result:
- Evidence path:
- Status: PASS / FAIL / BLOCKED / IN PROGRESS
- Open issues:
- Next action:

### 2026-10-20 — Codespace setup
- Chose to use the VS Code integrated terminal exclusively; noVNC is not required for the project workflow.
- Extracted the initial documentation into the separate Water_Pump_Dry_Run_Controller folder under /workspaces/vsd-rtl.
- Confirmed the main architecture, design-decision, progress, and memory documents exist.
- Historical initial environment findings (superseded by the later Codespace audit below): Ubuntu 22.04 x86_64; Icarus Verilog 11.0; Yosys 0.9; KLayout 0.26.2; OpenROAD/OpenSTA absent in that earlier audit; 29 GB free disk and about 5.7 GB available RAM at that time.
- No pump-controller RTL has been written or verified yet.
- Evidence target: docs/evidence/P0/environment_audit.txt.
- Next: verify environment evidence and establish a compatible physical-de


### Latest Codespace environment audit — 2026-10-21
- A previous audit note reported Yosys `0.70+176 (git sha1 365bb887b)` and Icarus Verilog `14.0 (devel)`, but these versions were not reproduced by direct executable checks on 2026-10-21.
- Confirmed by direct checks on 2026-10-21: Yosys `0.9 (git sha1 1979e0b)` and Icarus Verilog `11.0 (stable)`.
- OpenROAD: `26Q2-1164-g08f67ee5ec`.
- OpenSTA: `3.1.0`.
- KLayout: `0.30.12`.
- ORFS checkout: `tools/OpenROAD-flow-scripts`, commit `bf3f9b344`, branch `master`.
- Reference GCD flow results validate only the reference flow/tool setup, not the water-pump controller. GCD timing had setup violations; do not claim timing pass.
- Evidence file to verify: `docs/evidence/P0/environment_audit.txt`.


### 2026-10-21 — P1 documentation closeout
- P1 decisions Q-001 through Q-010 accepted; frozen E0-to-EN convention specifies recheck exactly N clock intervals after lockout entry, including N=1 at the next rising edge.
- `LOCKOUT_CYCLES < 1` is invalid; the approved policy is simulation-time `$fatal`, with legal synthesis configuration `LOCKOUT_CYCLES >= 1`.
- P1 documentation checks passed; P1 marked PASS for architecture/documentation freeze only.
- Environment follow-up evidence: `docs/evidence/P1/environment_audit_2026-10-21.txt`; historical P0 evidence remains preserved.
- No pump-controller RTL was written or verified. Do not begin RTL until the user explicitly authorizes implementation after discussion.


### 2026-10-21 — Documentation synchronization after RTL-to-GDS implementation
- Reason: The uploaded audit archive contains the implemented controller, four testbenches, VCD waveforms, Surfer screenshots, synthesis/physical-design evidence, final GDSII, DRC summary, and LVS log, while the progress and handoff docs still described an RTL-not-started state.
- Files changed: `README.md`, `docs/PROGRESS.md`, `docs/MEMORY.md`, `docs/EVIDENCE_PLAN.md`, `docs/PD_PLAN.md`, `docs/VERIFICATION_PLAN.md`, and stale status statements in `docs/PROJECT_SPEC.md`, `docs/DECISIONS.md`, and `docs/RTL_PLAN.md`.
- Commands/tests: Documentation and archive-inventory review only; no RTL, testbench, SDC, platform config, or physical-design output was changed or rerun in this documentation pass.
- Actual result: Status and evidence mapping now reflect the included artifacts. Four testbench pass counts and reported stage metrics are recorded in `docs/PROGRESS.md`; DRC/LVS and timing claims are qualified to the included run and supported checks.
- Evidence path: `docs/evidence/P2/` through `docs/evidence/P13/`; ORFS outputs under `flow/results/sky130hd/pump_protection_controller/base/`, reports under `flow/reports/.../base/`, and logs under `flow/logs/.../base/`.
- Status: DOCUMENTATION UPDATED; pre-push audit still required.
- Open issues: P14 and P15 contain README placeholders only; review full warnings/configuration and check `.gitignore`, repository status, and secrets before pushing.
- Historical-status note: the P14/P15 placeholder statement above was superseded by the later `2026-10-21 — P14/P15 handoff closeout` entry below, which records the SHA-256 manifest, final report, demo guidance, and layout overview. Independent rerun and repository pre-push hygiene remain pending.
- Next action: run repository hygiene checks, inspect the intended Git diff, then push only the intended project changes. Finish the final report/demo package after the push or as agreed.


## 2026-10-21 — P14/P15 handoff closeout

The documentation pass added `docs/FINAL_REPORT.md`, completed P14 with an artifact SHA-256 manifest, and completed P15 with demo guidance and the archived final-layout overview. The report is based on the included files and previously recorded testbench outcomes; no RTL simulation or OpenROAD rerun was performed. DRC and LVS claims are deliberately scoped to the included run/logs and do not imply foundry signoff. Git working-tree hygiene, secret scanning, staged-diff review, and artifact commit policy remain pending before push.
