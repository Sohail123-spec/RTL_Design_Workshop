# P2 — RTL Implementation Evidence

## Purpose
This checkpoint documents the synthesizable Verilog RTL implementation of the water-pump protection controller.

## Evidence in this folder
- [`P2_rtl_module.png`](./P2_rtl_module.png) — screenshot of the RTL module.
- Main source: [`pump_protection_controller.v`](../../../rtl/pump_protection_controller.v).

## Design interface
The controller accepts `clk`, active-high synchronous `reset`, `pump_demand`, and external active-high `dry_run_fault`. It drives `pump_enable` and `fault_status`.

## What to inspect
1. Review the module ports and parameter declarations.
2. Follow the state-machine logic for idle, running, and lockout/recovery behavior.
3. Check that a sampled fault disables the pump and records fault status.
4. Confirm the lockout parameter boundary is enforced and that restart requires both a cleared fault and active demand.

## Acceptance checklist
- [ ] RTL matches the frozen requirements in `docs/PROJECT_SPEC.md`.
- [ ] Reset and fault priority are clear in the implementation.
- [ ] No physical sensor, analog front end, or motor driver is claimed as part of this RTL module.

**Status note:** The progress log records P2 as passed with the source present. The screenshot supplements the source file; it is not a substitute for reviewing the RTL.

## Related evidence
- [P3 — Initial compile/test evidence](../P3/README.md)
- [P4 — Simulation waveforms](../P4/README.md)
- [P5 — Safety and corner cases](../P5/README.md)
