<<<<<<< HEAD
# Physical Design (PD) — VLSI / OpenLANE Workshop

## Overview

This repository contains the practical work, screenshots, and notes completed across all **five modules** of the Physical Design workshop. The workshop progresses from open-source EDA and the Sky130 PDK through floorplanning, standard-cell design and characterization, timing analysis, clock-tree synthesis, routing, and design-rule checking.

The module sequence follows the supplied workshop topic list and preserves the practical figures provided for each module. Each module has its own `README.md` and `Images` directory.

## Modules Covered

### Module 1 — Inception of Open-Source EDA, OpenLANE and Sky130 PDK

Covers the foundations of open-source digital ASIC design: QFN-48 package/chip terminology, RISC-V, the path from software applications to hardware, SoC design, OpenLANE, the simplified and detailed RTL2GDS flow, OpenLANE directory structure, design preparation, synthesis review, project Git information, and synthesis-result characterization.
=======
# Physical Design (PD) — VLSI / OpenLane Workshop

This folder contains the practical work, screenshots, and notes completed during the **Physical Design** module of the workshop.

The module introduces the fundamentals of open-source EDA, OpenLane, the Sky130 PDK, chip floorplanning, standard-cell placement, and basic physical-design concepts.

## Modules Covered

### Module 1 — Inception of Open-Source EDA, OpenLane and Sky130 PDK

Topics covered:

- How to Talk to Computers
- SoC Design and OpenLane
- Getting Familiar with Open-Source EDA Tools
- OpenLane flow and its major stages
- Technology-specific and tool-specific concepts
- Synthesis and netlist generation
- Basic timing-related calculations
>>>>>>> 54e94f512135261a796442041bef0920545f2e74

[Open Module 1 →](./Module%201/README.md)

### Module 2 — Good Floorplan vs Bad Floorplan and Introduction to Library Cells

<<<<<<< HEAD
Covers chip floorplanning considerations, utilization and aspect ratio, pre-placed cells, decoupling capacitors, power planning, pin placement, floorplan execution and inspection, library binding, placement optimization, RePlAce congestion-aware placement, cell design/characterization flow, and timing characterization parameters.

[Open Module 2 →](./Module%202/README.md)

### Module 3 — Design Library Cell Using Magic Layout and ngspice Characterization

Covers CMOS inverter ngspice simulations, SPICE deck creation, switching threshold, static and dynamic simulation, CMOS fabrication/layout formation steps, Sky130 basic layers and LEF, standard-cell layout and SPICE extraction, Sky130 model-file characterization, Magic options and DRC rules, and practical DRC-rule exercises.

[Open Module 3 →](./Module%203/README.md)

### Module 4 — Pre-Layout Timing Analysis and Importance of Good Clock Tree

Covers timing modelling using delay tables, grid-to-track and layout-to-LEF preparation, timing libraries, OpenSTA analysis with ideal clocks, setup time, jitter and uncertainty, synthesis optimization for setup violations, TritonCTS clock-tree synthesis, H-Tree buffering, crosstalk and clock shielding, and setup/hold analysis using real clocks.

[Open Module 4 →](./Module%204/README.md)

### Module 5 — Final Steps for RTL2GDS Using TritonRoute and OpenSTA

Covers maze routing using Lee’s algorithm, DRC, power distribution network construction, power straps to standard-cell power, global and detail routing, TritonRoute configuration and features, route-guide handling, inter-guide connectivity, intra-/inter-layer routing, connectivity handling, routing topology, and post-route files.

[Open Module 5 →](./Module%205/README.md)

## Overall Workshop Flow

The five modules build a continuous physical-design workflow:

```text
Open-Source EDA / Sky130 PDK
            ↓
       OpenLANE / RTL2GDS
            ↓
        Synthesis Review
            ↓
         Floorplanning
            ↓
 Library Binding & Placement
            ↓
 Standard-Cell Design / Characterization
            ↓
    Timing Modelling / OpenSTA
            ↓
 Clock Tree Synthesis / TritonCTS
            ↓
  Real-Clock Setup & Hold Analysis
            ↓
       Power Distribution
            ↓
      Global / Detail Routing
            ↓
       TritonRoute / DRC
            ↓
        Post-Route Files
```

This sequence reflects the topics supplied for the five workshop modules; the repository is organized to make the progression and practical evidence easy to follow.

## Repository Structure

```text
Physical_Design_PD/
├── Module 1/
│   ├── Images/
│   │   └── <Module 1 practical figures>
│   └── README.md
│
├── Module 2/
│   ├── Images/
│   │   └── <Module 2 practical figures>
│   └── README.md
│
├── Module 3/
│   ├── Images/
│   │   └── <Module 3 practical figures>
│   └── README.md
│
├── Module 4/
│   ├── Images/
│   │   └── <Module 4 practical figures>
│   └── README.md
│
├── Module 5/
│   ├── Images/
│   │   └── <Module 5 practical figures>
=======
Topics covered:

- Chip floorplanning considerations
- Utilization factor and aspect ratio
- Cell design and characterization flow
- General timing characterization parameters
- Floorplan visualization using Magic
- Metal layers and standard-cell placement

[Open Module 2 →](./Module%202/README.md)

## Repository Structure

```text
PD/
├── Module 1/
│   ├── images/
│   │   ├── chip_area.png
│   │   ├── clock ratio&percentage.png
│   │   ├── Openlane.png
│   │   ├── overall_tech&tools.png
│   │   ├── Synthesis_netlist.png
│   │   ├── Technology_Specific.png
│   │   └── Tools_Specfic.png
│   └── README.md
│
├── Module 2/
│   ├── images/
│   │   ├── Design_name.png
│   │   ├── floorplan.png
│   │   ├── magic_flooorplan_layout.png
│   │   ├── metal2.png
│   │   ├── metal3.png
│   │   └── placement_standard_cell.png
>>>>>>> 54e94f512135261a796442041bef0920545f2e74
│   └── README.md
│
└── README.md
```

<<<<<<< HEAD
## Tools and Technologies Referenced

- **OpenLANE / OpenLane** — RTL-to-GDS implementation flow
- **Sky130 PDK** — technology files and models used in the workshop
- **Magic** — layout viewing, extraction, and DRC-related work
- **ngspice** — SPICE simulation and inverter characterization
- **OpenSTA** — static timing analysis
- **TritonCTS** — clock-tree synthesis
- **TritonRoute** — routing
- **RePlAce** — congestion-aware placement
- **Linux / Ubuntu** — workshop environment

## Overall Learning Outcomes

After completing the five modules, the practical work provides exposure to:

1. Open-source EDA and the role of a PDK in digital ASIC implementation.
2. The OpenLANE RTL-to-GDS flow and its major stages.
3. Design preparation and synthesis-result review.
4. Chip floorplanning, utilization, aspect ratio, power planning, and pin placement.
5. Library binding, standard-cell placement, placement optimization, and congestion awareness.
6. CMOS inverter SPICE simulation and standard-cell layout/extraction.
7. Sky130 layout layers, technology files, and DRC-rule handling.
8. Timing libraries, delay tables, setup/hold analysis, jitter, and uncertainty.
9. Clock-tree synthesis, buffering, H-Tree concepts, crosstalk, and shielding.
10. Power distribution, global/detail routing, TritonRoute features, connectivity, DRC, and post-route outputs.

## Practical Evidence

Each module's `Images` directory contains the corresponding figures supplied with the workshop material. The module README files retain the supplied topic organization and provide links to the figures so the repository can be used as both workshop documentation and a record of practical work.

## Source Topic Coverage

The complete five-module topic list supplied for this repository is represented in the five module README files. The original topic list contains the detailed `SKY130_Dx_SKy` and `SKY_Lx` sequence used to organize the workshop content.
=======
## Tools and Technologies

- **OpenLane** — RTL-to-GDSII digital implementation flow
- **Sky130 PDK** — Open-source 130 nm process design kit
- **Magic** — Layout viewing and physical-design inspection
- **Linux / Ubuntu** — Workshop environment
- **Open-source EDA tools** — Synthesis, floorplanning, placement and related stages

## Learning Outcomes

After completing these modules, the practical work provides familiarity with:

1. The role of EDA tools in digital IC design.
2. The OpenLane RTL-to-GDSII flow.
3. The Sky130 PDK and technology-specific files.
4. Synthesis and generated gate-level netlists.
5. Floorplan parameters such as utilization and aspect ratio.
6. Standard-cell placement and physical layout visualization.
7. Metal layers used in an IC layout.
8. Basic timing characterization concepts.

## Practical Evidence

The `images` directory inside each module contains screenshots captured during the practical sessions. They are organized by module so that the repository can be used both as workshop documentation and as a record of completed practical work.
>>>>>>> 54e94f512135261a796442041bef0920545f2e74

## Author

**Physical Design Workshop Practical Work**
