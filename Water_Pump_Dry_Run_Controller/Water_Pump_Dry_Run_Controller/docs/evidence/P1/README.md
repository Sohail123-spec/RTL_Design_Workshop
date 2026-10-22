# P1 — Specification and Architecture Freeze

## Purpose
P1 records the frozen V1 requirements, architecture, and engineering decisions before implementation evidence is evaluated.

## Evidence in this folder
- [`environment_audit_2026-10-21.txt`](./environment_audit_2026-10-21.txt) — environment/audit snapshot.
- `PROJECT_SPEC.md` — frozen functional scope and interface.
- `ARCHITECTURE.md` — controller-level architecture.
- `DECISIONS.md` — accepted design decisions, including Q-001–Q-010.
- `RTL_PLAN.md` — implementation approach and gates.
- `VERIFICATION_PLAN.md` — planned verification scenarios and criteria.
- `PROGRESS.md` and `MEMORY.md` — checkpoint and handoff records.
- `*.bak` files — timestamped historical copies retained as audit artifacts.

## Frozen behavior to keep consistent
- Active-high synchronous reset; reset keeps the pump disabled.
- External active-high `dry_run_fault` input; the RTL does not implement a physical sensor.
- Fault detection has priority over demand and recovery.
- Lockout duration is parameterized; `LOCKOUT_CYCLES` must be at least 1.
- Restart is allowed only at recheck when the fault is low and pump demand is high.
- Fault status is retained through unsuccessful recovery attempts.

## Review checklist
- [ ] Verify the source-of-truth documents agree on signal names and reset/fault behavior.
- [ ] Confirm the lockout timer convention and parameter bounds are documented.
- [ ] Confirm test scenarios cover normal operation, reset, lockout boundary, persistent fault, and restart eligibility.
- [ ] Record any later requirement change explicitly rather than silently changing the frozen specification.

**Status note:** The project progress log records P1 as passed, with Q-001–Q-010 accepted.

## Related documentation
- [`PROJECT_SPEC.md`](../../PROJECT_SPEC.md)
- [`ARCHITECTURE.md`](../../ARCHITECTURE.md)
- [`DECISIONS.md`](../../DECISIONS.md)
- [`EVIDENCE_PLAN.md`](../../EVIDENCE_PLAN.md)
