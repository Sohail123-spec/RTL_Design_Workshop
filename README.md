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
| [Lab Work](./lab%20work%20RLC_GLS_DAC) | RTL-to-Gate-Level Flow, MUX Design, GLS, Standard-Cell Analysis, and VSD BabySoC | ✅ Completed |

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

├── lab work RLC_GLS_DAC/
│   ├── README.md
│   └── screenshots/
│       ├── *.jpeg
│       ├── *.jpg
│       └── *.png
│
└── PD/
    ├── README.md
    ├── Module 1/
    │   ├── README.md
    │   └── images/
    └── Module 2/
        ├── README.md
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

### Lab Work — VLSI Design and Synthesis

The lab work documents the practical application of RTL-to-gate-level VLSI design concepts, including Verilog RTL design, simulation, synthesis, technology mapping, Gate-Level Simulation (GLS), standard-cell library analysis, and VSD BabySoC synthesis and verification.

**Key areas:**
- Complete RTL-to-gate-level VLSI design flow
- Verilog RTL coding and testbench development
- MUX RTL design
- Good MUX functional simulation
- Good MUX synthesis using Yosys
- SKY130 standard-cell technology mapping
- Post-synthesis / Gate-Level Simulation
- Good MUX vs. Bad MUX comparison
- Gate-level netlist inspection
- Standard-cell leakage-power information
- VSD BabySoC design hierarchy
- RVMYTH module inspection
- BabySoC testbench analysis
- BabySoC synthesis and synthesis statistics
- BabySoC netlist inspection
- Pre-synthesis and post-synthesis comparison

**Lab Work Structure:**

```text
lab work RLC_GLS_DAC/
│
├── README.md
│
└── screenshots/
    ├── final Practical Flow.jpeg
    ├── File_structures.jpeg
    ├── Design hierarchy.jpeg
    ├── mux_code.jpeg
    ├── good_mux_simulation.jpeg
    ├── Good_mux.jpeg
    ├── Good_mux technology mapped .jpeg
    ├── post_synthesis.jpeg
    ├── comparison of goodmux & badmux.jpeg
    ├── GLS pre_synth.jpeg
    ├── checking the gate.jpeg
    ├── Lekeage power information.jpeg
    ├── vsdbaby_soc.jpeg
    ├── rv_myth.jpeg
    ├── test_bench file.jpeg
    ├── Baby_soc synthesized design.jpeg
    ├── BabySoC Synthesis Statistics.jpeg
    ├── Baby_Soc_simulation _soc_netlist.jpeg
    ├── Baby_Soc_simulation _soc2_netlist.jpeg
    └── Comparion post_pre.jpeg
```

#### Lab Work Flow

```text
RTL Design
    ↓
Verilog Coding
    ↓
Testbench
    ↓
RTL / Functional Simulation
    ↓
Icarus Verilog
    ↓
GTKWave
    ↓
Yosys Synthesis
    ↓
Logic Optimization
    ↓
Technology Mapping
    ↓
Gate-Level Netlist
    ↓
Gate-Level Simulation
    ↓
GTKWave Verification
```

#### MUX Design and Verification

The MUX lab work covers RTL implementation, functional simulation, Yosys synthesis, technology mapping, post-synthesis verification, and comparison of Good and Bad MUX coding styles.

#### Gate-Level Simulation

The GLS work demonstrates the flow from synthesized RTL to a gate-level netlist using standard-cell models, followed by simulation and waveform verification.

#### Standard-Cell Library Analysis

The lab includes inspection of leakage-power information available from the standard-cell library.

#### VSD BabySoC

The BabySoC work extends the synthesis flow to a larger SoC design and includes RVMYTH inspection, testbench analysis, synthesis, synthesis statistics, netlist inspection, and pre-synthesis/post-synthesis comparison.


---

### Physical Design (PD) — Open-Source EDA, OpenLane and Sky130

The **Physical Design (PD)** work documents the practical introduction to open-source EDA, OpenLane, the Sky130 PDK, chip floorplanning, library-cell concepts, and timing characterization.

This work is organized separately from the five RTL modules and the RTL lab work because it focuses on the **physical-design side of the VLSI flow**.

**Key areas:**
- Inception of open-source EDA
- OpenLane and Sky130 PDK
- How to talk to computers
- SoC design and OpenLane
- Familiarization with open-source EDA tools
- Chip floorplanning considerations
- Utilization factor and aspect ratio
- Cell design and characterization flow
- General timing characterization parameters
- Floorplan visualization
- Metal-layer inspection
- Standard-cell placement

#### Physical Design Structure

```text
PD/
├── README.md
├── Module 1/
│   ├── README.md
│   └── images/
│       ├── Openlane.png
│       ├── Synthesis_netlist.png
│       ├── Technology_Specific.png
│       ├── Tools_Specfic.png
│       ├── chip_area.png
│       ├── clock ratio&percentage.png
│       └── overall_tech&tools.png
│
└── Module 2/
    ├── README.md
    └── images/
        ├── Design_name.png
        ├── floorplan.png
        ├── magic_flooorplan_layout.png
        ├── metal2.png
        ├── metal3.png
        └── placement_standard_cell.png
```

#### Module 1 — Inception of Open-Source EDA, OpenLane and Sky130 PDK

Topics covered:

- How to Talk to Computers
- SoC Design and OpenLane
- Getting Familiar with Open-Source EDA Tools

[Open Physical Design Module 1 →](./PD/Module%201/README.md)

#### Module 2 — Good Floorplan vs Bad Floorplan and Introduction to Library Cells

Topics covered:

1. Chip Floorplanning Considerations
2. Utilization Factor and Aspect Ratio
3. Cell Design and Characterization Flow
4. General Timing Characterization Parameters

[Open Physical Design Module 2 →](./PD/Module%202/README.md)

[Open Physical Design Documentation →](./PD/README.md)

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
