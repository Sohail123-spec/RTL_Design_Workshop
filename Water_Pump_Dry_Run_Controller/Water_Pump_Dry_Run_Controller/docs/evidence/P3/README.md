# P3 — Compile and Initial Test Evidence

## Purpose
P3 captures the available evidence that the RTL and its testbench were compiled and exercised during the initial verification pass.

## Evidence in this folder
- [`pump_controller_testbench_pass.png`](./pump_controller_testbench_pass.png) — screenshot of the recorded testbench pass output.

## Evidence gallery

The images below render directly in this README on GitHub. The original image files remain in this folder for separate viewing or download.

### pump controller testbench pass

![pump controller testbench pass](./pump_controller_testbench_pass.png)

## Interpretation
The screenshot is the archived evidence for this checkpoint. A complete compiler/test command transcript is not separately stored in this folder, so do not present this image as a full reproducible log.

## Review checklist
- [ ] Confirm the screenshot shows the intended controller testbench and a successful completion message.
- [ ] Check that the testbench source is present under `simulation/`.
- [ ] Use P4 and P5 for the detailed waveform and safety/corner-case evidence.

**Status note:** The project progress log records P3 as passed based on the captured screenshot, with the limitation that a complete compile transcript is not archived here.

## Related evidence
- [P2 — RTL implementation](../P2/README.md)
- [P4 — Simulation and waveforms](../P4/README.md)
- [P5 — Safety and corner cases](../P5/README.md)
