# Verification Plan

Use a self-checking Verilog testbench with deterministic stimulus, explicit expected-output checks, and a non-zero exit on failure.

## Required scenarios
| ID | Scenario | Expected result |
|---|---|---|
| T-01 | Reset | Pump disabled; safe initial state |
| T-02 | Demand with no fault | Starts only according to frozen start policy |
| T-03 | Demand removed while running | Follows documented demand-removal policy; never restarts without demand |
| T-04 | Fault while running | Pump disabled and fault recorded |
| T-05 | Fault persists through lockout | No restart |
| T-06 | Fault clears before recheck; demand stays high | Restart only at defined recheck |
| T-07 | Fault persists at recheck | Remain disabled and start another wait interval |
| T-08 | Demand drops during lockout | No restart while demand absent |
| T-09 | Demand returns after lockout | Matches frozen policy; no unintended immediate start |
| T-10 | Minimum lockout value | Exact expiry cycle |
| T-11 | Reset while running | Pump disabled and state reset |
| T-12 | Reset during lockout | Pump disabled and timer/state reset |
| T-13 | Fault high after reset release | Pump remains disabled and fault handled per policy |
| T-14 | Input transitions near clock edge | Deterministic sampled behavior; race-free testbench |
| T-15 | Repeated fault/recovery cycles | No deadlock or unsafe restart |

## Safety invariants
- Pump enable is low after a sampled reset.
- Pump enable is never high while sampled dry-run fault is high.
- Pump enable stays low during lockout.
- Restart requires documented recheck conditions.
- Fault-status set/clear matches frozen policy.
- No unknown output values after reset in the supported simulation model.

## Pass criteria
All mandatory tests pass; timer boundary counts match the specification; no unexplained warnings or X/Z outputs; safety invariants hold; logs and commands are saved. Simulation PASS does not imply synthesis, timing, or GDS PASS.
