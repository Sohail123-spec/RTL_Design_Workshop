# Digital Water Pump Dry-Run Protection and Automatic Restart Controller

## The problem we're solving

Water pumps move water from sources such as tanks, wells, and reservoirs. If the water supply runs out while a pump is operating, the pump may continue running without enough water. This condition is commonly called **dry running** and can cause overheating, wear, equipment damage, and avoidable maintenance costs.

A practical protection system should stop the pump when a dry-run condition is detected. It should not restart immediately while the fault remains, and it should resume only when conditions are safe and water is still needed.

## Our solution

This project develops the digital control logic for a **Water Pump Dry-Run Protection and Automatic Restart Controller**.

The controller receives a digital signal from an external detector indicating whether a dry-run fault has been detected. When a fault is reported, the controller disables the pump and records the fault status. It then waits for a configurable lockout period before checking whether restarting is safe. The pump is enabled again only when the fault has cleared and a request to run the pump is still present.

The protection approach is straightforward:

1. **Monitor:** Receive the pump demand and external dry-run fault indication.
2. **Protect:** Disable the pump when a dry-run fault is detected.
3. **Wait:** Keep the pump disabled for a defined lockout period.
4. **Recheck:** Check that the fault has cleared and water is still needed.
5. **Recover safely:** Restart only when both conditions allow it; otherwise, remain protected.

## What this project demonstrates

The project takes a practical protection requirement through digital design and verification. We implement the controller in Verilog, test normal and fault conditions in simulation, and carry the design through synthesis and a physical-design flow.

The repository includes:
- Controller source code and design documentation.
- Simulation testbenches and waveform evidence for normal behavior, reset, lockout timing, and persistent faults.
- Synthesis reports and generated design artifacts.
- Physical-design evidence for floorplanning, placement, clock-tree synthesis, routing, timing reports, GDSII inspection, and LVS comparison.
- Checkpoint READMEs with screenshots and explanations of the available evidence.

## Project boundary

**This project implements the digital controller, not a complete physical pump installation.**

The controller uses an external digital `dry_run_fault` input. It does not itself sense water flow, include a physical sensor or sensor-conditioning circuit, or drive a motor directly. A real installation would also need suitable sensing, electrical isolation, motor-driving hardware, and system-level safety validation.

The included simulation and implementation results describe the archived project snapshot. They should not be interpreted as certification for deployment or foundry signoff.

## Explore the project

| If you want to understand… | Start here |
|---|---|
| Project requirements and scope | [`docs/PROJECT_SPEC.md`](./docs/PROJECT_SPEC.md) |
| How the controller is organized | [`docs/ARCHITECTURE.md`](./docs/ARCHITECTURE.md) |
| The Verilog implementation | [`rtl/pump_protection_controller.v`](./rtl/pump_protection_controller.v) |
| Verification plans and checkpoint status | [`docs/VERIFICATION_PLAN.md`](./docs/VERIFICATION_PLAN.md) and [`docs/PROGRESS.md`](./docs/PROGRESS.md) |
| Screenshots and checkpoint evidence | [`docs/evidence/`](./docs/evidence/) |
| Detailed technical results and limitations | [`docs/FINAL_REPORT.md`](./docs/FINAL_REPORT.md) |

## Why this matters

The goal is to demonstrate how a real-world equipment-protection need can be translated into predictable digital control behavior, tested against fault scenarios, and carried through an RTL-to-layout design flow.

**The core idea is simple: protect the pump first, and restart only when the conditions indicate it is safe to do so.**
