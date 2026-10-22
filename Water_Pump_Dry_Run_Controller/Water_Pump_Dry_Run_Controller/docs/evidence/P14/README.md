# P14 — Final Artifact Handoff and Integrity Inventory

## Purpose
P14 documents the final artifact handoff and provides a SHA-256 manifest so reviewers can identify the exact files represented by this archive. It is an artifact-inventory checkpoint, not foundry signoff.

## Evidence in this folder
- [`SHA256SUMS.txt`](./SHA256SUMS.txt) — hashes for the artifacts listed in the manifest.
- The final outputs and reports are under `flow/results/sky130hd/pump_protection_controller/base/` and `flow/reports/sky130hd/pump_protection_controller/base/`.

## Key artifacts to review
- `6_final.gds` — final GDSII layout.
- `6_1_merged.gds` — merged GDSII output, if included.
- `6_final.odb` — final OpenROAD database.
- `6_final.def` — final DEF layout description.
- `6_final.v` — final gate-level Verilog netlist.
- `6_final.spef` — extracted parasitics.
- `6_finish.rpt` — final timing/report output.
- `6_drc_count.rpt` — DRC count report.
- `6_lvs.log` — LVS log.

## Snapshot facts recorded in the project report
- DRC count report value: `0`.
- Final report TNS/WNS: `0.00`.
- Reported worst slack: `14.80 ns`.
- `core_clock` minimum period: approximately `1.47 ns`; reported fmax approximately `678.21 MHz`.

These are configuration-specific archived results. Review the full reports and warnings before presenting them; they do not imply foundry signoff.

## Integrity review checklist
- [ ] Check that each listed file exists in the archive.
- [ ] Verify hashes with a SHA-256 utility from the project root, following the paths recorded in `SHA256SUMS.txt`.
- [ ] Confirm the manifest corresponds to the exact version being submitted.
- [ ] Do not regenerate or edit a hashed artifact after generating the manifest without refreshing the hashes.
- [ ] Keep generated reports and the final report consistent with the manifest.

## Completion boundary
This checkpoint supports traceability of the handoff snapshot. It does not claim an independent rerun, foundry signoff, or guarantee of silicon correctness.

## Related documentation
- [`FINAL_REPORT.md`](../../FINAL_REPORT.md)
- [`PROGRESS.md`](../../PROGRESS.md)
- [P12 — GDSII inspection](../P12/README.md)
- [P13 — LVS evidence](../P13/README.md)
