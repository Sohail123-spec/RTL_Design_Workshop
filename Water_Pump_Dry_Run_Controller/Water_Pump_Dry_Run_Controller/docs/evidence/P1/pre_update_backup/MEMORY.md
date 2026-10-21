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
- **Status:** Proposal submitted; architecture and exact timer/fault semantics not yet frozen; no new-project RTL tests have run.

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
- Initial environment findings: Ubuntu 22.04 x86_64; Icarus Verilog 11.0; Yosys 0.9; KLayout 0.26.2; OpenROAD/OpenSTA absent in the earlier tool audit; 29 GB free disk and about 5.7 GB available RAM at that audit.
- No pump-controller RTL has been written or verified yet.
- Evidence target: docs/evidence/P0/environment_audit.txt.
- Next: verify environment evidence and establish a compatible physical-de