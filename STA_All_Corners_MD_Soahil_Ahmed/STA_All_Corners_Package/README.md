# Multi-Corner Static Timing Analysis — VSDBabySoC

**Author:** MD Soahil Ahmed

## Overview

This package organizes the available 16-corner post-route static timing results for the VSDBabySoC design using the Sky130 HD standard-cell library family. It includes the corner summary table, per-corner interpretation sheets, timing metric charts, and a consolidated PDF review.

## Headline results

- **PVT corners summarized:** 16
- **Setup WNS below zero:** 6 corners
- **Hold WNS below zero:** 0 corners
- **Worst setup WNS:** −30.7252 ns (`ss_n40C_1v28`)
- **Best setup WNS:** +8.0138 ns (`ff_100C_1v95`)
- **Smallest hold WNS:** +0.1916 ns (`ff_n40C_1v95`)
- **Largest setup TNS magnitude:** −13550.8096 ns (`ss_n40C_1v28`)

## Package contents

- `reports/corner_summary.csv` — all reported corner metrics.
- `reports/01_Method_and_Flow.md` — analysis flow and input expectations.
- `reports/02_All_Corner_Results.md` — overview of the complete corner table.
- `reports/03_Setup_Timing_Review.md` and `reports/04_Hold_Timing_Review.md` — timing interpretation.
- `corners/<corner>/corner_review.md` — an individual review sheet for every summarized PVT corner.
- `graphs/` — regenerated charts based on the summary table.
- `STA_All_Corners_Report.pdf` — consolidated report generated from the available summary data.

## Interpretation

Negative setup slack indicates setup timing violations for the associated analysis conditions. All listed hold WNS values are positive and all hold TNS values are zero, so this summary does not show a hold timing violation. A run status of `OK` indicates report-generation status; it is not itself a timing sign-off result.
