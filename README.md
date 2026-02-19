# An Efficient Pipelined and Double-Issue MIPS Processor Design
> **🏆 Awarded Honorable Mention in the Senior Capstone Project Competition
Department of Electrical Engineering, National Chung Hsing University (NCHU EE)**

> **Developed with Verilog | Targeted for FPGA Implementation**

## 📌 Overview
This project features a high-performance, **32-bit Double-Issue Pipelined MIPS Processor**. By fetching and executing two instructions simultaneously, the design significantly improves **Clockcycles Per Instruction (CPI)** compared to a standard single-issue pipeline.

## 🚀 Key Features
* **Double-Issue Architecture**: Parallel execution paths for arithmetic and memory operations.
* **5-Stage Pipeline**: Optimized Fetch, Decode, Execute, Memory, and Write-back stages.
* **High Maximun Frequency and Low Power Consumption**: The project is able to operate under 166.67 MHz stably with low power consumption.
* **CPI Cut Down**: Compare to single-issue MIPS, the CPI is cut down by 17%.
* **Hazard Management**: Use logic units to discern whether it is hazard and design control signals to eliminate RAW exception.
* **Data Forwarding**: Minimizes stalls by routing data directly between stages.

## 🏗 System Architecture
![MIPS Architecture](https://github.com/HHY-gigabtye/An-Efficient-Pipelined-and-Double-Issue-MIPS-Processor-Design-with-Verilog-on-FPGA/blob/main/Docs/Double-issue%20MIPS.png)
*Detailed block diagram showing the Dual-Issue dispatch logic and Forwarding paths.*

## 📂 Repository Structure
* `SRC/`: Core Verilog source files (ALU, Register, Pipeline registers, stages, forwarding units, hazard detection unit and memory).
* `Testbench/`: Testbench for simulation.
* `Docs/`: Detailed design specifications, simulation waveforms and verification.
* `FPGA/`: Modules for verificating on NEXYS DDR4 FPGA Board.
* `Behaviroal Model/`: C and Assembly files which tested the program of insertion sort.

## 🛠 How to Run Simulation
1.  Download SRC file.
2.  Create a project in your preferred EDA tool (e.g., Vivado, ModelSim, or Icarus Verilog).
3.  Add source codes to the project.
4.  Run the testbench: `Testbench/mips_tb.v`.

## ✅ Verification
The correctness of this processor is verified through insertion sort program, simulated and implemented on EDA tool and FPGA board.

For detailed test plans, corner case analysis, and simulation results, please see:
👉 **[Full Verification Report](Docs/Verification.md)**

## 📈 Performance
* **Target FPGA**: NEXYS DDR4 FPGA Board.
* **Max Frequency**: 166.67 MHz.
* **CPI Reduction**: 17%.
* **Resource Utilization**: 3719 LUTs, 1916 FFs.
* 
## 🏆 Recognition
* **Award**: Honorable Mention
* **Event**: Senior Capstone Project Competition
* **Organization**: Department of Electrical Engineering, National Chung Hsing University (NCHU EE)
* **Date**: Dec 2025
---
## ✉️ Contact
**Ho Hsuan Yi** - [julianho1028@gmail.com]
