# Project Progress

**Current status:** Proposal submitted; architecture not yet frozen.  
**Last updated:** 2026-10-15

| Checkpoint | Status | Notes |
|---|---|---|
| P0 — Proposal and scope | IN PROGRESS | Project selected and Google Form submitted (user-reported). |
| P1 — Architecture freeze | NOT STARTED | Resolve `DECISIONS.md` questions first. |
| P2 — RTL implementation | NOT STARTED | No new-project RTL approved or tested. |
| P3 — Compile/lint | NOT STARTED | Requires RTL. |
| P4 — Self-checking simulation | NOT STARTED | Requires RTL/testbench. |
| P5 — Safety regression | NOT STARTED | Requires passing simulation. |
| P6 — Synthesis baseline | NOT STARTED | Requires verified RTL/platform. |
| P7 — Flow preparation | NOT STARTED | Actual platform/constraints must be identified. |
| P8 — Floorplan | NOT STARTED | Blocked on earlier checkpoints. |
| P9 — Placement | NOT STARTED | Blocked on earlier checkpoints. |
| P10 — CTS | NOT STARTED | If required by flow. |
| P11 — STA | NOT STARTED | Blocked on implementation. |
| P12 — Routing | NOT STARTED | Blocked on implementation. |
| P13 — DRC/LVS | NOT STARTED | Depends on flow support. |
| P14 — GDS | NOT STARTED | No GDS generated for this project. |
| P15 — Final report/demo | NOT STARTED | Depends on results. |

## Completed
- Reviewed trainer checklist screenshots.
- Selected processor-free digital pump-protection concept.
- Chose external active-high digital `dry_run_fault`.
- Prepared proposal text; user reported submitting it.

## Blockers
- Freeze timer cycle semantics and retry policy.
- Freeze fault-status clear condition.
- Freeze demand-removal behavior during lockout.
- Freeze fault behavior at reset release.
- Identify actual PDK/platform and physical-flow constraints.

## Update protocol
After every meaningful checkpoint, append date, changed files, commands/tests, actual result, evidence path, status (PASS/FAIL/BLOCKED/IN PROGRESS), open issues, and next action. Never mark PASS without evidence.

### 2026-10-20 — Codespace documentation and environment audit
- Files checked: README.md and docs/ARCHITECTURE.md, DECISIONS.md, PROGRESS.md, MEMORY.md.
- Documentation ZIP extracted into the separate Water_Pump_Dry_Run_Controller project folder.
- Environment audit recorded at docs/evidence/P0/environment_audit.txt.
- Existing repository workshop files were not intentionally modified.
- Physical-design toolchain is not yet verified as complete; OpenROAD and OpenSTA were missing in the earlier audit, and installed Yosys/KLayout versions need compatibility checks.
- Status: IN PROGRESS; P0 is not yet declared PASS.
- Next: verify the audit output, finish the toolchain setup, then resolve and freeze P1 architecture decisions.
