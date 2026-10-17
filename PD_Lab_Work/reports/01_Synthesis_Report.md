# Synthesis Report — VSDBabySoC

## Objective
Synthesis converts the RTL description into a gate-level implementation mapped to cells available in the target technology library. The synthesized design becomes the basis for floorplanning and later physical-design steps.

## Lab evidence
![Synthesis output](../images/01_synthesis_output.png)

The supplied screenshot captures the synthesis output/session. Configuration context is available in [`design_config_mk.png`](../images/design_config_mk.png) and [`flow_configuration_clock_floorplan.png`](../images/flow_configuration_clock_floorplan.png).

## Interpretation
The synthesis stage is the hand-off between RTL and physical implementation. It is important that the selected top-level design, RTL source list, technology libraries, and timing constraints are consistent before proceeding.

## Recorded result
The supplied context states that a synthesized database was generated and then used by the subsequent physical-design stages. No cell-count, area, or synthesis timing summary was included in the supplied source package, so those quantities are not reported here.

## Evidence limitation
This report summarizes the supplied screenshot and notes; it does not claim a fresh synthesis run was executed while assembling this documentation.
