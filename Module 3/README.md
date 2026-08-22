# Module 3 – Combinational and Sequential Optimizations

## Table of Contents

- [Overview](#overview)
- [1. Combinational Logic Optimization](#1-combinational-logic-optimization)
  - [opt_check](#opt_check)
  - [opt_check2](#opt_check2)
  - [opt_check3](#opt_check3)
  - [opt_check4](#opt_check4)
- [2. Sequential Logic Optimization — DFF Constant Propagation](#2-sequential-logic-optimization--dff-constant-propagation)
  - [dff_const1](#dff_const1)
  - [dff_const2](#dff_const2)
  - [dff_const3](#dff_const3)
  - [dff_const4](#dff_const4)
  - [dff_const5](#dff_const5)
- [3. Sequential Optimization — Counters](#3-sequential-optimization--counters)
  - [counter_opt](#counter_opt)
  - [counter_opt2](#counter_opt2)
- [Key Takeaways](#key-takeaways)

## Overview

Logic optimization is the step where a synthesis tool simplifies a design's Boolean expressions and sequential elements while preserving functional behavior. This module works through it in two halves: **combinational optimization** (simplifying `assign` logic driven by ternary/conditional expressions) and **sequential optimization** (identifying flip-flops whose output is effectively constant, or counter bits that don't actually feed any output).

Flow used throughout: Yosys `read_liberty` → `read_verilog` → `synth -top <module>` → `abc -liberty <lib>` → `show` (for the gate-level diagram).

---

## 1. Combinational Logic Optimization

### opt_check

```verilog
module opt_check (input a , input b , output y);
	assign y = a?b:0;
endmodule
```

`y = a ? b : 0` collapses to a 2-input AND gate (`y = a & b`) — the ternary is a mux, but since one input is a constant 0, synthesis reduces it to a single gate instead of a mux.

| Code | Optimized Netlist |
|---|---|
| ![opt_check code](opt_check_code.png) | ![opt_check optimized diagram](opt_check.png) |

### opt_check2

```verilog
module opt_check2 (input a , input b , output y);
	assign y = a?1:b;
endmodule
```

`y = a ? 1 : b` reduces to an OR gate (`y = a \| b`).

| Code | Optimized Netlist |
|---|---|
| ![opt_check2 code](opt_check2_code.png) | ![opt_check2 optimized diagram](opt_check2.png) |

### opt_check3

```verilog
module opt_check3 (input a , input b, input c , output y);
	assign y = a?(c?b:0):0;
endmodule
```

Nested ternaries with constant 0 branches collapse to a 3-input AND (`y = a & b & c`).

| Code | Optimized Netlist |
|---|---|
| ![opt_check3 code](opt_check3_code.png) | ![opt_check3 optimized diagram](opt_check_3.png) |

### opt_check4

```verilog
module opt_check4 (input a , input b , input c , output y);
	assign y = a?(b?(a & c):c):(!c);
endmodule
```

A deliberately messier expression (the inner `a & c` is redundant since `a` is already known to be 1 on that branch) — this is the case that best shows the synthesizer doing real Boolean simplification rather than a mechanical mux mapping.

| Code | Optimized Netlist |
|---|---|
| ![opt_check4 code](opt_check4_code.png) | ![opt_check4 optimized diagram](opt_check_4.png) |

---

## 2. Sequential Logic Optimization — DFF Constant Propagation

Five variants of the same idea: does the flip-flop's output actually depend on the clock/reset history, or can it be replaced with a constant (or a simpler structure) without changing behavior?

### dff_const1

```verilog
module dff_const1(input clk, input reset, output reg q);
always @(posedge clk, posedge reset)
begin
	if(reset)
		q <= 1'b0;
	else
		q <= 1'b1;
end
endmodule
```

`q` genuinely differs between reset and normal operation, so this is the **non-optimizable baseline** — a real flip-flop is required and nothing gets removed.

| Optimized Diagram | Waveform |
|---|---|
| ![dff_const1 diagram](dff_const.png) | ![dff_const1 waveform](dff_const1_waveform.png) |

### dff_const2

```verilog
module dff_const2(input clk, input reset, output reg q);
always @(posedge clk, posedge reset)
begin
	if(reset)
		q <= 1'b1;
	else
		q <= 1'b1;
end
endmodule
```

`q` is `1'b1` on both branches — it is a true constant regardless of clock or reset. Synthesis removes the flip-flop entirely and ties `q` directly to `1`.

| Optimized Diagram | Waveform |
|---|---|
| ![dff_const2 diagram](dff_const2.png) | ![dff_const2 waveform](dff_const2_waveform.png) |

**Code for dff_const1 and dff_const2:** ![dff_const1 & dff_const2 code](dff_const1_2_code.png)

### dff_const3

```verilog
module dff_const3(input clk, input reset, output reg q);
reg q1;
always @(posedge clk, posedge reset)
begin
	if(reset)
	begin
		q1 <= 1'b0;
		q  <= 1'b1;
	end
	else
	begin
		q1 <= 1'b1;
		q  <= q1;
	end
end
endmodule
```

An internal register `q1` feeds `q` with a one-cycle delay. `q1` is not constant, so this one keeps two real flip-flops in series (`q` and `q1`) — nothing collapses here; it's the contrast case against const4/const5.

| Optimized Diagram | Waveform |
|---|---|
| ![dff_const3 diagram](dff_const3.png) | ![dff_const3 waveform](dff_const3_waveform.png) |

### dff_const4

```verilog
module dff_const4(input clk, input reset, output reg q);
reg q1;
always @(posedge clk, posedge reset)
begin
	if(reset)
	begin
		q1 <= 1'b1;
		q  <= 1'b1;
	end
	else
	begin
		q1 <= 1'b1;
		q  <= q1;
	end
end
endmodule
```

`q1` is `1'b1` on every branch, making `q1` a true constant — and since `q` only ever samples `q1` (itself always 1) or is directly set to 1, `q` collapses to a constant too. Both flip-flops disappear during synthesis.

| Optimized Diagram | Waveform |
|---|---|
| ![dff_const4 diagram](dff_const4.png) | ![dff_const4 waveform](dff_const4_waveform.png) |

**Code for dff_const3 and dff_const4:** ![dff_const3 & dff_const4 code](dff_const3_4_code.png)

### dff_const5

```verilog
module dff_const5(input clk, input reset, output reg q);
reg q1;
always @(posedge clk, posedge reset)
begin
	if(reset)
	begin
		q  <= 1'b0;
		q1 <= 1'b0;
	end
	else
	begin
		q1 <= 1'b1;
		q  <= q1;
	end
end
endmodule
```

Similar shape to const3, but both `q` and `q1` reset to `0` instead of differing values. `q1` still isn't constant across all conditions in the way const4's was, so this again keeps real sequential depth rather than collapsing to a constant.

| Code | Optimized Diagram | Waveform |
|---|---|---|
| ![dff_const5 code](dff_const5_code.png) | ![dff_const5 diagram](dff_const5.png) | ![dff_const5 waveform](dff_const5_waveform.png) |

---

## 3. Sequential Optimization — Counters

### counter_opt

```verilog
module counter_opt (input clk , input reset , output q);
reg [2:0] count;
assign q = count[0];

always @(posedge clk ,posedge reset)
begin
	if(reset)
		count <= 3'b000;
	else
		count <= count + 1;
end
endmodule
```

Only `count[0]` (the LSB — a simple toggle flip-flop) drives the output `q`. `count[1]` and `count[2]` don't feed anything observable, so synthesis can discard those two bits and keep only the one flip-flop that actually matters.

| Code | Optimized Diagram | Waveform |
|---|---|---|
| ![counter_opt code](counter_opt_code.png) | ![counter_opt diagram](counter_opt.png) | ![counter_opt waveform](counter_opt_waveform.png) |

### counter_opt2

```verilog
module counter_opt (input clk , input reset , output q);
reg [2:0] count;
assign q = (count[2:0] == 3'b100);

always @(posedge clk ,posedge reset)
begin
	if(reset)
		count <= 3'b000;
	else
		count <= count + 1;
end
endmodule
```

Here the output depends on a comparison against all 3 bits, so — unlike `counter_opt` — every bit of `count` is genuinely required and synthesis keeps the full 3-bit counter plus the comparator logic.

| Code | Optimized Diagram |
|---|---|
| ![counter_opt2 code](counter_opt2_code.png) | ![counter_opt2 diagram](counter_opt2.png) |

---

## Key Takeaways

- Ternary-based combinational logic with constant branches (`? : 0`, `? 1 :`) collapses to plain gates (AND/OR) instead of a full mux — synthesis reads through the constants.
- A flip-flop is only removed if its value is provably constant on **every** path (both reset and clocked branches) — `dff_const2` and `dff_const4` qualify, `dff_const1`, `dff_const3`, `dff_const5` do not.
- For counters, only the bits that actually reach an output survive synthesis — `counter_opt` keeps 1 of 3 bits, `counter_opt2` keeps all 3 because the output depends on the full comparison.
