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
Parameter: `LOCKOUT_CYCLES >= 1`. E0 is the fault-detection/lockout-entry rising edge; for N=`LOCKOUT_CYCLES`, recheck occurs at EN, exactly N rising-edge intervals later. N=1 means the next rising edge.

## Functional blocks
1. **Control FSM:** idle, running, lockout, and recovery/recheck behavior.
2. **Lockout timer:** synchronous counter with documented load/count/expiry behavior.
3. **Fault-status register:** records a detected fault; it is cleared by synchronous reset or after a successful restart at the defined recheck edge. It remains set when the recheck does not permit restarting.
4. **Output control:** pump enable defaults low in reset, idle, lockout, and fault conditions; it may be high only when running is permitted.

## Proposed sequence
1. Reset/idle: pump disabled.
2. If demand is high and no fault is active, permit running.
3. If fault is sampled high, disable pump and record fault.
4. Keep pump disabled during the lockout interval.
5. At interval expiry, recheck fault and demand.
6. At the defined recheck edge, restart only if the sampled fault is inactive and demand remains asserted. A successful restart enters the running state and clears `fault_status`.
7. If the fault is active or demand is absent at recheck, keep the pump disabled, retain `fault_status`, and begin a fresh full lockout interval.
8. If demand is absent while idle, remain idle with the pump disabled.

The cycle transitions, lockout timing convention, restart eligibility, and fault-status clear behavior are defined by the frozen P1 transition contract below.

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

## Frozen P1 transition contract (accepted 2026-10-21)

- **Reset:** synchronous, active-high; pump output low, FSM idle, timer reset, and `fault_status` cleared.
- **Idle:** pump is disabled. A sampled fault sets `fault_status` and enters lockout. With no fault, sampled demand starts the pump. No demand keeps the controller idle.
- **Running:** pump is enabled only while demand is present and no sampled fault takes priority. Sampled fault disables the pump, sets `fault_status`, and enters lockout. Sampled demand low disables the pump and returns to idle.
- **Lockout:** pump stays disabled. E0 is the fault-detection/entry rising edge. The recheck edge EN is exactly N=`LOCKOUT_CYCLES` rising-edge intervals later; for N=1, recheck is at the next rising edge. Demand changes do not reset the current interval.
- **Recheck:** on the defined expiry edge, restart only if fault is low and demand is high. Successful restart enters running and clears `fault_status`. If fault is high, keep status set and start a fresh full lockout interval. If demand is low, keep status set and also start a fresh full lockout interval.
- **Parameter:** `LOCKOUT_CYCLES` must be >= 1. Values below 1 are invalid; simulation must reject them with `$fatal`. Synthesis configurations must use a legal value. Zero must never be silently normalized to one.
- **Sampling model:** inputs are assumed synchronous to `clk` for RTL simulation. Physical asynchronous inputs need synchronization outside this simplified functional model.

Frozen timer edge convention: E0 is the rising edge that detects the fault and enters lockout. For N=`LOCKOUT_CYCLES`, recheck occurs at EN, exactly N rising-edge intervals after E0; when N=1, this is the very next rising edge. At recheck, restart only if sampled fault is low and demand is high. Otherwise remain disabled, retain `fault_status`, and begin another full interval. Synchronous reset overrides normal operation. Tests must prove the boundary for N=1 and larger values. Sampled fault has priority over demand and restart eligibility.
