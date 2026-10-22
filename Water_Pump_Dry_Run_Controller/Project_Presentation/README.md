# Water Pump Dry-Run Protection Controller

## Project Presentation

This presentation demonstrates the design and implementation of a digital Water Pump Dry-Run Protection Controller using Verilog HDL. The project covers the problem statement, proposed solution, RTL implementation, functional verification, synthesis, timing analysis, and physical-design results.

### 🎥 Video Presentation

Watch my complete project walkthrough:

▶️ **[Watch the Water Pump Dry-Run Protection Controller Presentation](https://drive.google.com/file/d/1GLLMMpnD6hn0L013cMqMMpV4OjTZ-q9t/view?usp=drivesdk)**

The video explains the project objectives, controller architecture, important RTL files, verification approach, physical-design results, and supporting evidence.

### Project Overview

The objective of this project is to implement a digital controller that responds to a dry-run fault by disabling the pump and enforcing a configurable lockout period before another operating attempt.

The controller uses a finite state machine with three states:

- **IDLE:** Waits for a pump demand.
- **RUNNING:** Enables pump operation while monitoring the dry-run fault signal.
- **LOCKOUT:** Disables the pump and enforces the configured waiting period after a fault.

### Topics Covered

- **Problem Statement and Proposed Solution:** Understanding the dry-running problem and the role of digital protection logic.
- **Verilog RTL Design:** Implementing the controller using a finite state machine and lockout counter.
- **Functional Verification:** Reviewing testbenches for normal operation, reset, minimum lockout duration, and persistent faults.
- **Logic Synthesis:** Examining the mapped standard-cell implementation and area results.
- **Static Timing Analysis:** Reviewing recorded timing results under the selected design constraints.
- **Physical Design:** Exploring the RTL-to-GDSII implementation flow and its archived results.
- **Design Evidence:** Reviewing available simulation results, synthesis and timing reports, DRC results, LVS logs, and layout artifacts.

### Tools and Technologies

- Verilog HDL
- Icarus Verilog
- GTKWave
- Yosys
- Sky130HD technology library
- OpenROAD-flow-scripts
- OpenSTA
- Physical-design and verification reports

### Project Scope and Limitations

This project focuses on the digital protection controller. The physical water-flow sensor, analog signal conditioning, and motor-driving circuit are outside the current implementation scope. The dry-run fault is supplied as an external digital input, and the pump-enable signal represents digital permission to operate the pump.

The archived simulation and physical-design results document the recorded implementation. They do not constitute physical pump testing or foundry signoff.

### Learning Outcomes

Through this project, I gained practical experience in digital controller design, Verilog RTL development, FSM-based control, functional verification, logic synthesis, timing analysis, and the RTL-to-GDSII physical-design workflow.

---

**Author:** MD Sohail Ahmed

**Repository:** [RTL_Design_Workshop](https://github.com/Sohail123-spec/RTL_Design_Workshop)

**Project Directory:** [Water_Pump_Dry_Run_Controller](https://github.com/Sohail123-spec/RTL_Design_Workshop/tree/main/Water_Pump_Dry_Run_Controller)