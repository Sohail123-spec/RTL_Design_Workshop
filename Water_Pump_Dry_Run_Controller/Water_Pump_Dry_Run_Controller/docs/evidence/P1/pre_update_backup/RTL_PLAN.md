# RTL Implementation Plan

## Coding rules
- Synthesizable Verilog-2001 unless the supplied flow requires otherwise.
- One clock domain, active-high synchronous reset.
- No generated clocks, simulation delays, or testbench constructs in RTL.
- Avoid inferred latches.
- Do not write RTL until P1 decisions are resolved.

## Proposed tree
```text
rtl/
  pump_protection_controller.v
tb/
  pump_protection_controller_tb.v
simulation/
reports/
constraints/
```
Start with one RTL module unless splitting it provides a clear benefit.

## Checkpoints
- P0: proposal and scope; proposal submitted (user-reported).
- P1: freeze interface, FSM, timer semantics, fault-clear policy, reset and corner cases.
- P2: implement RTL from frozen architecture.
- P3: compile/lint; review all warnings.
- P4: self-checking simulation passes.
- P5: safety/corner-case regression passes.
- P6: synthesis baseline and area statistics.
- P7: identify actual platform/PDK and constraints.
- P8: floorplan and power planning.
- P9: placement.
- P10: CTS if required.
- P11: STA and critical-path review.
- P12: routing.
- P13: DRC/LVS checks supported by the flow.
- P14: verify generated GDS and record exact path/results.
- P15: final report and demonstration.

## Gate rule
Do not advance merely because a command ran. Require the checkpoint's evidence and acceptance criteria. A failure returns the project to the relevant fix-and-retest step.
