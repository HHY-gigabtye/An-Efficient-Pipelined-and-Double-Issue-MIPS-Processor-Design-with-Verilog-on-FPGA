# Verification

This document details the verification that ensures the functional correctness of the **Double-Issue MIPS Processor**, specifically focusing on hazard detection and parallel execution.

## 1. Verification Strategy
We employed a **layered verification approach**:
* **Simulation**: Each module (ALU, Register File, Decoder) was tested individually with dedicated testbenches.
* **FPGA Implementation**: The full CPU was tested by executing MIPS assembly programs and comparing the architectural state (Registers/Memory).

## 2. Test Scenarios
To verify the Double-Issue logic, I used imsertion sort to validate functionality.

## 3. Simulation Environment
* **Simulator**: [例如: Vivado XSIM / Icarus Verilog]
* **Waveform Viewer**: [例如: GTKWave / Vivado Waveform Window]
* **Testbench Type**: Self-checking testbench with memory image loading (`$readmemh`).

## 4. Key Simulation Results
### Double-Issue Demonstration
Below is the waveform showing the **Dispatch Unit** issuing two instructions simultaneously:

*Observation: The Program Counter (PC) increments by 8, and two write-back signals occur at the same clock edge.*

## 5. How to Reproduce
To run the verification suite:
1. Navigate to the `test/` directory.
2. Run the command: `[你的執行指令，例如: iverilog -o sim cpu_tb.v]`
3. Check the console output for `TEST PASSED` message.
