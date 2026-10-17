# Corner review: ss_n40C_1v60

**Author:** MD Soahil Ahmed

## Reported metrics

| Metric | Value |
|---|---:|
| Setup WNS | -0.8504 ns |
| Setup TNS | -17.4777 ns |
| Hold WNS | 0.6539 ns |
| Hold TNS | 0.0000 ns |
| Report status | OK |

## Interpretation

- Process family inferred from corner label: **slow**.
- Setup WNS is **negative (setup violation indicated)**.
- Hold WNS is **non-negative**.
- The reported setup TNS is -17.4777 ns and hold TNS is 0.0000 ns.

## Limitation

This review sheet contains the metrics present in the corner summary CSV only. It does not reproduce path-level timing details, launch/capture points, cell/net delays, or constraints. Consult the original `setup.rpt`, `hold.rpt`, and `unconstrained.rpt` files for those details.
