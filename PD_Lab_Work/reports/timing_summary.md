# Timing Summary — VSDBabySoC

## Timing evidence available

| Evidence source | Reported value | What it represents |
|---|---:|---|
| `images/06_opensta_setup_timing.png` | Slack = 7.35 (MET) | Displayed setup-oriented/max-delay path |
| `images/07_opensta_hold_timing.png` | Slack = 0.28 (MET) | Displayed hold-oriented/min-delay path |
| Supplied reference context | WNS max = 0.00 | Summary value stated in the reference notes |
| Supplied reference context | TNS max = 0.00 | Summary value stated in the reference notes |

## Commands
```tcl
report_wns
report_tns
report_checks -path_delay max
report_checks -path_delay min
```

## Qualification
The two screenshot slack values are for the paths visible in those screenshots. They should not be treated as global worst slack or total negative slack. The `WNS max` and `TNS max` values above are copied only from the supplied context notes, not independently recomputed from raw timing logs in the ZIP.

The package does not include a complete machine-readable OpenSTA log with timing units and all summary lines. As a result, this file is an evidence summary, not a timing sign-off certificate.
