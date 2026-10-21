# Design Decisions and Open Questions

## Accepted project-level decisions
| ID | Decision | Status |
|---|---|---|
| D-001 | Project is Digital Water Pump Dry-Run Protection and Automatic Restart Controller. | Accepted |
| D-002 | Use an external active-high digital `dry_run_fault` input. | Accepted |
| D-003 | No processor, firmware, bus, memory, or cloud dependency. | Accepted |
| D-004 | Use FSM, timer counter, and fault-status register. | Accepted conceptually |
| D-005 | One clock domain and active-high synchronous reset. | Accepted — P1, 2026-10-21 |
| D-006 | Lockout duration is a Verilog parameter; `LOCKOUT_CYCLES >= 1` with the frozen E0-to-EN edge convention. | Accepted — P1, 2026-10-21 |
| D-007 | Self-checking simulation before synthesis/physical design. | Accepted |
| D-008 | Do not claim area/timing/GDS success without actual results. | Accepted |

## Must resolve before RTL (P1)
| ID | Question | Recommended default to review | Status |
|---|---|---|---|
| Q-001 | When does lockout start/restart? | Start on entry; if fault persists at recheck, begin a new full interval. | Resolved — see frozen P1 decisions below |
| Q-002 | Demand drops during lockout? | Continue lockout; do not restart unless demand is high at recheck. | Resolved — see frozen P1 decisions below |
| Q-003 | When does `fault_status` clear? | Clear only after successful recovery, or explicitly define another policy. | Resolved — see frozen P1 decisions below |
| Q-004 | Fault high after reset release? | Never enable pump; record and handle according to frozen policy. | Resolved — see frozen P1 decisions below |
| Q-005 | Exact timer cycle convention? | Expiry after exactly `LOCKOUT_CYCLES` full count intervals. | Resolved — see frozen P1 decisions below |
| Q-006 | Legal parameter values? | Require `LOCKOUT_CYCLES >= 1`; document/check the constraint. | Resolved — see frozen P1 decisions below |
| Q-007 | Fault during restart/recovery? | Fault has priority and suppresses pump enable. | Resolved — see frozen P1 decisions below |
| Q-008 | External input timing? | Simulation assumes synchronous inputs; integration defines synchronizers if needed. | Resolved — see frozen P1 decisions below |

## Frozen P1 decisions — accepted 2026-10-21

| ID | Decision | Frozen policy |
|---|---|---|
| Q-001 | Lockout start/retry | Start a full interval on fault detection. If fault is high at recheck, start another full interval. |
| Q-002 | Demand drops during lockout | Do not reset the timer. At recheck, absent demand prevents restart and starts another full interval. |
| Q-003 | `fault_status` clearing | Set on detected fault; retain through lockout and unsuccessful rechecks; clear only on successful recovery/restart. Reset clears it. |
| Q-004 | Fault high after reset | Pump remains disabled; sampled fault is recorded and starts lockout. |
| Q-005 | Timer expiry convention | E0 is the fault-detection/entry rising edge; for N=`LOCKOUT_CYCLES`, recheck is at EN, exactly N rising-edge intervals later. N=1 means the next rising edge. |
| Q-006 | Legal parameter value | `LOCKOUT_CYCLES >= 1`; zero is invalid and must not silently become one. |
| Q-007 | Fault during restart/recovery | Sampled high fault has priority and prevents the pump from being enabled. |
| Q-008 | External input timing | RTL assumes inputs synchronous to `clk`; real integration must add appropriate synchronization for asynchronous inputs. |
| Q-009 | Demand while running | Sampled low demand turns the pump off on that edge and returns the controller to idle, unless fault handling takes priority. |
| Q-010 | Demand absent at lockout expiry | Remain disabled, retain `fault_status`, and start another full lockout interval before rechecking both inputs. |

### Freeze acceptance
All Q-001 through Q-010 policies above were explicitly accepted by the user on 2026-10-21. These decisions are the authority for the V1 specification, architecture, RTL, and verification plan. No RTL has been written by this documentation update.

## Change control
Before changing a frozen decision, explain why, update this file and affected specs/tests, review area/timing/verification impact, then change RTL.
