# Module 5 — Final Steps for RTL2GDS Using TritonRoute and OpenSTA

## Overview

This module covers the final routing-oriented stages of the workshop: maze routing, design rule checking, power distribution network construction, global/detail routing configuration, and TritonRoute routing features and post-route outputs.

## Topics Covered

### SKY130_D5_SK1 — Routing and design rule check (DRC)

- Introduction to Maze Routing — Lee’s algorithm
- Lee’s Algorithm conclusion
- Design Rule Check

### SKY130_D5_SK2 — Power Distribution Network and routing

- Lab steps to build power distribution network
- Lab steps from power straps to standard-cell power
- Basics of global and detail routing and configure TritonRoute

### SKY130_D5_SK3 — TritonRoute Features

- TritonRoute feature 1 — Honors pre-processed route guides
- TritonRoute Feature 2 & 3 — Inter-guide connectivity and intra- & inter-layer routing
- TritonRoute method to handle connectivity
- Routing topology algorithm and final files list post-route

## Practical Focus

The figures document routing concepts and practical routing results, power planning/PDN work, DRC-clean and DRC-violation examples, TritonRoute route guides, connectivity handling, intra-/inter-layer routing, routing optimization, and final post-route files.

## Figures / Practical Evidence

All figures supplied with Module 5 are retained in the `Images` directory.

- **DRC Clean Via Spacing'** — [Figure](<./Images/DRC_Clean_Via_Spacing'.png>)
- **DRC Clean Via Width** — [Figure](<./Images/DRC_Clean_Via_Width.png>)
- **DRC Clean Wire Spacing** — [Figure](<./Images/DRC_Clean_Wire_Spacing.png>)
- **DRC Violation Single short** — [Figure](<./Images/DRC_Violation_Single_short.png>)
- **Handling Connectivity** — [Figure](<./Images/Handling_Connectivity.png>)
- **Maze Routing** — [Figure](<./Images/Maze_Routing.png>)
- **Preprocessed route guides** — [Figure](<./Images/Preprocessed_route_guides.png>)
- **Route** — [Figure](<./Images/Route.png>)
- **Routing topology algorithm** — [Figure](<./Images/Routing_topology_algorithm.png>)
- **Screenshot 2026-09-11 001033** — [Figure](<./Images/Screenshot 2026-09-11 001033.png>)
- **inter guide conectivity** — [Figure](<./Images/inter_guide_conectivity.png>)
- **intra-layer parallel  &  inter-layer sequential panel routing** — [Figure](<./Images/intra-layer_parallel_&_inter-layer_sequential_panel_routing.png>)
- **openlane** — [Figure](<./Images/openlane.png>)
- **power planning** — [Figure](<./Images/power_planning.png>)
- **routhing optimization** — [Figure](<./Images/routhing_optimization.png>)
- **routing using tritonRoute** — [Figure](<./Images/routing_using_tritonRoute.png>)
- **routing using tritonRoute flow** — [Figure](<./Images/routing_using_tritonRoute_flow.png>)
- **routing using tritonRoute instructions** — [Figure](<./Images/routing_using_tritonRoute_instructions.png>)
- **run cts** — [Figure](<./Images/run_cts.png>)

## Key Takeaways

- Maze routing provides an algorithmic basis for understanding routing paths.
- DRC checks whether the physical layout satisfies process design rules.
- The power distribution network connects power straps to standard-cell power structures.
- TritonRoute is used for global/detail routing and supports route-guide and connectivity handling features.
- Routing uses multiple layers and considers intra-layer and inter-layer connectivity.
- Post-route results include final routing/topology information and associated output files.
