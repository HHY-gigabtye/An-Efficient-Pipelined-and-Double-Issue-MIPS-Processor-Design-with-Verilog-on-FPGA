# An Efficient Pipelined and Double-Issue MIPS Processor Design
> **Developed with Verilog | Targeted for FPGA Implementation**

## 📌 Overview
This project features a high-performance, **32-bit Double-Issue Pipelined MIPS Processor**. By fetching and executing two instructions simultaneously, the design significantly improves **Instructions Per Cycle (IPC)** compared to a standard single-issue pipeline.

## 🚀 Key Features
* **Double-Issue Architecture**: Parallel execution paths for arithmetic and memory operations.
* **5-Stage Pipeline**: Optimized Fetch, Decode, Execute, Memory, and Write-back stages.
* **Hazard Management**: 
    * **Data Forwarding**: Minimizes stalls by routing data directly between stages.
    * **Dynamic/Static Branch Prediction**: Reduces control hazard penalties.
* **FPGA Optimized**: Written in synthesizable Verilog, keeping resource utilization and timing in mind.

## 🏗 System Architecture
*(建議：在此處插入你的架構圖連結)*
![MIPS Architecture](docs/assets/architecture_diagram.png)
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

## 📊 Verification & Results
### Waveform Analysis
*(建議：放上一張雙發射同時執行的波形截圖)*
![Waveform](docs/assets/simulation_waveform.png)
*The waveform demonstrates two instructions (e.g., ADDU and LW) being issued in the same clock cycle.*

### Performance
* **Target FPGA**: Xilinx Artix-7 (or your specific board).
* **Max Frequency**: ~100 MHz (Estimated).
* **Resource Utilization**: ~XXXX LUTs, ~XXXX Registers.

---
## ✉️ Contact
**Your Name** - [Your Email] - [Your LinkedIn Profile]
