# P12 — GDSII Generation and Visual Inspection

## Purpose
P12 documents the final GDSII output and the available visual inspection of the generated layout.

## Evidence inventory
- [`pump_controller_final_gds_file.png`](./pump_controller_final_gds_file.png) — screenshot showing the final GDS file.
- [`pump_controller_gdsii_layout_view.png`](./pump_controller_gdsii_layout_view.png) — 2D GDS Inspector layout view.
- [`pump_controller_gdsii_3d_layout_view.png`](./pump_controller_gdsii_3d_layout_view.png) — 3D GDS Inspector layout view.
- Final GDS path: `flow/results/sky130hd/pump_protection_controller/base/6_final.gds`.

## What this demonstrates
The archive includes a generated GDSII artifact and screenshots documenting its presence and visual inspection in a GDS viewer.

## Review checklist
- [ ] Confirm the final GDS file exists at the path above.
- [ ] Open the 2D view to inspect the layout geometry.
- [ ] Use the 3D view as a visualization aid, not as proof of electrical correctness.
- [ ] Cross-check with P11 final routing/DRC evidence and P13 LVS evidence.

**Status note:** The progress log records P12 as passed for the included GDS file and viewer evidence. This is not a claim of foundry signoff.

## Related evidence
- [P11 — Final timing/DRC/layout review](../P11/README.md)
- [P13 — LVS comparison](../P13/README.md)
- [P14 — Artifact integrity inventory](../P14/README.md)
