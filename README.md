# An Efficient Pipelined and Double-Issue MIPS Processor Design
> **Developed with Verilog | Targeted for FPGA Implementation**

## 📌 Overview
This project features a high-performance, **32-bit Double-Issue Pipelined MIPS Processor**. By fetching and executing two instructions simultaneously, the design significantly improves **Clockcycles Per Instruction (CPI)** compared to a standard single-issue pipeline.

## 🚀 Key Features
* **Double-Issue Architecture**: Parallel execution paths for arithmetic and memory operations.
* **5-Stage Pipeline**: Optimized Fetch, Decode, Execute, Memory, and Write-back stages.
* **Hazard Management**: 
* **Data Forwarding**: Minimizes stalls by routing data directly between stages.
* **High Maximun Frequency and low consumption**: The project is able to operate in 166.67 MHz stably and having low power consumption at the same time.

## 🏗 System Architecture
**MIPS Architecture**
**(Docs/Double-issue MIPS.png)**
*Detailed block diagram showing the Dual-Issue dispatch logic and Forwarding paths.*

## 📂 Repository Structure
* `src/`: Core Verilog source files (ALU, RegFile, Pipeline registers).
* `test/`: Testbenches and MIPS assembly patterns (.mem/.hex).
* `docs/`: Detailed design specifications and simulation waveforms.

## 🛠 How to Run Simulation
1.  Clone the repository:
    ```bash
    git clone [https://github.com/YourUsername/YourRepoName.git](https://github.com/YourUsername/YourRepoName.git)
    ```
2.  Open the project in your preferred EDA tool (e.g., Vivado, ModelSim, or Icarus Verilog).
3.  Run the top-level testbench: `test/cpu_tb.v`.

## ✅ Verification
The correctness of this processor is verified through a suite of testbenches covering various hazard scenarios.

For detailed test plans, corner case analysis, and simulation results, please see:
👉 **[Full Verification Report](Docs/Verification.md)**

### Performance
* **Target FPGA**: Xilinx Artix-7 (or your specific board).
* **Max Frequency**: ~100 MHz (Estimated).
* **Resource Utilization**: ~XXXX LUTs, ~XXXX Registers.

---
## ✉️ Contact
**Your Name** - [Your Email] - [Your LinkedIn Profile]
