# Physical Design (PD) — VLSI / OpenLANE Workshop

## Overview

This repository documents the complete **Physical Design (PD)** workshop across five modules. The workshop progresses from the fundamentals of open-source EDA and the Sky130 PDK through floorplanning, standard-cell placement, cell design and characterization, timing analysis, clock-tree synthesis, power distribution, routing and final physical-design checks.

The five modules collectively provide a practical view of the **RTL-to-GDSII** implementation journey using an open-source tool flow. The detailed module topics are based on the supplied workshop topic list. fileciteturn0file0L1-L16

## Workshop Roadmap

```text
Module 1
Open-Source EDA + OpenLANE + Sky130
          ↓
Module 2
Floorplanning + Library Binding + Placement
          ↓
Module 3
Standard-Cell Layout + ngspice + Magic + DRC
          ↓
Module 4
Timing Analysis + OpenSTA + Clock Tree Synthesis
          ↓
Module 5
PDN + Routing + TritonRoute + DRC / Post-Route
```

## Module 1 — Inception of Open-Source EDA, OpenLANE and Sky130 PDK

The first module builds the foundation for the complete flow. It covers package/chip terminology, RISC-V, software-to-hardware concepts, open-source digital ASIC design, the RTL-to-GDSII flow, OpenLANE, the Sky130 PDK, project directory structure, design preparation and synthesis.

**Main areas:**

- QFN-48 package, chip, pads, core, die and IPs
- RISC-V and SoC concepts
- Open-source digital ASIC design
- Simplified and detailed RTL-to-GDSII flow
- OpenLANE and Strive chipsets
- OpenLANE project structure
- Design preparation and synthesis
- Synthesis netlist and synthesis-result characterization

[Open Module 1 →](./Module%201/README.md)

## Module 2 — Good Floorplan vs Bad Floorplan and Introduction to Library Cells

Module 2 moves into physical organization of the design. It covers floorplanning, utilization, aspect ratio, pre-placed cells, decoupling capacitors, power planning, pin placement, blockages, Magic-based floorplan inspection, library binding and placement optimization.

**Main areas:**

- Utilization factor and aspect ratio
- Pre-placed cells and decoupling capacitors
- Power planning and pin placement
- Floorplan execution and visualization
- Library binding and initial placement
- Wire-length and capacitance-based placement optimization
- Congestion-aware placement using RePlAce
- Standard-cell design and characterization
- Timing thresholds, propagation delay and transition time

[Open Module 2 →](./Module%202/README.md)

## Module 3 — Design Library Cell Using Magic Layout and ngspice Characterization

Module 3 connects circuit-level behaviour with physical standard-cell implementation. It covers CMOS inverter simulation, SPICE deck creation, switching threshold, static/dynamic simulation, CMOS fabrication-related layout steps, Sky130 technology files, Magic layout work, extraction and DRC exercises.

**Main areas:**

- CMOS inverter simulation using ngspice
- SPICE deck creation and transient analysis
- Switching threshold Vm
- CMOS fabrication sequence
- Active regions, wells, gate, LDD, source/drain and interconnects
- Standard-cell layout
- Layout-to-SPICE extraction
- Sky130 technology files and model files
- Magic and DRC rules
- DRC-error analysis and correction

[Open Module 3 →](./Module%203/README.md)

## Module 4 — Pre-Layout Timing Analysis and Importance of Good Clock Tree

Module 4 focuses on timing and clock distribution. It covers delay tables, track information, standard-cell LEF, timing libraries, OpenSTA timing analysis, setup/hold timing, jitter and uncertainty, TritonCTS, H-tree clock distribution, buffering, shielding, crosstalk and real-clock analysis.

**Main areas:**

- Grid-to-track and Magic-to-LEF concepts
- Timing libraries and delay tables
- SDC-based timing analysis
- OpenSTA and timing paths
- Setup and hold analysis
- Clock jitter and uncertainty
- Clock-tree synthesis with TritonCTS
- H-tree routing and clock buffering
- Crosstalk and clock-net shielding
- Timing analysis with real clocks
- Effect of CTS buffer sizing on setup and hold timing

[Open Module 4 →](./Module%204/README.md)

## Module 5 — Final Steps for RTL2GDS Using TritonRoute and OpenSTA

The final module concentrates on routing and the completion of the physical implementation. It covers maze routing, DRC, the power distribution network, global and detailed routing, TritonRoute route guides, connectivity handling, intra-/inter-layer routing, routing topology and post-route files.

**Main areas:**

- Lee's maze-routing algorithm
- Design Rule Checking
- Power Distribution Network construction
- Power straps and standard-cell power
- Global and detailed routing
- TritonRoute configuration and features
- Pre-processed route guides
- Inter-guide connectivity
- Intra-layer and inter-layer routing
- Routing topology and connectivity handling
- Final post-route files

[Open Module 5 →](./Module%205/README.md)

## Overall RTL-to-GDSII Learning Path

The workshop follows a logical progression:

1. **Understand the technology and flow** — Open-source EDA, Sky130 PDK and OpenLANE.
2. **Prepare the physical organization** — floorplan, utilization, aspect ratio, power and pins.
3. **Bind and place cells** — libraries, placement optimization and congestion awareness.
4. **Build and characterize cells** — CMOS inverter simulation, Magic layout, extraction and DRC.
5. **Analyze timing** — timing libraries, delay tables, OpenSTA and timing constraints.
6. **Build the clock network** — TritonCTS, buffering, H-tree concepts and signal integrity.
7. **Distribute power and route signals** — PDN, global routing and detailed routing.
8. **Perform physical checks and inspect results** — DRC, connectivity, routing topology and post-route outputs.

## Overall Figures / Workshop Highlights

The detailed figures are embedded inside the README of each module so that every concept is documented alongside its corresponding practical evidence.

### OpenLANE / RTL-to-GDSII

![Simplified RTL to GDSII Flow](./Module%201/Images/Simplified_RTL_to_GDSII_flow.png)

![OpenLANE ASIC Flow](./Module%201/Images/Openlane_ASIC_flow.png)

### Floorplanning and Placement

![Floorplan](./Module%202/Images/floorplan.png)

![Placement Standard Cell](./Module%202/Images/placement_standard_cell.png)

### Standard-Cell / CMOS Layout

![Layout](./Module%203/Images/Layout.png)

![SPICE Waveforms](./Module%203/Images/Spice_waveforms.png)

### Timing and CTS

![OpenSTA Prelayout Timing Analysis](./Module%204/Images/OpenSTA_Prelayout_Timing_Analysis.png)

![Clock Tree Synthesis](./Module%204/Images/clock_tree_synthesis.png)

### Routing

![Routing Using TritonRoute](./Module%205/Images/routing_using_tritonRoute.png)

![Routing Topology Algorithm](./Module%205/Images/Routing_topology_algorithm.png)

## Repository Structure

```text
Physical_Design_PD/
│
├── Module 1/
│   ├── Images/
│   └── README.md
│
├── Module 2/
│   ├── Images/
│   └── README.md
│
├── Module 3/
│   ├── Images/
│   └── README.md
│
├── Module 4/
│   ├── Images/
│   └── README.md
│
├── Module 5/
│   ├── Images/
│   └── README.md
│
└── README.md
```

Each module keeps its supplied figures in its own `Images` folder, while the corresponding `README.md` embeds those figures and explains the concepts, practical workflow and learning outcomes.

## Tools and Technologies Covered

- **OpenLANE** — RTL-to-GDSII digital implementation flow
- **Sky130 PDK** — technology/process information for the workshop
- **Magic** — physical layout inspection and DRC-related work
- **ngspice** — circuit-level simulation and characterization
- **OpenSTA** — static timing analysis
- **TritonCTS** — clock-tree synthesis
- **TritonRoute** — routing
- **RePlAce** — congestion-aware placement
- **Linux / Ubuntu** — workshop environment
- **SPICE / Liberty / LEF / SDC concepts** — supporting implementation data

## Overall Learning Outcomes

After completing the five modules, the workshop provides practical familiarity with:

1. Open-source EDA and the role of technology-specific PDK information.
2. The complete RTL-to-GDSII implementation sequence.
3. OpenLANE project organization and synthesis.
4. Floorplan parameters and physical organization.
5. Library binding, standard-cell placement and congestion awareness.
6. CMOS standard-cell layout and circuit-level characterization.
7. Magic layout inspection, extraction and DRC concepts.
8. Timing libraries, delay tables and OpenSTA analysis.
9. Setup, hold, jitter and uncertainty concepts.
10. Clock-tree synthesis, buffering, shielding and signal integrity.
11. Power distribution network construction.
12. Global and detailed routing with TritonRoute.
13. Routing connectivity, topology and post-route results.

## Practical Documentation

The `Images` directory inside every module preserves the workshop figures supplied for that module. The module README files now act as visual documentation by embedding the relevant figures directly beside the associated concepts. This keeps the repository useful as both a **workshop record** and a **revision resource**.

## Author

**Physical Design Workshop Practical Work**
