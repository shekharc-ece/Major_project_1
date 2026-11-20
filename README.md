# Arithmetic Logic Unit (ALU) — Verilog HDL

An Arithmetic Logic Unit (ALU) designed, functionally verified, and synthesized in Verilog HDL[cite: 7]. This repository includes both the RTL design and the post-synthesis gate-level netlist alongside dedicated simulation testbenches for pre- and post-synthesis verification[cite: 7].

---

## Repository Structure

| File | Description |
| :--- | :--- |
| `alu.v` | Behavioral/RTL Verilog implementation of the Arithmetic Logic Unit (arithmetic and bitwise logical operations)[cite: 7]. |
| `tb_alu.v` | RTL simulation testbench used to verify ALU opcode selection, operand inputs, flags, and output results[cite: 7]. |
| `synthesized_alu.v` | Gate-level synthesized Verilog netlist generated after logic synthesis[cite: 7]. |
| `synthesized_tb.v` | Post-synthesis testbench used to verify functional equivalence of the synthesized ALU netlist[cite: 7]. |
| `.gitignore` | Excludes compiled simulation executables (`*_sim`) and VCD waveform dumps (`*.vcd`) from version control[cite: 7]. |

---

## Overview

* **RTL Design (`alu.v`):** Implements core arithmetic (addition, subtraction) and logical (AND, OR, XOR, NOT, shift) operations controlled by an opcode select input[cite: 7].
* **RTL Verification (`tb_alu.v`):** Applies stimulus vectors across different opcodes and operand combinations, dumping signal transitions to `alu.vcd` for timing and functional inspection[cite: 7].
* **Logic Synthesis (`synthesized_alu.v`):** Represents the gate-level netlist produced by synthesizing `alu.v`[cite: 7].
* **Gate-Level Verification (`synthesized_tb.v`):** Drives the synthesized netlist (`synthesized_alu.v`) and dumps waveform outputs to `synthesized_alu.vcd` to confirm that post-synthesis behavior matches the RTL specification[cite: 7].

---

## Simulation & Waveform Viewing (Ubuntu / Icarus Verilog)

### 1. RTL Simulation
```bash
iverilog -o alu_sim alu.v tb_alu.v
vvp alu_sim
gtkwave alu.vcd
