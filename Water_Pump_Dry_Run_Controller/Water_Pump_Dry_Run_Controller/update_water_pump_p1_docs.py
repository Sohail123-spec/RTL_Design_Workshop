#!/usr/bin/env python3
"""Apply the agreed P1 documentation freeze without touching RTL or tool files."""
from pathlib import Path
from datetime import date
import re

ROOT = Path.cwd()
DOCS = ROOT / "docs"
required = [
    "PROJECT_SPEC.md", "ARCHITECTURE.md", "DECISIONS.md", "RTL_PLAN.md",
    "VERIFICATION_PLAN.md", "PROGRESS.md", "MEMORY.md"
]
missing = [name for name in required if not (DOCS / name).is_file()]
if missing:
    raise SystemExit("STOP: expected docs are missing: " + ", ".join(missing) +
                     "\nRun this script from the Water_Pump_Dry_Run_Controller project root.")

# Avoid overwriting any existing user's changes silently: save byte-for-byte backups first.
backup_dir = DOCS / "evidence" / "P1" / "pre_update_backup"
backup_dir.mkdir(parents=True, exist_ok=True)
for name in required:
    target = DOCS / name
    backup = backup_dir / name
    if not backup.exists():
        backup.write_bytes(target.read_bytes())

def read(name):
    return (DOCS / name).read_text(encoding="utf-8")

def write(name, content):
    (DOCS / name).write_text(content.rstrip() + "\n", encoding="utf-8")

def append_once(name, marker, block):
    text = read(name)
    if marker not in text:
        write(name, text.rstrip() + "\n\n" + block.strip() + "\n")

# PROJECT_SPEC: replace the old unresolved-question list with the accepted behavior.
name = "PROJECT_SPEC.md"
s = read(name)
replacement = '''## Frozen P1 behavior (accepted 2026-10-21)

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
'''
if re.search(r"(?m)^## Open before RTL freeze", s):
    s = re.sub(r"(?ms)^## Open before RTL freeze.*\Z", replacement, s)
elif "## Frozen P1 behavior (accepted 2026-10-21)" not in s:
    s = s.rstrip() + "\n\n" + replacement
write(name, s)

# DECISIONS: retain accepted decisions and change-control policy; replace open questions section.
name = "DECISIONS.md"
s = read(name)
replacement = '''## Frozen P1 decisions — accepted 2026-10-21

| ID | Decision | Frozen policy |
|---|---|---|
| Q-001 | Lockout start/retry | Start a full interval on fault detection. If fault is high at recheck, start another full interval. |
| Q-002 | Demand drops during lockout | Do not reset the timer. At recheck, absent demand prevents restart and starts another full interval. |
| Q-003 | `fault_status` clearing | Set on detected fault; retain through lockout and unsuccessful rechecks; clear only on successful recovery/restart. Reset clears it. |
| Q-004 | Fault high after reset | Pump remains disabled; sampled fault is recorded and starts lockout. |
| Q-005 | Timer expiry convention | `LOCKOUT_CYCLES` represents exactly that many complete clock intervals after lockout entry. The expiry edge must be documented and tested precisely. |
| Q-006 | Legal parameter value | `LOCKOUT_CYCLES >= 1`; zero is invalid and must not silently become one. |
| Q-007 | Fault during restart/recovery | Sampled high fault has priority and prevents the pump from being enabled. |
| Q-008 | External input timing | RTL assumes inputs synchronous to `clk`; real integration must add appropriate synchronization for asynchronous inputs. |
| Q-009 | Demand while running | Sampled low demand turns the pump off on that edge and returns the controller to idle, unless fault handling takes priority. |
| Q-010 | Demand absent at lockout expiry | Remain disabled, retain `fault_status`, and start another full lockout interval before rechecking both inputs. |

### Freeze acceptance
All Q-001 through Q-010 policies above were explicitly accepted by the user on 2026-10-21. These decisions are the authority for the V1 specification, architecture, RTL, and verification plan. No RTL has been written by this documentation update.

'''
if re.search(r"(?m)^## Open questions P1:?.*$", s):
    s = re.sub(r"(?ms)^## Open questions P1:?.*?(?=^## Change control)", replacement, s)
elif "## Frozen P1 decisions — accepted 2026-10-21" not in s:
    if re.search(r"(?m)^## Change control", s):
        s = re.sub(r"(?m)^## Change control", replacement + "## Change control", s, count=1)
    else:
        s = s.rstrip() + "\n\n" + replacement
write(name, s)

# ARCHITECTURE: append the detailed state-transition contract, leaving the existing overview intact.
append_once("ARCHITECTURE.md", "## Frozen P1 transition contract (accepted 2026-10-21)", '''## Frozen P1 transition contract (accepted 2026-10-21)

- **Reset:** synchronous, active-high; pump output low, FSM idle, timer reset, and `fault_status` cleared.
- **Idle:** pump is disabled. A sampled fault sets `fault_status` and enters lockout. With no fault, sampled demand starts the pump. No demand keeps the controller idle.
- **Running:** pump is enabled only while demand is present and no sampled fault takes priority. Sampled fault disables the pump, sets `fault_status`, and enters lockout. Sampled demand low disables the pump and returns to idle.
- **Lockout:** pump stays disabled. The timer counts exactly `LOCKOUT_CYCLES` complete clock intervals from lockout entry. Changes in demand do not reset this timer.
- **Recheck:** on the defined expiry edge, restart only if fault is low and demand is high. Successful restart enters running and clears `fault_status`. If fault is high, keep status set and start a fresh full lockout interval. If demand is low, keep status set and also start a fresh full lockout interval.
- **Parameter:** `LOCKOUT_CYCLES` must be >= 1. Invalid zero is not normalized silently; the implementation/checking approach must be documented before RTL acceptance.
- **Sampling model:** inputs are assumed synchronous to `clk` for RTL simulation. Physical asynchronous inputs need synchronization outside this simplified functional model.

The timer's counter implementation must make the exact expiry edge observable and must pass boundary tests for 1 and representative larger values. The safety priority is sampled fault > reset-safe behavior > demand/restart eligibility.
''')

# RTL plan: record frozen gate and exact work sequencing.
append_once("RTL_PLAN.md", "## P1 freeze record (accepted 2026-10-21)", '''## P1 freeze record (accepted 2026-10-21)

P1 behavior is agreed; documentation consistency review is pending. Implement no RTL until the P1 document review is confirmed.

Frozen implementation requirements:
- Use one synthesizable Verilog-2001 controller module, one clock, active-high synchronous reset.
- Suggested states: `IDLE`, `RUNNING`, and `LOCKOUT` with expiry/recheck handled by the lockout counter/state transition. Keep the implementation compact; do not add unnecessary states.
- `dry_run_fault` has priority over demand. `pump_enable` must be low whenever the sampled fault is high and during lockout.
- Start/restart a full `LOCKOUT_CYCLES` interval after detected fault and after every unsuccessful recheck, including demand-low rechecks.
- Clear `fault_status` only on reset or successful recovery/restart; set it on detected fault.
- Reject/document `LOCKOUT_CYCLES < 1`; test `LOCKOUT_CYCLES=1` exactly.
- No generated clocks, delays, analog logic, motor driver, or physical-sensor claims.

After documentation validation, the next authorized step is P1 closeout only. RTL starts only after the user confirms the documents are consistent.
''')

# Verification plan: add precise checks so the old general scenarios have frozen expected behavior.
append_once("VERIFICATION_PLAN.md", "## Frozen P1 expected behavior (accepted 2026-10-21)", '''## Frozen P1 expected behavior (accepted 2026-10-21)

Apply these exact expectations to the scenarios above:

1. Reset synchronously forces `pump_enable=0`, resets the timer/FSM, and clears `fault_status`.
2. In idle, demand high with fault low starts the pump at the next defined sampling edge. Demand low keeps it off.
3. While running, sampled demand low turns the pump off on that edge and returns to idle. A sampled fault takes priority, turns the pump off, sets status, and begins lockout.
4. Lockout lasts exactly `LOCKOUT_CYCLES` complete clock intervals from entry. Inputs changing during lockout do not restart or shorten the current timer.
5. At expiry/recheck, restart only if fault low and demand high. A successful restart clears `fault_status`.
6. If fault is high at recheck, remain disabled, retain status, and start a new full interval.
7. If demand is low at recheck—even if the fault is low—remain disabled, retain status, and start a new full interval. Do not return directly to idle.
8. A fault sampled high after reset release must never permit pump enable; it is recorded and lockout begins.
9. `LOCKOUT_CYCLES=1` must be tested against the written edge convention. Also test a larger value, reset during lockout, repeated faults, and input changes near a clock edge with race-free stimulus.
10. Parameter value zero is invalid. The chosen implementation-time/simulation guard must fail visibly rather than silently reinterpret zero.

Record simulation commands, logs, test coverage, and actual results when verification is performed. These are planned checks, not evidence that tests have already passed.
''')

# PROGRESS: correct stale environment claims, append the current documentation checkpoint as IN PROGRESS.
name = "PROGRESS.md"
s = read(name)
old_marker = "### 2026-10-20 — Codespace documentation and environment audit"
if old_marker in s:
    s = s[:s.index(old_marker)].rstrip()
new_progress = '''### 2026-10-20 — Codespace documentation and environment audit (corrected 2026-10-21)
- Project documentation is in `Water_Pump_Dry_Run_Controller/docs/`; no pump-controller RTL has been written or verified.
- Latest Codespace audit reported Yosys `0.70+176 (git sha1 365bb887b)`, Icarus Verilog `14.0 (devel)`, OpenROAD `26Q2-1164-g08f67ee5ec`, OpenSTA `3.1.0`, and KLayout `0.30.12`.
- ORFS checkout: `tools/OpenROAD-flow-scripts`, commit `bf3f9b344`, branch `master`. Existing modified/untracked ORFS paths were observed and must not be reset, cleaned, deleted, or recloned.
- Reference GCD flow produced non-empty final GDS/ODB/Verilog/DEF/SDC outputs. GCD DRC count reports 0 and LVS log reports matching netlists. These are reference-flow evidence only, not pump-controller results.
- GCD physical flow required existing compatibility workarounds; generic GCD timing had setup violations (WNS about -1.712 ns and 68 violating endpoints), so timing was not a pass.
- Evidence path reported: `docs/evidence/P0/environment_audit.txt`. Verify its contents if it is used in a final submission.
- Status: environment tools are present and reference-flow outputs exist; P0 evidence/documentation review still requires final validation. Do not claim pump-controller implementation, timing, DRC, LVS, or GDS results.

### 2026-10-21 — P1 architecture decisions accepted; documentation update
- User explicitly accepted Q-001 through Q-009 and selected Option A for demand absent at lockout expiry (remain disabled, retain fault status, start another full lockout interval, then recheck).
- Files updated by the documentation-update script: `PROJECT_SPEC.md`, `ARCHITECTURE.md`, `DECISIONS.md`, `RTL_PLAN.md`, `VERIFICATION_PLAN.md`, `PROGRESS.md`, and `MEMORY.md`.
- Backup copies created under `docs/evidence/P1/pre_update_backup/` before edits.
- Commands/tests: documentation update script only; no Verilog, simulation, synthesis, timing, or physical-design commands run for this checkpoint.
- Actual result: agreed P1 behavior recorded in the docs; consistency check remains pending until the updated files are inspected.
- Evidence path: `docs/evidence/P1/pre_update_backup/` and this progress entry.
- Status: IN PROGRESS (documentation validation pending; do not mark P1 PASS yet).
- Open issues: confirm exact text, headings, and cross-document consistency; verify the environment evidence file against the latest audit output.
- Next action: inspect changed sections and check no stale open-question wording remains; only after validation may P1 be marked PASS. RTL remains prohibited until user approval of the validated documents.
'''
s = s.rstrip() + "\n\n" + new_progress
write(name, s)

# MEMORY: update status line and append a handoff entry, preserving all prior history.
name = "MEMORY.md"
s = read(name)
s = s.replace(
    "**Status:** Proposal submitted; architecture and exact timer/fault semantics not yet frozen; no new-project RTL tests have run.",
    "**Status:** P1 decisions accepted on 2026-10-21; document consistency validation pending; no new-project RTL has been written or tested."
)
append_once(name, "### 2026-10-21 — P1 architecture decisions accepted", '''### 2026-10-21 — P1 architecture decisions accepted
- User accepted all nine proposed architecture policies and selected Option A when demand is absent at lockout expiry.
- Frozen behavior: active-high synchronous reset; sampled fault has priority; fault detection starts lockout and sets `fault_status`; lockout lasts exactly `LOCKOUT_CYCLES` complete intervals; persistent fault or absent demand at recheck starts another full interval; restart requires fault low and demand high at recheck; successful recovery/restart clears `fault_status`; demand low while running turns pump off and returns to idle.
- `LOCKOUT_CYCLES` must be >= 1. Zero is invalid. Inputs are assumed synchronous for RTL simulation; physical asynchronous signals require appropriate synchronization at integration.
- Latest environment audit: Yosys `0.70+176`, Icarus `14.0 (devel)`, OpenROAD `26Q2-1164-g08f67ee5ec`, OpenSTA `3.1.0`, KLayout `0.30.12`; ORFS reference GCD generated GDS and reported zero DRC count and matching LVS, but had setup timing violations. None of this is pump-controller verification.
- Documentation updated by script; backups saved under `docs/evidence/P1/pre_update_backup/`.
- No RTL or testbench created; no simulation/synthesis/physical-design run performed for the pump controller.
- Status: IN PROGRESS until updated docs are inspected for consistency; do not mark P1 PASS until that review is complete.
- Next: inspect updated sections, confirm stale open questions were replaced, verify environment evidence, and obtain user approval before starting RTL.
''')
write(name, s)

print("Documentation update completed.")
print("Updated: " + ", ".join(required))
print("Backups: docs/evidence/P1/pre_update_backup/")
print("No RTL files were created or modified.")
print("P1 remains IN PROGRESS pending consistency validation.")
