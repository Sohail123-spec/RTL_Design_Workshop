<<<<<<< HEAD
# Module 1 — Inception of Open-Source EDA, OpenLANE and Sky130 PDK

## Overview

This module establishes the foundation for the Physical Design workshop by introducing open-source EDA, the OpenLANE flow, the Sky130 PDK, SoC/RISC-V context, and the early stages of an RTL-to-GDS implementation flow. The practical material also covers OpenLANE project structure, design preparation, synthesis review, and characterization of synthesis results.

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
- Design preparation step
- Review files after design prep and run synthesis
- OpenLANE project Git link description
- Steps to characterize synthesis results

## Practical Focus

The module connects the conceptual RTL-to-GDS flow with the practical OpenLANE environment. It includes figures covering chip/package terminology, RISC-V and SoC concepts, the overall open-source digital design flow, OpenLANE, synthesis, floorplanning, placement, routing, sign-off, technology/tool-specific information, and related implementation concepts.

## Figures / Practical Evidence

All figures supplied with Module 1 are retained in the `Images` directory. The filenames below are the original supplied filenames.

- **Arduino chip** — [Figure](<./Images/Arduino_chip.png>)
- **Clock Tree Synthesis** — [Figure](<./Images/Clock_Tree_Synthesis.png>)
- **Dealing with Antenna Violations** — [Figure](<./Images/Dealing_with_Antenna_Violations.png>)
- **Design Exploration** — [Figure](<./Images/Design_Exploration.png>)
- **Design forA Test DFT** — [Figure](<./Images/Design_forA_Test_DFT.png>)
- **Digigtal ASIC Design** — [Figure](<./Images/Digigtal_ASIC_Design.png>)
- **Floor Planing** — [Figure](<./Images/Floor_Planing.png>)
- **Foundary IP's  &  Macros** — [Figure](<./Images/Foundary_IP's_&_Macros.png>)
- **Logic Equivalance Check LEC** — [Figure](<./Images/Logic_Equivalance_Check_LEC.png>)
- **OpenLane Regression Testing** — [Figure](<./Images/OpenLane_Regression_Testing.png>)
- **OpenSource Digitsl Design** — [Figure](<./Images/OpenSource_Digitsl_Design.png>)
- **Openlane** — [Figure](<./Images/Openlane.png>)
- **Openlane ASIC flow** — [Figure](<./Images/Openlane_ASIC_flow.png>)
- **Placement** — [Figure](<./Images/Placement.png>)
- **Power Planning** — [Figure](<./Images/Power_Planning.png>)
- **Processor SoC** — [Figure](<./Images/Processor_SoC.png>)
- **RISC-V Archetechture  &  Layout** — [Figure](<./Images/RISC-V_Archetechture_&_Layout.png>)
- **Routing** — [Figure](<./Images/Routing.png>)
- **SignOff** — [Figure](<./Images/SignOff.png>)
- **Simplified RTL to GDSII flow** — [Figure](<./Images/Simplified_RTL_to_GDSII_flow.png>)
- **Static Time Analysis** — [Figure](<./Images/Static_Time_Analysis.png>)
- **Synthesis** — [Figure](<./Images/Synthesis.png>)
- **Synthesis Exploration** — [Figure](<./Images/Synthesis_Exploration.png>)
- **Synthesis netlist** — [Figure](<./Images/Synthesis_netlist.png>)
- **System overview** — [Figure](<./Images/System_overview.png>)
- **Technology Specific** — [Figure](<./Images/Technology_Specific.png>)
- **Tools Specfic** — [Figure](<./Images/Tools_Specfic.png>)
- **What is PDK** — [Figure](<./Images/What is PDK.png>)
- **What is PDK2** — [Figure](<./Images/What is PDK2.png>)
- **chip1** — [Figure](<./Images/chip1.png>)
- **chip2** — [Figure](<./Images/chip2.png>)
- **chip area** — [Figure](<./Images/chip_area.png>)
- **clock ratio & percentage** — [Figure](<./Images/clock ratio&percentage.png>)
- **compiler input  &  output** — [Figure](<./Images/compiler_input_&_output.png>)
- **overall tech & tools** — [Figure](<./Images/overall_tech&tools.png>)
- **package** — [Figure](<./Images/package.png>)
- **strive SoC Family** — [Figure](<./Images/strive_SoC_Family.png>)

## Key Takeaways

- Open-source EDA tools form the practical environment used for digital ASIC implementation.
- OpenLANE is introduced as the implementation flow connecting RTL and physical-design stages.
- The Sky130 PDK provides technology-specific information used by the flow.
- The module introduces synthesis and the generated gate-level netlist before later physical-design stages.
- OpenLANE directory structure, design preparation, synthesis review, and synthesis-result characterization are part of the hands-on workflow.
=======
# Module 1 — Inception of Open-Source EDA, OpenLane and Sky130 PDK

## Overview

This module introduces the foundations of open-source Electronic Design Automation (EDA), the OpenLane RTL-to-GDSII flow, and the Sky130 Process Design Kit (PDK).

The practical work includes exploring the OpenLane environment, understanding the tools involved in the flow, examining technology-specific information, and observing synthesis/netlist generation.

## Topics Covered

### 1. How to Talk to Computers

Understanding how a high-level hardware description is transformed into lower-level representations that can ultimately be implemented as digital hardware.

### 2. SoC Design and OpenLane

Introduction to:

- System-on-Chip (SoC) design
- RTL design
- Synthesis
- Physical design
- OpenLane's role in the RTL-to-GDSII flow

### 3. Getting Familiar with Open-Source EDA Tools

Practical exploration of the tools and files used by OpenLane.

### 4. Technology-Specific and Tool-Specific Concepts

Understanding the distinction between:

- **Technology-specific information** — related to the target fabrication technology/PDK.
- **Tool-specific information** — related to the EDA tools used during implementation.

### 5. Synthesis and Netlist

The synthesis stage converts RTL into a gate-level representation using cells from the target standard-cell library.

The practical screenshot shows the generated synthesis/netlist information.

### 6. Basic Timing-Related Calculations

The module also includes practical calculations involving clock-related values, ratios and percentages.

## Practical Screenshots

### OpenLane

![OpenLane](./images/Openlane.png)

### Overall Technology and Tools

![Overall Technology and Tools](./images/overall_tech&tools.png)

### Technology-Specific Information

![Technology Specific](./images/Technology_Specific.png)

### Tool-Specific Information

![Tools Specific](./images/Tools_Specfic.png)

### Synthesis Netlist

![Synthesis Netlist](./images/Synthesis_netlist.png)

### Chip Area

![Chip Area](./images/chip_area.png)

### Clock Ratio and Percentage

![Clock Ratio and Percentage](./images/clock%20ratio%26percentage.png)

## Key Takeaways

- Open-source EDA tools can be used to implement digital IC designs.
- OpenLane provides an automated RTL-to-GDSII implementation flow.
- The PDK supplies technology-dependent information required by the implementation tools.
- Synthesis produces a gate-level netlist suitable for subsequent physical-design stages.
- Tool configuration and technology configuration serve different purposes in an EDA flow.
>>>>>>> 54e94f512135261a796442041bef0920545f2e74
