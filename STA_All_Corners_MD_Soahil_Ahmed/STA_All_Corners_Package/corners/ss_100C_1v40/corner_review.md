# Corner review: ss_100C_1v40

**Author:** MD Soahil Ahmed

## Reported metrics

| Metric | Value |
|---|---:|
| Setup WNS | -4.1254 ns |
| Setup TNS | -398.1285 ns |
| Hold WNS | 0.9008 ns |
| Hold TNS | 0.0000 ns |
| Report status | OK |

## Interpretation

- Process family inferred from corner label: **slow**.
- Setup WNS is **negative (setup violation indicated)**.
- Hold WNS is **non-negative**.
- The reported setup TNS is -398.1285 ns and hold TNS is 0.0000 ns.

## Limitation

This review sheet contains the metrics present in the corner summary CSV only. It does not reproduce path-level timing details, launch/capture points, cell/net delays, or constraints. Consult the original `setup.rpt`, `hold.rpt`, and `unconstrained.rpt` files for those details.
