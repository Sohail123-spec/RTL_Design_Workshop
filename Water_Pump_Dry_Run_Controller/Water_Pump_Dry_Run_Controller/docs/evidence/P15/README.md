# P15 — Final project report and demonstration handoff

This folder contains the final report and an existing generated layout overview. The layout image is an OpenROAD-flow generated visualization from the archived run, not a newly captured screenshot.

## Contents
- `../../FINAL_REPORT.md` — final implementation, verification, physical-design results, and limitations.
- `pump_controller_final_layout_overview.webp` — generated final-layout overview, if included.

## Suggested demo order
1. Introduce the dry-run protection controller and its external `dry_run_fault` input.
2. Show `rtl/pump_protection_controller.v` and describe the controller outputs.
3. Show the four testbench files and their existing Surfer waveform screenshots/VCD files in P4.
4. Show synthesis statistics and the zero-problem synthesis check in P6.
5. Walk through floorplan, placement, CTS, global-route, and final timing evidence in P7–P11.
6. Show the GDS Inspector 2D/3D views in P12.
7. Show the LVS match message in P13 and the final artifact hash manifest in P14.
8. State the constraints and limitations honestly; do not claim foundry signoff.

## Completion boundary
The included implementation and flow artifacts are complete enough to document the archived run. A live repository Git diff/status review, secret scan, and final decision about which generated artifacts to commit remain pre-push actions. This ZIP is not itself proof that the live working tree is clean.
