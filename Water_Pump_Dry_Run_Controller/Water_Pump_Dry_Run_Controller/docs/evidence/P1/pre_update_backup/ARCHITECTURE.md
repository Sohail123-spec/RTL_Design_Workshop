# Architecture

## Project name
**Digital Water Pump Dry-Run Protection and Automatic Restart Controller**

## Purpose and boundary
A small digital controller for pump protection. It receives an external digital dry-run fault indication and manages pump permission, fault status, lockout timing, and restart decisions. It does not sense water level or flow itself and does not drive a motor directly.

```text
External detector -- dry_run_fault --+
Pump request ------ pump_demand -----+--> Protection Controller --> pump_enable
Clock/reset -------------------------+                         --> fault_status
```

## Top-level interface proposal
Inputs: `clk`, `reset`, `pump_demand`, `dry_run_fault`.
Outputs: `pump_enable`, `fault_status`.
Parameter: `LOCKOUT_CYCLES`, with minimum value and exact cycle semantics to be frozen before RTL.

## Functional blocks
1. **Control FSM:** idle, running, lockout, and recovery/recheck behavior.
2. **Lockout timer:** synchronous counter with documented load/count/expiry behavior.
3. **Fault-status register:** records detected fault; exact clear condition must be frozen.
4. **Output control:** pump enable defaults low in reset, idle, lockout, and fault conditions; it may be high only when running is permitted.

## Proposed sequence
1. Reset/idle: pump disabled.
2. If demand is high and no fault is active, permit running.
3. If fault is sampled high, disable pump and record fault.
4. Keep pump disabled during the lockout interval.
5. At interval expiry, recheck fault and demand.
6. Restart only if fault is inactive and demand remains asserted; otherwise stay disabled and follow the specified wait/recheck policy.
7. If demand is absent, do not restart.

Exact cycle transitions and fault-clear policy remain open until `DECISIONS.md` is resolved.

## Clock/reset
One clock domain; active-high synchronous reset; no generated clocks. Inputs are assumed synchronous for the RTL simulation model. Physical integration must define synchronization if external signals are asynchronous.

## Safety properties
- SAFE-01: pump enable is low during reset.
- SAFE-02: pump enable is never high while sampled `dry_run_fault` is high.
- SAFE-03: pump enable is low throughout lockout.
- SAFE-04: demand cannot bypass a recorded fault.
- SAFE-05: restart requires fault inactive and demand asserted at the defined recheck.
- SAFE-06: reset during any state returns to safe state.

## Scope discipline
No analog front end, processor, bus, memory, multiple pumps, variable-speed drive, adaptive timing, or communication interfaces in V1.
