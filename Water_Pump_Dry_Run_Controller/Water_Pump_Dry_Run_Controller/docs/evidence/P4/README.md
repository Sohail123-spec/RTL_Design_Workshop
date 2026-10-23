# P4 — Simulation and Waveform Evidence

## Purpose
P4 contains the captured simulation waveforms for the main controller behavior and three focused scenarios: reset, lockout duration of one cycle, and persistent fault.

## Evidence inventory

| Scenario | Waveform image | VCD waveform data |
|---|---|---|
| Main controller scenarios | [`pump_controller_main_waveform.png`](./pump_controller_main_waveform.png) | [`pump_controller_main_waveform.vcd`](./pump_controller_main_waveform.vcd) |
| Reset behavior | [`pump_controller_reset_waveform.png`](./pump_controller_reset_waveform.png) | [`pump_controller_reset_waveform.vcd`](./pump_controller_reset_waveform.vcd) |
| `LOCKOUT_CYCLES=1` boundary | [`pump_controller_lockout1_waveform.png`](./pump_controller_lockout1_waveform.png) | [`pump_controller_lockout1_waveform.vcd`](./pump_controller_lockout1_waveform.vcd) |
| Persistent fault | [`pump_controller_persistent_fault_waveform.png`](./pump_controller_persistent_fault_waveform.png) | [`pump_controller_persistent_fault_waveform.vcd`](./pump_controller_persistent_fault_waveform.vcd) |

## What to look for
- Reset keeps `pump_enable` low and initializes controller status.
- A sampled dry-run fault disables the pump and records `fault_status`.
- The controller remains disabled during lockout.
- At lockout expiry, restart depends on the fault being low and demand being high.
- A persistent fault must not cause an unsafe restart.

Open the `.vcd` files in GTKWave, Surfer, or another compatible waveform viewer to inspect signal transitions. The PNGs are snapshots; VCD files provide the underlying recorded waveform data.

## Recorded test summary
The archived project notes report 18 checks in the main testbench, 9 in reset, 5 in lockout-1, and 9 in persistent-fault testing, with each testbench reporting its pass message. These numbers are transcribed from the existing project record; this README update did not rerun simulation.

## Review checklist
- [ ] Check signal timing around the active clock edge.
- [ ] Verify the lockout boundary against the convention in `docs/PROJECT_SPEC.md`.
- [ ] Confirm the pump is not enabled while the sampled fault is active.
- [ ] Keep the screenshots and VCD files together so the visual evidence can be cross-checked.

## Related evidence
- [P3 — Compile/test evidence](../P3/README.md)
- [P5 — Safety/corner regression](../P5/README.md)
