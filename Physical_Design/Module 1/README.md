# Module 1 — Inception of Open-Source EDA, OpenLANE and Sky130 PDK

## Overview

Module 1 establishes the foundation for the Physical Design workshop. It starts with the relationship between software and hardware, introduces chips, packages, pads, cores, dies and IPs, and then moves into RISC-V, SoC design, open-source EDA, the Sky130 PDK and the OpenLANE RTL-to-GDSII flow.

The practical part introduces the OpenLANE directory structure, design-preparation stage, synthesis, generated netlists and basic interpretation of synthesis results. These concepts form the base for the floorplanning, placement, timing and routing work covered in later modules.

## Learning Objectives

By the end of this module, the learner should be able to:

- Explain the basic structure of a digital IC from package and chip level down to the core and IP blocks.
- Relate software applications, compilers, RTL and hardware implementation.
- Describe the role of RISC-V in an open instruction-set architecture ecosystem.
- Identify the major components of an open-source digital ASIC flow.
- Explain the simplified RTL-to-GDSII flow and the purpose of OpenLANE.
- Understand why a PDK is required for technology-specific physical implementation.
- Navigate the important parts of an OpenLANE project directory.
- Understand the purpose of design preparation and synthesis.
- Inspect a generated synthesis netlist and basic synthesis statistics.

## Topics Covered

### SKY130_D1_SK1 — How to talk to computers

- Introduction to QFN-48 package, chip, pads, core, die and IPs
- Introduction to RISC-V
- From software applications to hardware

### SKY130_D1_SK2 — SoC design and OpenLANE

- Introduction to all components of open-source digital ASIC design
- Simplified RTL2GDS flow
- Introduction to OpenLANE and Strive chipsets
- Introduction to OpenLANE detailed ASIC design flow

### SKY130_D1_SK3 — Get familiar to open-source EDA tools

- OpenLANE directory structure in detail
- Design Preparation Step
- Review files after design preparation and run synthesis
- OpenLANE project Git link description
- Steps to characterize synthesis results

## Conceptual Flow

```text
Software Application
        ↓
Compiler / Software Tools
        ↓
RTL Description
        ↓
Synthesis
        ↓
Gate-Level Netlist
        ↓
Floorplan
        ↓
Placement
        ↓
Clock Tree Synthesis
        ↓
Routing
        ↓
Sign-Off
        ↓
GDSII
```

OpenLANE is studied as the practical framework that connects these implementation stages. The Sky130 PDK supplies technology-specific information required by the tools.

## Practical Work

The module includes practical exposure to OpenLANE project organization, preparation of a design, synthesis execution, inspection of generated files and characterization of synthesis results. The figures below are embedded directly so that the README can be used as a visual workshop record without opening each image separately.

## Figures and Practical Evidence

### 1. Chip, Package, SoC and RISC-V Fundamentals

**Package and chip structure**

![Package](./Images/package.png)

![Chip 1](./Images/chip1.png)

![Chip 2](./Images/chip2.png)

![Chip Area](./Images/chip_area.png)

![Arduino Chip](./Images/Arduino_chip.png)

**Processor and RISC-V context**

![Processor SoC](./Images/Processor_SoC.png)

![RISC-V Architecture and Layout](./Images/RISC-V_Archetechture_&_Layout.png)

![Strive SoC Family](./Images/strive_SoC_Family.png)

![System Overview](./Images/System_overview.png)

### 2. Open-Source Digital ASIC Design and PDK

![Open-Source Digital Design](./Images/OpenSource_Digitsl_Design.png)

![Digital ASIC Design](./Images/Digigtal_ASIC_Design.png)

![What is PDK](./Images/What is PDK.png)

![What is PDK - Additional View](./Images/What is PDK2.png)

![Technology Specific](./Images/Technology_Specific.png)

![Tools Specific](./Images/Tools_Specfic.png)

![Overall Technology and Tools](./Images/overall_tech&tools.png)

![Foundry IPs and Macros](./Images/Foundary_IP's_&_Macros.png)

### 3. RTL-to-GDSII and OpenLANE Flow

![Simplified RTL to GDSII Flow](./Images/Simplified_RTL_to_GDSII_flow.png)

![OpenLANE ASIC Flow](./Images/Openlane_ASIC_flow.png)

![OpenLANE](./Images/Openlane.png)

![Design Exploration](./Images/Design_Exploration.png)

![OpenLANE Regression Testing](./Images/OpenLane_Regression_Testing.png)

### 4. Synthesis and Netlist

![Compiler Input and Output](./Images/compiler_input_&_output.png)

![Synthesis](./Images/Synthesis.png)

![Synthesis Netlist](./Images/Synthesis_netlist.png)

![Synthesis Exploration](./Images/Synthesis_Exploration.png)

### 5. Physical Design Stages Introduced

![Floor Planning](./Images/Floor_Planing.png)

![Placement](./Images/Placement.png)

![Clock Tree Synthesis](./Images/Clock_Tree_Synthesis.png)

![Power Planning](./Images/Power_Planning.png)

![Routing](./Images/Routing.png)

![Static Timing Analysis](./Images/Static_Time_Analysis.png)

![Dealing with Antenna Violations](./Images/Dealing_with_Antenna_Violations.png)

![Logic Equivalence Check](./Images/Logic_Equivalance_Check_LEC.png)

![Design for Test](./Images/Design_forA_Test_DFT.png)

![Sign-Off](./Images/SignOff.png)

### 6. Timing / Clock Information

![Clock Ratio and Percentage](./Images/clock%20ratio%26percentage.png)

## Important Concepts

### What is a PDK?

A Process Design Kit provides the technology-specific information required by EDA tools to design and implement a circuit for a particular semiconductor process. In this workshop, the Sky130 PDK is used as the technology context.

### What is Synthesis?

Synthesis converts an RTL description into a gate-level representation using available standard-cell libraries and design constraints. The resulting netlist becomes an input to subsequent physical implementation stages.

### Why OpenLANE?

The workshop uses OpenLANE to demonstrate an open-source digital ASIC implementation flow. It provides a practical environment in which synthesis and later physical-design stages can be executed using open-source tools and the Sky130 technology.

## Key Takeaways

- Digital IC implementation is a chain of connected stages rather than a single tool operation.
- The PDK establishes the technology context for the design tools.
- OpenLANE connects RTL design with physical implementation stages.
- Synthesis produces a gate-level netlist that is used by later physical-design stages.
- Understanding the flow and project structure is essential before performing floorplanning, placement, CTS and routing.

## Tools / Technologies Introduced

- OpenLANE
- Sky130 PDK
- Open-source EDA tools
- Linux / Ubuntu environment
- Synthesis and static-timing concepts
- RISC-V / SoC design context
