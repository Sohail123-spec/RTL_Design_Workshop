# Project Specification

## Project identity
**Digital Water Pump Dry-Run Protection and Automatic Restart Controller**

## Problem
A pump can be damaged if it continues running during a dry-run or unsafe water-supply condition. An external detector may identify this condition, but a digital controller is needed to shut the pump down, retain fault information, and manage safe restart attempts.

## Proposed solution
A compact, processor-free synthesizable Verilog controller receives pump demand and an external digital dry-run fault indication. It disables the pump on fault, records fault status, waits for a parameterized lockout interval, and rechecks the fault and demand before restart.

## Included in V1
- One synchronous clock domain and active-high synchronous reset.
- `pump_demand` and external active-high `dry_run_fault` inputs.
- `pump_enable` and `fault_status` outputs.
- FSM, lockout counter/timer, fault-status register.
- Parameterized lockout duration.
- Self-checking testbench, RTL simulation, synthesis, timing inspection, and an attempt at the supplied RTL-to-GDS flow.

## Excluded from V1
Physical sensors, analog measurement, ADC/comparators, sensor conditioning, motor-driver/power circuitry, processor/firmware, bus or memory, cloud connectivity, adaptive control, multiple pumps, communications, and UI. The RTL alone is not a guarantee of physical pump safety.

## Functional requirements
- FR-01: Reset results in `pump_enable=0`.
- FR-02: Pump demand can start the pump only when run conditions are satisfied.
- FR-03: A sampled high `dry_run_fault` disables the pump by the defined synchronous response edge.
- FR-04: Fault status is recorded after fault detection.
- FR-05: Pump remains disabled during lockout.
- FR-06: At lockout expiry, restart is considered only if fault is low and demand is high.
- FR-07: If fault remains high at recheck, remain disabled and wait another interval.
- FR-08: If demand is absent at recheck, do not restart.
- FR-09: Lockout is a Verilog parameter, not a bus register.
- FR-10: Tests cover normal operation, reset, fault response, timer boundaries, persistent faults and restart eligibility.
- FR-11: Testbench checks that pump enable is never asserted while the sampled fault is active.
- FR-12: RTL must be understandable and explainable by the student.

## Proposed interface
| Signal | Direction | Width | Meaning |
|---|---|---:|---|
| `clk` | input | 1 | System clock |
| `reset` | input | 1 | Active-high synchronous reset |
| `pump_demand` | input | 1 | Request to run |
| `dry_run_fault` | input | 1 | External detector output; 1 means unsafe condition detected |
| `pump_enable` | output | 1 | Logic-level pump permission |
| `fault_status` | output | 1 | Recorded fault awaiting the defined recovery path |

## Frozen P1 behavior (accepted 2026-10-21)

- Clocking/reset: one clock domain; active-high synchronous reset. Reset forces `pump_enable=0`, clears controller state/timer, and clears `fault_status` as part of initialization.
- Fault priority: a sampled high `dry_run_fault` has priority over demand and recovery. It disables the pump on the sampling edge and sets `fault_status`.
- Lockout start/retry: start a full lockout interval when a fault is detected. If the fault is still high at recheck, start another full interval. A fault sampled high after reset release is recorded and starts lockout while the pump remains disabled.
- Timer convention: `LOCKOUT_CYCLES` must be an integer parameter value >= 1. Lockout comprises exactly that many complete clock intervals after entry; the RTL plan and tests must define and prove the precise expiry edge, including the minimum value of 1. Zero is invalid and must not silently be treated as one.
- Recheck/restart: at expiry, restart only when `dry_run_fault==0` and `pump_demand==1` at the recheck. If either condition fails, keep the pump disabled and start another full lockout interval before the next recheck. In particular, absent demand at expiry does not return directly to idle.
- Demand while running: when `pump_demand` is sampled low, turn the pump off on that sampling edge and return to idle, unless a sampled fault is present; fault handling has priority.
- Fault status: set on fault detection; retain through lockout and unsuccessful rechecks; clear only after a successful recovery/restart. Reset also clears it.
- Input timing: RTL verification assumes inputs are synchronous to `clk`. Hardware integration must synchronize asynchronous external signals as appropriate; synchronizers and analog conditioning are outside this RTL project's scope.
- Testbench timing: drive inputs away from the active sampling edge or otherwise avoid testbench races; check outputs after nonblocking assignments have settled.

These decisions supersede the previously listed open questions. Do not begin RTL until this document set is reviewed for consistency and the P1 checkpoint is recorded.
