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
- HPS based C program Compilation Flow  
-Complete HPS to FPGA's BRAM automated executable program flow
 
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

---

## 🏗️ System Architecture

The system consists of:
- RISC-V 5 stage pipelined CPU Core  
- Instruction & Data Memory  
- Peripheral Interfaces (SPI, LCD, GPIO)  
- FPGA Integration Layer  

> *(Architecture diagram will be added soon)*

---

## 🛠️ Tools & Technologies
- **VHDL** – RTL Design  
- **ModelSim** – Simulation & Verification  
- **Intel Quartus** – FPGA Synthesis & Implementation  
- **Intel EDS Tool**- HPS<-->FPGA Flow
- **FPGA Board** – *(DE10-nano / Cyclone series)*  

---

## ▶️ How to Run Simulation

1. Open ModelSim  
2. Navigate to:/simulation/scripts
3. Run:
4. 4. Observe waveforms and verify outputs  

---

## ⚙️ FPGA Deployment

1. Open Quartus project from `/fpga/`  
2. Compile the design  
3. Program the FPGA  
4. Observe output on:
- Seven Segment Display  
- LCD (if connected)  

---

## 📸 Results

- ✔️ Functional Single-Cycle Execution  
- ✔️ Verified Control Signals  
- ✔️ FPGA SSD Output Display  

> Waveforms and hardware results available in `/results/`

---

## 📚 Learning Journey

This project represents a progressive learning path:

- Started with basic digital design and VHDL  
- Built a complete single-cycle processor  
- Understood datapath and control interaction  
- Faced real-world issues:
- Timing constraints  
- Metastability (button inputs)  
- Clock domain considerations  
- Moving towards pipelined architecture and system integration  

---

## 🚧 Future Work

- 🔄 Complete Pipelined RISC-V Core  
- ⚡ Implement Hazard Detection & Forwarding  
- 🧠 Add DSP Accelerator  
- 🤖 Integrate Custom AI Accelerator (FPGA-based)  
- 🖥️ Full Hardware-Software Co-Design System  

---

## 🤝 Contributions
This is a 3 person project but other two are not on Github, but suggestions and discussions are welcome.

---

## 📬 Contact
Feel free to connect or discuss ideas related to:
- Computer Architecture  
- FPGA Design  
- Embedded Systems  

---

⭐ *If you find this project interesting, consider starring the repository!*


