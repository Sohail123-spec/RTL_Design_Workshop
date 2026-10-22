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


## Evidence and checkpoint guide

**Visual evidence:** Each checkpoint README embeds its available screenshots directly using relative Markdown image links. The image files are also retained separately in their checkpoint folders.

The checkpoint evidence is organized under [`docs/evidence/`](./docs/evidence/). Each checkpoint folder contains a README explaining the purpose of the evidence, the files captured, how to interpret the results, and the limits of what the evidence demonstrates.

| Checkpoint | Evidence focus | Folder |
|---|---|---|
| P0 | Proposal/environment baseline (historical baseline only) | [P0](./docs/evidence/P0/) |
| P1 | Frozen specification and architecture decisions | [P1](./docs/evidence/P1/) |
| P2 | RTL implementation | [P2](./docs/evidence/P2/) |
| P3 | Initial compile/test screenshot | [P3](./docs/evidence/P3/) |
| P4 | Simulation waveforms and VCD data | [P4](./docs/evidence/P4/) |
| P5 | Reset, lockout-boundary, persistent-fault, and invalid-parameter checks | [P5](./docs/evidence/P5/) |
| P6 | Synthesis status, statistics, checks, and netlist files | [P6](./docs/evidence/P6/) |
| P7 | Flow setup and floorplanning | [P7](./docs/evidence/P7/) |
| P8 | Standard-cell placement | [P8](./docs/evidence/P8/) |
| P9 | Clock-tree synthesis (CTS) | [P9](./docs/evidence/P9/) |
| P10 | Global routing | [P10](./docs/evidence/P10/) |
| P11 | Final timing, DRC count, violation checks, and routed layout | [P11](./docs/evidence/P11/) |
| P12 | GDSII output and 2D/3D visual inspection | [P12](./docs/evidence/P12/) |
| P13 | LVS netlist comparison | [P13](./docs/evidence/P13/) |
| P14 | Final artifact inventory and SHA-256 manifest | [P14](./docs/evidence/P14/) |
| P15 | Final report and demonstration handoff | [P15](./docs/evidence/P15/) |

**Evidence discipline:** Screenshots, reports, and archived logs are evidence of the specific captured run. They should not be described as fresh reruns, and zero reported DRC or matching LVS netlists do not constitute foundry signoff.

See [`docs/EVIDENCE_PLAN.md`](./docs/EVIDENCE_PLAN.md), [`docs/PROGRESS.md`](./docs/PROGRESS.md), and [`docs/FINAL_REPORT.md`](./docs/FINAL_REPORT.md) for the inventory, current checkpoint status, and overall results/limitations.

---
