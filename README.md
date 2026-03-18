# 🚀 RISC-V SoC on FPGA  
### From Single-Cycle Core to Pipelined Architecture with Peripherals

---

## 📌 Overview
This repository documents my complete journey of designing and implementing a **RISC-V based System-on-Chip (SoC)** from scratch.  

The project starts with a **single-cycle processor**, evolves into a **pipelined architecture**, and extends into a **full FPGA-based system** with peripherals such as SPI, LCD, and GPIO.

The goal of this project is to gain deep, practical understanding of:
- Computer Architecture  
- Digital System Design  
- Hardware-Software Co-Design  
- FPGA-based System Integration  

---

## 🧠 Key Features

### 🖥️ Processor Design
- ✅ Single-Cycle RISC-V Core  
- 🔄 Pipelined RISC-V Core *(in progress)*  
- ⚡ Hazard Detection & Forwarding *(planned)*  
- 🧩 Modular RTL Design (Datapath + Control Separation)

### 🔌 Peripherals
- SPI Controller  
- LCD Driver (16x2 / ILI9341 - in progress)  
- Button Synchronizer (Metastability-safe input handling)  
- Memory Controller

### HPS<-->FPGA Software Flow
 HPS based C program Compilation Flow
 Complete HPS to FPGA's BRAM automated executable program flow
 
### 🧪 Verification
- ModelSim Testbenches  
- Automated Simulation Scripts  
- Waveform Analysis  

### 🟦 FPGA Implementation
- SSD (Seven Segment Display) Output  
- On-board testing and validation
- Interfacing the FPGA with External Peripherals
- Complete Computer System 
- Hardware-level debugging  

---

## 📁 Repository Structure
RISCV-SoC-FPGA/
│
├── assembly/ # RISC-V assembly programs
├── rtl/ # Processor RTL (VHDL)
│ ├── single_cycle/
│ ├── pipelined/
│ └── common/
│
├── peripherals/ # SPI, LCD, Buttons, Memory Controller
├── fpga/ # FPGA top-level + constraints
├── simulation/ # Testbenches + ModelSim scripts
├── results/ # Waveforms, FPGA outputs
└── docs/ # Design notes and architecture

