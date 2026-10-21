# Digital Water Pump Dry-Run Protection and Automatic Restart Controller

**Current status:** RTL simulation, synthesis, and the main Sky130HD physical-design flow have been run. Evidence and generated outputs are included in this project snapshot. Documentation was brought up to date in the pre-publication documentation pass dated 2026-10-21.

## Source of truth
1. `docs/PROJECT_SPEC.md` — requirements and scope.
2. `docs/ARCHITECTURE.md` — block-level design.
3. `docs/DECISIONS.md` — accepted design decisions.
4. `docs/RTL_PLAN.md` — implementation approach and gates.
5. `docs/VERIFICATION_PLAN.md` — tests and pass criteria.
6. `docs/PD_PLAN.md` — synthesis and physical-design flow.
7. `docs/EVIDENCE_PLAN.md` — evidence inventory and checkpoint mapping.
8. `docs/PROGRESS.md` — current status and checkpoint summary.
9. `docs/MEMORY.md` — append-only engineering handoff log.

## V1 design
Inputs: `clk`, active-high synchronous `reset`, `pump_demand`, and external active-high `dry_run_fault`.
Outputs: `pump_enable` and `fault_status`.
The controller does not measure water flow or implement physical sensors. An external detector supplies `dry_run_fault`.

## Results snapshot
- Four self-checking simulation testbenches and their waveform files are included.
- Yosys synthesis, floorplan, placement, CTS, global/detailed routing, final timing/reporting, GDSII, DRC and LVS artifacts are included in the supplied audit archive.
- Evidence screenshots are stored under `docs/evidence/Pxx/`.
- Read `docs/PROGRESS.md` for the checkpoint-level results and limitations before reproducing or presenting the project.

## Important limitations
- Reported zero DRC violations applies to the included run/reports and the checks supported by that flow; it is not a claim of foundry signoff.
- LVS evidence reports that the compared netlists match.
- Positive reported setup slack is specific to the included constraints, libraries, corner, and flow configuration. It is not a universal timing guarantee.
- The RTL consumes a digital fault signal; it does not implement sensor conditioning, synchronization of asynchronous signals, or motor power circuitry.
- Do not modify frozen RTL or flow configuration merely to improve presentation. Any later implementation change requires rerunning affected verification and implementation stages.

## Checkpoint rule
A plan, compile, or source file alone is not a PASS. Checkpoint status must be supported by the included logs/reports/evidence and the limitations recorded in `docs/PROGRESS.md`.
