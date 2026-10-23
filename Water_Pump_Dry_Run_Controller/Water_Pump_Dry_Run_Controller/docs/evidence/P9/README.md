# P9 — Clock-Tree Synthesis (CTS) Evidence

## Purpose
P9 records clock-tree synthesis (CTS) outputs and timing evidence after clock-tree implementation.

## Evidence inventory
- [`pump_controller_cts_timing_report.png`](./pump_controller_cts_timing_report.png) — CTS timing summary.
- [`pump_controller_cts_timing_path.png`](./pump_controller_cts_timing_path.png) — representative CTS timing path.
- [`pump_controller_cts_database.png`](./pump_controller_cts_database.png) — CTS database/layout view.
- [`cts_report_output.txt`](./cts_report_output.txt) — captured CTS report output.

## Recorded result
The project progress notes report TNS/WNS of 0 and worst slack of **+14.82 ns** for the archived CTS result.

## What to review
- Clock-tree stage output and the resulting database.
- Timing-path details and the constraints used for analysis.
- Any clock, SDC, or flow warnings included in the reports.
- The change from placement timing to CTS timing.

## Review checklist
- [ ] Verify the screenshots/report refer to the CTS stage.
- [ ] Inspect the report output to confirm displayed metrics.
- [ ] Avoid treating a stage-level timing summary as universal timing or silicon signoff.

**Status note:** P9 is recorded as passed in the project progress log for the included CTS outputs.

## Related evidence
- [P8 — Placement](../P8/README.md)
- [P10 — Global routing](../P10/README.md)
