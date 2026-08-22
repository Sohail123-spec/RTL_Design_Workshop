# RTL Design Workshop — VSDIAT

A structured weekly RTL Design Workshop covering **Verilog RTL design, simulation, synthesis, timing concepts, coding styles, and RTL optimization**.

This repository documents the practical work completed across five modules. Each module contains its own README, source files, and supporting screenshots so that the implementation, simulation results, and synthesis observations can be reviewed directly.

---

## Workshop Progress

| Module | Focus Area | Status |
|---|---|---|
| [Module 1](./Module%201) | Introduction to Verilog RTL Design and Synthesis | ✅ Completed |
| [Module 2](./Module%202) | Timing Libraries, Hierarchical vs. Flat Synthesis, and Efficient Flop Coding | ✅ Completed |
| [Module 3](./Module%203) | Combinational and Sequential RTL Optimizations | ✅ Completed |
| [Module 4](./Module%204) | Gate-Level Simulation, Blocking vs. Non-Blocking Assignments, and Synthesis–Simulation Mismatch | ✅ Completed |
| [Module 5](./Module%205) | `if`/`case` Coverage, Latch Avoidance, and `for`/`generate` Constructs | ✅ Completed |

---

## Repository Structure

```text
RTL_Design_Workshop/
│
├── README.md
│
├── Module 1/
│   ├── README.md
│   ├── src/
│   │   ├── *.v
│   │   └── ...
│   └── images/
│
├── Module 2/
│   ├── README.md
│   ├── src/
│   │   ├── *.v
│   │   └── ...
│   └── images/
│
├── Module 3/
│   ├── README.md
│   ├── src/
│   │   ├── *.v
│   │   └── ...
│   └── images/
│
├── Module 4/
│   ├── README.md
│   ├── src/
│   │   ├── *.v
│   │   └── ...
│   └── images/
│
└── Module 5/
    ├── README.md
    ├── src/
    │   ├── *.v
    │   └── ...
    └── images/
```

---

## Module Contents

### Module 1 — Verilog RTL Design and Synthesis

Introduces the RTL design flow using Verilog HDL. The module focuses on writing basic RTL designs, creating testbenches, simulating the designs, and understanding how RTL code is translated into hardware during synthesis.

**Key areas:**
- Basic Verilog RTL coding
- Module and testbench structure
- Combinational logic
- RTL simulation
- Logic synthesis
- Synthesized hardware representation

---

### Module 2 — Timing Libraries and Efficient Flop Coding

Explores timing-library concepts and different RTL coding approaches for sequential logic. It also demonstrates hierarchical versus flat synthesis and how coding style can influence the synthesized implementation.

**Key areas:**
- Standard-cell timing libraries
- Sequential logic and flip-flops
- Synchronous and asynchronous controls
- Hierarchical synthesis
- Flat synthesis
- Efficient RTL coding styles
- Multiplication and hierarchical module examples

---

### Module 3 — RTL Optimization

Focuses on how synthesis tools optimize RTL descriptions while preserving their intended functionality.

**Key areas:**
- Constant propagation
- Combinational optimization
- Sequential optimization
- Flip-flop optimization
- Counter optimization
- Comparing RTL descriptions with synthesized results
- Understanding what logic can be removed or simplified by synthesis

---

### Module 4 — Gate-Level Simulation and Coding-Style Effects

Examines situations where RTL simulation and synthesized/gate-level behavior can differ because of coding style or incomplete sensitivity information.

**Key areas:**
- Gate-Level Simulation (GLS)
- Blocking assignments
- Non-blocking assignments
- Sensitivity lists
- Combinational MUX coding
- Synthesis–simulation mismatch
- Good and bad RTL coding practices

---

### Module 5 — `if`/`case` Coverage and Generate Constructs

Demonstrates how incomplete conditional descriptions can infer unintended hardware and how structured RTL constructs can be used to create repetitive hardware efficiently.

**Key areas:**
- `if` statement completeness
- `case` statement completeness
- Latch inference
- Case coverage
- Overlapping case conditions
- MUX and DEMUX implementations
- `for` loops
- `generate` loops
- Repeated hardware structures

---

## Source Code

Each module now contains a dedicated `src/` directory containing the Verilog source files corresponding to the designs documented in that module.

The source files are intended to make the repository directly usable for:
- RTL simulation
- Testbench execution
- Synthesis experiments
- Gate-level simulation
- Reviewing different coding styles
- Comparing RTL with synthesized implementations

The screenshots in the `images/` directories provide supporting evidence for the code, simulation waveforms, and synthesis/netlist observations documented in the module READMEs.

---

## Tools and Technologies

- **Verilog HDL** — RTL design and hardware description
- **Icarus Verilog (`iverilog`)** — RTL and gate-level simulation
- **GTKWave** — Simulation waveform visualization
- **Yosys** — RTL synthesis and logic optimization
- **Sky130 Standard-Cell Library (`.lib`)** — Standard-cell timing and synthesis experiments

---

## Learning Outcomes

By completing this workshop, the following RTL design concepts were practiced:

1. Writing synthesizable Verilog RTL.
2. Building and running Verilog testbenches.
3. Simulating combinational and sequential designs.
4. Understanding basic synthesis flow.
5. Reading synthesized logic and netlist representations.
6. Understanding timing-library usage in synthesis.
7. Comparing hierarchical and flat synthesis.
8. Identifying inefficient RTL coding styles.
9. Understanding synthesis optimizations.
10. Recognizing common causes of simulation–synthesis mismatch.
11. Avoiding unintended latch inference.
12. Using `for` and `generate` constructs for scalable hardware descriptions.

---

## Author

**Md Sohail Ahmed**  
B.Tech — Electronics and Communication Engineering  
Anurag University, Hyderabad

- [GitHub](https://github.com/Sohail123-spec)
- [Portfolio](https://sohail123-spec.github.io/sohail-portfolio/)
- [LinkedIn](https://linkedin.com/in/contactmdsohailahmed)

---

## Repository Note

This repository is maintained as a practical record of the RTL Design Workshop. The module READMEs, Verilog source files, screenshots, simulation results, and synthesis observations together document the progression from basic RTL coding to synthesis-aware and optimization-oriented digital design.
