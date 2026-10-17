# Routing Report — VSDBabySoC

## Objective
Routing creates physical interconnect between placed cells and macros. It uses metal layers and vias to implement the connections while respecting technology design rules and routing constraints.

## Lab evidence
![Full routed view](../images/05_routing_full_view.png)

![Detailed routed view](../images/08_routing_detailed_view.png)

A separate close-up is available at [`placement_congestion_detail.jpeg`](../images/placement_congestion_detail.jpeg).

## Observations
The supplied OpenROAD GUI screenshots show routed metal geometry at whole-design and detailed scales. The layer legend in the close-up distinguishes multiple metal and via layers. The images are visual records of routing inspection rather than machine-readable sign-off reports.

## What should be checked in a complete route report
A complete routed-design review commonly checks global/detail-route completion, unrouted nets, design-rule violations, antenna checks where applicable, total wire length, via count, and post-route timing using extracted or estimated parasitics.

## Recorded result and limitation
The provided context says routing was performed and that the routed database was inspected in the GUI. The user's screenshots do not provide a clear authoritative summary of total wire length, via count, DRC count, or unrouted nets. Numeric values from the separate reference repository are not copied into this report because they have not been verified against this run.
