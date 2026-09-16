# Module 2 — Good Floorplan vs Bad Floorplan and Introduction to Library Cells

## Overview

Module 2 moves from the introductory RTL-to-GDSII flow into physical organization of the chip. The module covers floorplanning, utilization, aspect ratio, pre-placed cells, decoupling capacitors, power planning, pin placement and placement blockages. It then moves into library binding, placement optimization, standard-cell design and characterization, and basic timing-characterization parameters.

OpenLANE is used to run and inspect the floorplan, while Magic is introduced for visual inspection of the physical layout.

## Learning Objectives

- Understand why floorplanning is performed before detailed placement and routing.
- Explain utilization factor and aspect ratio and their relationship to available placement area.
- Understand the purpose of pre-placed cells and decoupling capacitors.
- Understand basic power-planning and pin-placement considerations.
- Explain how a synthesized netlist is bound to physical library cells.
- Understand placement optimization using estimated wire-length and capacitance.
- Explain the role of congestion-aware placement and RePlAce.
- Describe the basic standard-cell design and characterization flow.
- Understand timing thresholds, propagation delay and transition time.

## Topics Covered

### SKY130_D2_SK1 — Chip Floor Planning Considerations

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
- Congestion-aware placement using RePlAce

### SKY130_D2_SK3 — Cell Design and Characterization Flows

- Inputs for cell design flow
- Circuit design step
- Layout design step
- Typical characterization flow

### SKY130_D2_SK4 — General Timing Characterization Parameters

- Timing threshold definitions
- Propagation delay and transition time

## Floorplanning Concepts

### Utilization Factor

Utilization describes how much of the available core area is occupied by placed standard-cell area. Very high utilization can reduce available routing space and increase congestion, while very low utilization can waste silicon area.

### Aspect Ratio

Aspect ratio describes the relationship between the height and width of the core or die. The chosen aspect ratio affects physical organization, routing resources and overall chip shape.

### Pre-placed Cells

Some cells or macros must be placed at predetermined locations or regions before standard-cell placement. Their positions influence available placement and routing resources.

### Decoupling Capacitors

Decoupling capacitors are included as part of power integrity considerations. They help provide local charge during switching activity and reduce undesirable power-supply variations.

### Pin Placement and Blockages

I/O pin locations and placement blockages affect how signals enter and leave the core and where standard cells can be legally placed. These decisions therefore influence routability and congestion.

## Placement Flow

```text
Synthesized Netlist
        ↓
Library Binding
        ↓
Initial Placement
        ↓
Wire-Length / Capacitance Estimation
        ↓
Placement Optimization
        ↓
Congestion-Aware Placement
        ↓
Final Placement
```

## Standard-Cell Characterization

A standard cell needs characterized timing information so that implementation and timing-analysis tools can estimate its behavior under different conditions. The module introduces the flow from circuit design to layout and characterization, followed by parameters such as timing thresholds, propagation delay and transition time.

## Figures and Practical Evidence

### 1. Floorplan and Physical Organization

![Floorplan](./Images/floorplan.png)

![Design Name](./Images/Design_name.png)

![Pre-placed Cell](./Images/prepplaced_cell.png)

![Location of Pre-placed Cell](./Images/location_of_preplaced_cell.png)

![Power Placement](./Images/power_placement.png)

![Pin Placement](./Images/pin_placement.png)

![Adding Decoupling Capacitor](./Images/adding_Decoupling_capacitor.png)

![Magic Floorplan Layout](./Images/magic_flooorplan_layout.png)

### 2. Placement and Library Binding

![Bind Netlist](./Images/bind_netlist.png)

![Placement](./Images/placement.png)

![Placement Standard Cell](./Images/placement_standard_cell.png)

![Optimize Placement](./Images/Optimize_placement.png)

![Art of Layout](./Images/Art_of_Layout.png)

### 3. Cell Design and Characterization

![Cell Design Flow](./Images/Cell_Design_flow.png)

![Stick Diagram](./Images/stick_Diagram.png)

![Noise Margin Summary](./Images/Noise_margin_Summary.png)

![Timing Characteristics](./Images/Timing_Characteristics.png)

![Transient Time](./Images/Transient_Time.png)

![Additional Practical Result](./Images/Screenshot%202026-09-11%20130151.png)

### 4. Metal-Layer Examples

![Metal 2](./Images/metal2.png)

![Metal 3](./Images/metal3.png)

## Practical Workflow in OpenLANE

The practical sequence introduced in this module is to prepare the design, configure the floorplan-related settings, run the floorplan stage, inspect generated files and then visualize the resulting layout in Magic. Placement is subsequently considered in terms of library binding, optimization and congestion.

## Key Takeaways

- Floorplanning determines the initial physical organization of the design.
- Utilization and aspect ratio directly affect available physical resources.
- Macros, pre-placed cells, power structures, pins and blockages must be considered before detailed placement.
- Placement is not simply putting cells into empty locations; wire-length, capacitance and congestion must also be considered.
- Standard-cell characterization supplies timing information needed by implementation tools.
- Propagation delay and transition time are important parameters when describing cell timing behavior.

## Tools / Technologies

- OpenLANE
- Magic
- Sky130 standard-cell libraries
- RePlAce placement engine
- Linux / Ubuntu
