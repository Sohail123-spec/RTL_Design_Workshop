# P5 — Safety and Corner-Case Regression

## Purpose
P5 groups focused evidence for reset behavior, the one-cycle lockout boundary, persistent faults, and invalid parameter handling.

## Evidence inventory
- [`pump_controller_reset_pass.png`](./pump_controller_reset_pass.png) — reset-focused test result.
- [`pump_controller_lockout1_pass.png`](./pump_controller_lockout1_pass.png) — `LOCKOUT_CYCLES=1` boundary test result.
- [`pump_controller_persistent_fault_pass.png`](./pump_controller_persistent_fault_pass.png) — persistent-fault test result.
- [`pump_controller_invalid_parameter.png`](./pump_controller_invalid_parameter.png) — invalid parameter behavior.

## Safety properties being checked
- Reset leaves the pump disabled.
- A sampled fault takes priority over a run request.
- The pump remains disabled during lockout.
- A persistent fault causes another lockout interval rather than an unsafe restart.
- A zero/invalid lockout parameter is rejected rather than silently treated as a valid one-cycle interval.

## Review checklist
- [ ] Confirm the screenshots identify the expected test and outcome.
- [ ] Cross-check the one-cycle case with the frozen E0-to-EN timer convention in `docs/PROJECT_SPEC.md`.
- [ ] Verify persistent-fault recovery does not assert `pump_enable` while the fault remains active.
- [ ] Preserve failure output as well as pass output if a future regression exposes a defect.

**Status note:** The progress log records P5 as passed based on captured safety/corner-case evidence. This documentation pass did not rerun the tests.

## Related evidence
- [P4 — Waveforms](../P4/README.md)
- [P6 — Synthesis](../P6/README.md)
