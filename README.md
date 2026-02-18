# An Efficient Pipelined and Double-Issue MIPS Processor Design
> **Developed with Verilog | Targeted for FPGA Implementation**

## 📌 Overview
This project features a high-performance, **32-bit Double-Issue Pipelined MIPS Processor**. By fetching and executing two instructions simultaneously, the design significantly improves **Clockcycles Per Instruction (CPI)** compared to a standard single-issue pipeline.

## 🚀 Key Features
* **Double-Issue Architecture**: Parallel execution paths for arithmetic and memory operations.
* **5-Stage Pipeline**: Optimized Fetch, Decode, Execute, Memory, and Write-back stages.
* **Hazard Management**: Use logic units to discern whether it is hazard and design control signals to eliminate RAW exception.
* **Data Forwarding**: Minimizes stalls by routing data directly between stages.
* **High Maximun Frequency and Low Power Consumption**: The project is able to operate under 166.67 MHz stably with low power consumption.

## 🏗 System Architecture
![MIPS Architecture](https://github.com/HHY-gigabtye/An-Efficient-Pipelined-and-Double-Issue-MIPS-Processor-Design-with-Verilog-on-FPGA/blob/main/Docs/Double-issue%20MIPS.png)
*Detailed block diagram showing the Dual-Issue dispatch logic and Forwarding paths.*

## 📂 Repository Structure
* `SRC/`: Core Verilog source files (ALU, RegFile, Pipeline registers).
* `Testbench/`: Testbenches and MIPS assembly patterns (.mem/.hex).
* `Docs/`: Detailed design specifications and simulation waveforms.
* `FPGA/`:
* `Behaviroal Model/`:

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
