# Module 3 — Design Library Cell Using Magic Layout and ngspice Characterization

## Overview

This module focuses on CMOS inverter simulation, standard-cell layout creation, the CMOS fabrication process, Sky130 technology files, Magic layout/DRC work, and ngspice-based characterization.

## Topics Covered

### SKY130_D3_SK1 — Labs for CMOS inverter ngspice simulations

- IO placer revision
- SPICE deck creation for CMOS inverter
- SPICE simulation lab for CMOS inverter
- Switching Threshold Vm
- Static and dynamic simulation of CMOS inverter
- Lab steps to git clone `vsdstdcelldesign`

### SKY130_D3_SK2 — Inception of Layout – CMOS fabrication process

- Create active regions
- Formation of N-well and P-well
- Formation of gate terminal
- Lightly doped drain (LDD) formation
- Source–drain formation
- Local interconnect formation
- Higher-level metal formation
- Lab introduction to Sky130 basic layers layout and LEF using inverter
- Lab steps to create standard-cell layout and extract SPICE netlist

### SKY130_D3_SK3 — Sky130 Tech File Labs

- Lab steps to create final SPICE deck using Sky130 tech
- Lab steps to characterize inverter using Sky130 model files
- Lab introduction to Magic tool options and DRC rules
- Lab introduction to Sky130 PDKs and steps to download labs
- Lab introduction to Magic and steps to load Sky130 tech-rules
- Lab exercise to fix `poly.9` error in Sky130 tech-file
- Lab exercise to implement poly resistor spacing to diff and tap
- Lab challenge exercise to describe DRC error as geometrical construct
- Lab challenge to find missing or incorrect rules and fix them

## Practical Focus

The practical evidence covers SPICE deck construction and simulation, inverter waveforms and switching behavior, CMOS layout/fabrication layers, standard-cell layout and extraction, Sky130 model files, and Magic DRC rule handling.

## Figures / Practical Evidence

All figures supplied with Module 3 are retained in the `Images` directory.

- **1)subtrate selection** — [Figure](<./Images/1)subtrate_selection.png>)
- **2)creating active region for mask1** — [Figure](<./Images/2)creating_active_region_for_mask1.png>)
- **3)N-well & P-well formation** — [Figure](<./Images/3)N-well&P-well_formation.png>)
- **4)Gate formation** — [Figure](<./Images/4)Gate_formation.png>)
- **5)LDD formation** — [Figure](<./Images/5)LDD_formation.png>)
- **6) Source & Drain formation** — [Figure](<./Images/6) Source&Drain_formation.png>)
- **7)Contacts & Interconnects** — [Figure](<./Images/7)Contacts&Interconnects.png>)
- **8) Higher level metal formation** — [Figure](<./Images/8) Higher_level_metal_formation.png>)
- **CMOS inverter Robustness** — [Figure](<./Images/CMOS_inverter_Robustness.png>)
- **Circuit level simulation program** — [Figure](<./Images/Circuit_level_simulation_program.png>)
- **Layout** — [Figure](<./Images/Layout.png>)
- **Spice deck description** — [Figure](<./Images/Spice_deck_description.png>)
- **Spice waveforms** — [Figure](<./Images/Spice_waveforms.png>)
- **Transient response Waveform** — [Figure](<./Images/Transient_response_Waveform.png>)
- **spice deck connection** — [Figure](<./Images/spice_deck_connection.png>)

## Key Takeaways

- ngspice is used to simulate and characterize the CMOS inverter.
- CMOS layout is connected to the sequence of fabrication-related layers and structures.
- Magic is used for layout inspection and DRC-related work.
- Sky130 technology files and model files are incorporated into the characterization workflow.
- Layout extraction connects the physical standard-cell layout back to a SPICE representation.
