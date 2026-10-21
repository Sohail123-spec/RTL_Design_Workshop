# P14 — Final artifact handoff and integrity inventory

## Scope
This checkpoint packages a traceable inventory of the final physical-design artifacts included in the supplied archive. It does not claim foundry signoff.

## Included final artifacts
- `flow/results/sky130hd/pump_protection_controller/base/6_final.gds`
- `flow/results/sky130hd/pump_protection_controller/base/6_1_merged.gds`
- `flow/results/sky130hd/pump_protection_controller/base/6_final.odb`
- `flow/results/sky130hd/pump_protection_controller/base/6_final.def`
- `flow/results/sky130hd/pump_protection_controller/base/6_final.v`
- `flow/results/sky130hd/pump_protection_controller/base/6_final.spef`
- `flow/reports/sky130hd/pump_protection_controller/base/6_finish.rpt`
- `flow/reports/sky130hd/pump_protection_controller/base/6_drc_count.rpt`
- `flow/logs/sky130hd/pump_protection_controller/base/6_lvs.log`

## Snapshot facts read from included files
- Final GDS file size: 221,816 bytes (216.6 KiB) if present.
- DRC count report content: `0`.
- Final report TNS: `0.00`; WNS: `0.00`; worst slack: `14.80`.
- `core_clock` period minimum: `1.47` ns; reported fmax: `678.21` MHz.
- Synthesis area from `synth_stat.txt`: `454.185600` library area units.
- Synthesis check reports zero problems: yes.
- LVS log contains the message “Congratulations! Netlists match.”: yes.

## Integrity manifest
`SHA256SUMS.txt` records SHA-256 hashes for the key source and generated output files. Verify from the repository root with:

```bash
sha256sum -c Water_Pump_Dry_Run_Controller/docs/evidence/P14/SHA256SUMS.txt
```

The manifest is a snapshot identity aid, not an independent physical verification or signoff certificate.
