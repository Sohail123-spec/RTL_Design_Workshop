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

[Open Module 1 →](./Module%201/README.md)

### Module 2 — Good Floorplan vs Bad Floorplan and Introduction to Library Cells

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
│   └── README.md
│
└── README.md
```

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

## Author

**Physical Design Workshop Practical Work**
