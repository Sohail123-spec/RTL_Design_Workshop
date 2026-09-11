<<<<<<< HEAD
# Module 2 — Good Floorplan vs Bad Floorplan and Introduction to Library Cells

## Overview

This module moves from the introductory OpenLANE flow into physical floorplanning, library binding, placement, standard-cell design/characterization, and timing-characterization concepts. The practical work uses OpenLANE and Magic to inspect floorplan and placement results.

## Topics Covered

### SKY130_D2_SK1 — Chip Floor planning considerations

- Utilization factor and aspect ratio
- Concept of pre-placed cells
- De-coupling capacitors
- Power planning
- Pin placement and logical cell placement blockage
- Steps to run floorplan using OpenLANE
- Review floorplan files and steps to view floorplan
- Review floorplan layout in Magic

### SKY130_D2_SK2 — Library Binding and Placement

- Netlist binding and initial place design
- Optimize placement using estimated wire-length and capacitance
- Final placement optimization
- Need for libraries and characterization
- Congestion aware placement using RePlAce

### SKY130_D2_SK3 — Cell design and characterization flows

- Inputs for cell design flow
- Circuit design step
- Layout design step
- Typical characterization flow

### SKY130_D2_SK4 — General timing characterization parameters

- Timing threshold definitions
- Propagation delay and transition time

## Practical Focus

The module covers how floorplan parameters, pre-placed cells, power planning, pin placement, placement optimization, library characterization, and congestion-aware placement affect physical implementation. It also introduces the timing parameters used to describe cell behavior.

## Figures / Practical Evidence

All figures supplied with Module 2 are retained in the `Images` directory.

- **Art of Layout** — [Figure](<./Images/Art_of_Layout.png>)
- **Cell Design flow** — [Figure](<./Images/Cell_Design_flow.png>)
- **Design name** — [Figure](<./Images/Design_name.png>)
- **Noise margin Summary** — [Figure](<./Images/Noise_margin_Summary.png>)
- **Optimize placement** — [Figure](<./Images/Optimize_placement.png>)
- **Screenshot 2026-09-11 130151** — [Figure](<./Images/Screenshot 2026-09-11 130151.png>)
- **Timing Characteristics** — [Figure](<./Images/Timing_Characteristics.png>)
- **Transient Time** — [Figure](<./Images/Transient_Time.png>)
- **adding Decoupling capacitor** — [Figure](<./Images/adding_Decoupling_capacitor.png>)
- **bind netlist** — [Figure](<./Images/bind_netlist.png>)
- **floorplan** — [Figure](<./Images/floorplan.png>)
- **location of preplaced cell** — [Figure](<./Images/location_of_preplaced_cell.png>)
- **magic flooorplan layout** — [Figure](<./Images/magic_flooorplan_layout.png>)
- **metal2** — [Figure](<./Images/metal2.png>)
- **metal3** — [Figure](<./Images/metal3.png>)
- **pin placement** — [Figure](<./Images/pin_placement.png>)
- **placement** — [Figure](<./Images/placement.png>)
- **placement standard cell** — [Figure](<./Images/placement_standard_cell.png>)
- **power placement** — [Figure](<./Images/power_placement.png>)
- **prepplaced cell** — [Figure](<./Images/prepplaced_cell.png>)
- **stick Diagram** — [Figure](<./Images/stick_Diagram.png>)

## Key Takeaways

- Floorplanning establishes the physical organization and available space for implementation.
- Utilization and aspect ratio are key floorplan parameters.
- Pre-placed cells, decoupling capacitors, power planning, and pin placement are considered during floorplanning.
- Placement binds the synthesized netlist to physical library cells and is optimized for wire-length, capacitance, and congestion.
- Cell design and characterization provide information needed by implementation tools.
- Timing threshold definitions, propagation delay, and transition time are introduced as characterization parameters.
=======
# Module 2 — Floorplanning and Introduction to Library Cells

## Overview

This module introduces physical-design floorplanning and the relationship between floorplan parameters and chip implementation quality.

The practical work covers floorplan considerations, utilization factor, aspect ratio, cell design and characterization, timing characterization parameters, metal layers, and standard-cell placement.

## Topics Covered

### 1. Chip Floorplanning Considerations

Floorplanning determines the basic physical organization of a chip, including the placement and available area for major design components.

Important considerations include:

- Die/core dimensions
- Placement area
- Utilization
- Aspect ratio
- I/O and routing requirements
- Available space for standard cells

### 2. Utilization Factor and Aspect Ratio

**Utilization factor** describes how much of the available core area is occupied by placed cells.

A commonly used relationship is:

```text
Utilization = (Area occupied by cells / Available core area) × 100
```

**Aspect ratio** describes the relationship between the height and width of the floorplan:

```text
Aspect Ratio = Height / Width
```

These parameters influence routing resources, congestion, and the overall physical implementation.

### 3. Cell Design and Characterization Flow

Standard cells are designed and characterized so that their physical and timing behavior can be used by digital implementation tools.

Characterization provides information such as:

- Delay
- Transition time
- Power-related behavior
- Input/output timing relationships

### 4. General Timing Characterization Parameters

Timing characterization involves parameters that describe how a cell behaves for different input transitions, output loads, and operating conditions.

Important concepts include:

- Cell delay
- Slew / transition
- Input capacitance
- Output load
- Setup and hold behavior

### 5. Floorplan Visualization

The practical work includes viewing the generated floorplan using Magic.

### 6. Metal Layers

The practical screenshots demonstrate different metal layers, including Metal 2 and Metal 3, used for interconnection in the physical layout.

### 7. Standard-Cell Placement

The final practical visualization shows the placement of standard cells within the floorplan.

## Practical Screenshots

### Design Name / Configuration

![Design Name](./images/Design_name.png)

### Floorplan

![Floorplan](./images/floorplan.png)

### Magic Floorplan Layout

![Magic Floorplan Layout](./images/magic_flooorplan_layout.png)

### Metal 2

![Metal 2](./images/metal2.png)

### Metal 3

![Metal 3](./images/metal3.png)

### Standard-Cell Placement

![Standard Cell Placement](./images/placement_standard_cell.png)

## Key Takeaways

- Floorplanning is an important early stage of physical design.
- Utilization and aspect ratio directly affect the available physical-design space.
- Standard cells must be physically and electrically characterized before being used effectively in implementation.
- Metal layers provide routing resources for connecting cells.
- Placement determines the physical locations of standard cells before later routing stages.
- Magic can be used to inspect and visualize physical layout results.
>>>>>>> 54e94f512135261a796442041bef0920545f2e74
