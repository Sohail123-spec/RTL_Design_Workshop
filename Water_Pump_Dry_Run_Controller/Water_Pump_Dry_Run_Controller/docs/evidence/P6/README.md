# P6 — RTL Synthesis Evidence

## Purpose
P6 records synthesis of the controller and the available checks/statistics and netlist evidence from the archived flow.

## Evidence in this folder
- [`pump_controller_synthesis_pass.png`](./pump_controller_synthesis_pass.png) — synthesis completion evidence.
- [`pump_controller_synthesis_statistics.png`](./pump_controller_synthesis_statistics.png) — synthesis statistics.
- [`pump_controller_synthesis_check.png`](./pump_controller_synthesis_check.png) — synthesis check output.
- [`pump_controller_netlist_files.png`](./pump_controller_netlist_files.png) — generated netlist/file inventory.
- Generated reports and netlists are also available in the `flow/` output tree.

## Recorded synthesis facts
The project progress notes report:
- Synthesized area: **454.1856 library area units**.
- Sequential area: **180.1728 library area units** (reported as 39.67%).
- Standard-cell count: **50**.
- `synth_check.txt`: **“Found and reported 0 problems.”**

These figures describe the included synthesis run and its library/configuration; they are not technology-independent physical dimensions.

## Review checklist
- [ ] Check the synthesis completion screenshot.
- [ ] Review cell counts and area in the statistics screenshot/report.
- [ ] Confirm the synthesis check output reports no problems.
- [ ] Inspect the generated netlist if explaining how RTL mapped to standard cells.
- [ ] Keep synthesis results distinct from placement/routing and signoff claims.

**Status note:** P6 is recorded as passed in the project progress log based on the included outputs.

## Related evidence
- [P5 — Safety/corner tests](../P5/README.md)
- [P7 — Floorplanning](../P7/README.md)
