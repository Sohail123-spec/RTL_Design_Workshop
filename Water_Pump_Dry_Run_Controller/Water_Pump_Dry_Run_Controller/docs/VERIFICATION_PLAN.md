# Verification Plan

Use a self-checking Verilog testbench with deterministic stimulus, explicit expected-output checks, and a non-zero exit on failure.

## Required scenarios
| ID | Scenario | Expected result |
|---|---|---|
| T-01 | Reset | Pump disabled; safe initial state |
| T-02 | Demand with no fault | In idle, sampled demand high with fault low starts the pump on that rising edge; demand low keeps it disabled. |
| T-03 | Demand removed while running | Sampled demand low disables the pump on that rising edge and returns to idle, unless a sampled fault takes priority. |
| T-04 | Fault while running | Pump disabled and fault recorded |
| T-05 | Fault persists through lockout | No restart |
| T-06 | Fault clears before recheck; demand stays high | Restart only at defined recheck |
| T-07 | Fault persists at recheck | Remain disabled and start another wait interval |
| T-08 | Demand drops during lockout | Current timer continues unchanged; if demand is low at expiry, remain disabled, retain status, and begin another full interval. |
| T-09 | Demand returns after lockout | Demand returning before expiry does not shorten the timer; restart is considered only at the defined expiry edge. |
| T-10 | Minimum lockout value | Exact expiry cycle |
| T-11 | Reset while running | Pump disabled and state reset |
| T-12 | Reset during lockout | Pump disabled and timer/state reset |
| T-13 | Fault high after reset release | Sampled fault keeps the pump disabled, sets status, and begins lockout. |
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

## Frozen P1 expected behavior (accepted 2026-10-21)

Apply these exact expectations to the scenarios above:

1. Reset synchronously forces `pump_enable=0`, resets the timer/FSM, and clears `fault_status`.
2. In idle, demand high with fault low starts the pump at the next defined sampling edge. Demand low keeps it off.
3. While running, sampled demand low turns the pump off on that edge and returns to idle. A sampled fault takes priority, turns the pump off, sets status, and begins lockout.
4. Let E0 be the fault-detection/lockout-entry rising edge. For N=`LOCKOUT_CYCLES`, recheck occurs at EN, exactly N rising-edge intervals later. For N=1, recheck is at the very next rising edge. Input changes do not restart or shorten the current interval.
5. At expiry/recheck, restart only if fault low and demand high. A successful restart clears `fault_status`.
6. If fault is high at recheck, remain disabled, retain status, and start a new full interval.
7. If demand is low at recheck—even if the fault is low—remain disabled, retain status, and start a new full interval. Do not return directly to idle.
8. A fault sampled high after reset release must never permit pump enable; it is recorded and lockout begins.
9. Test `LOCKOUT_CYCLES=1` with recheck at the next rising edge after E0, plus a larger value, reset during lockout, repeated faults, and near-edge input changes using race-free stimulus.
10. Parameter value zero is invalid. The chosen implementation-time/simulation guard must fail visibly rather than silently reinterpret zero.

This plan defines the verification acceptance criteria. The current recorded simulation outcomes and available evidence are summarized in `docs/PROGRESS.md` and `docs/EVIDENCE_PLAN.md`; keep future run logs and coverage results synchronized with those records.
