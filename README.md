# RTL Design Workshop — VSDIAT

Weekly log of a core-training **RTL Design Workshop** (VSDIAT) covering Verilog RTL design, simulation, and logic synthesis. Each module folder has its own README with concepts, screenshots, and source code so the work is checkable, not just described.

## Progress

| Module | Topic | Status |
|---|---|---|
| [Module 1](./Module%201) | Introduction to Verilog RTL Design and Synthesis | ✅ Completed |
| [Module 2](./Module%202) | Timing Libs, Hierarchical vs Flat Synthesis, Efficient Flop Coding Styles | ✅ Completed |
| [Module 3](./Module%203) | Combinational and Sequential Optimizations | ✅ Completed |
| [Module 4](./Module%204) | GLS, Blocking vs. Non-Blocking, Synthesis-Simulation Mismatch | ✅ Completed |
| [Module 5](./Module%205) | Optimizations in Synthesis (if/case coverage, for/generate loops) | ✅ Completed |

## Repository Structure

```
RTL_Design_Workshop/
│
├── README.md
│
├── Module 1/
│   ├── README.md
│   ├── src/
│   └── images/
│
├── Module 2/
│   ├── README.md
│   └── images/
│
├── Module 3/
│   ├── README.md
│   └── images/          (opt_check*, dff_const*, counter_opt* — code, netlist diagrams, waveforms)
│
├── Module 4/
│   ├── README.md
│   └── images/           (bad_mux/good_mux GLS mismatch, blocking_caveat)
│
└── Module 5/
    ├── README.md
    └── images/           (incomplete if/case latches, bad_case overlap, mux/demux/rca generate loops)
```

Every module folder follows the same shape: a `README.md` walking through each design with its code, a synthesized-netlist or optimized-logic diagram, and (where applicable) a simulation waveform — plus an `images/` folder holding the actual screenshots referenced in that README.

## Tools Used

- Verilog HDL
- Icarus Verilog (`iverilog`) — RTL and gate-level simulation
- GTKWave — waveform viewing
- Yosys — RTL to gate-level synthesis, logic/sequential optimization
- Sky130 standard cell `.lib`

## Author

**Sohail** — B.Tech ECE, Anurag University
[GitHub](https://github.com/Sohail123-spec) · [Portfolio](https://sohail123-spec.github.io/sohail-portfolio) · [LinkedIn](https://linkedin.com/in/contactmdsohailahmed)
