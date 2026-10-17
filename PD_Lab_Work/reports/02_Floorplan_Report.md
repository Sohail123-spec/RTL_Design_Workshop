# Floorplanning Report — VSDBabySoC

## Objective
Floorplanning establishes the physical canvas for the design. It defines the die/core region and margins and accounts for major blocks and I/O planning before standard-cell placement.

## Lab evidence
![Floorplan GUI view](../images/02_floorplan_gui.png)

![Floorplan database view](../images/02_floorplan_database.png)

## What the views demonstrate
The supplied views document the floorplan in the OpenROAD/Magic-style layout interface and a saved floorplan database view. The design canvas and its organization are visible at the scales captured in the screenshots.

## Why this stage matters
A floorplan that is too tight can create congestion and make later placement and routing difficult. The core dimensions, utilization target, margins, macro locations, and pin locations influence the quality of later implementation stages.

## Recorded result
The supplied context describes the floorplan and core area as established for the next stage. The screenshot of a configuration file includes design setup parameters; it is not treated here as a verified report of the final floorplan dimensions.

## Data not supplied
No authoritative utilization percentage, die/core area table, macro-placement report, or congestion estimate was provided as text. These metrics are therefore not inferred from images alone.
