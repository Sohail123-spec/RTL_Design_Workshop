# Design Decisions and Open Questions

## Accepted project-level decisions
| ID | Decision | Status |
|---|---|---|
| D-001 | Project is Digital Water Pump Dry-Run Protection and Automatic Restart Controller. | Accepted |
| D-002 | Use an external active-high digital `dry_run_fault` input. | Accepted |
| D-003 | No processor, firmware, bus, memory, or cloud dependency. | Accepted |
| D-004 | Use FSM, timer counter, and fault-status register. | Accepted conceptually |
| D-005 | One clock domain and active-high synchronous reset. | Proposed; freeze before RTL |
| D-006 | Lockout duration is a Verilog parameter. | Accepted conceptually |
| D-007 | Self-checking simulation before synthesis/physical design. | Accepted |
| D-008 | Do not claim area/timing/GDS success without actual results. | Accepted |

## Must resolve before RTL (P1)
| ID | Question | Recommended default to review | Status |
|---|---|---|---|
| Q-001 | When does lockout start/restart? | Start on entry; if fault persists at recheck, begin a new full interval. | Open |
| Q-002 | Demand drops during lockout? | Continue lockout; do not restart unless demand is high at recheck. | Open |
| Q-003 | When does `fault_status` clear? | Clear only after successful recovery, or explicitly define another policy. | Open |
| Q-004 | Fault high after reset release? | Never enable pump; record and handle according to frozen policy. | Open |
| Q-005 | Exact timer cycle convention? | Expiry after exactly `LOCKOUT_CYCLES` full count intervals. | Open |
| Q-006 | Legal parameter values? | Require `LOCKOUT_CYCLES >= 1`; document/check the constraint. | Open |
| Q-007 | Fault during restart/recovery? | Fault has priority and suppresses pump enable. | Open |
| Q-008 | External input timing? | Simulation assumes synchronous inputs; integration defines synchronizers if needed. | Open |

## Change control
Before changing a frozen decision, explain why, update this file and affected specs/tests, review area/timing/verification impact, then change RTL.
