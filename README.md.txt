 Traffic Management System (FSM using Verilog)

# Overview
This project implements a **Traffic Management System** using a **Finite State Machine (FSM)** in Verilog HDL.  
It controls a 4-way intersection with timed traffic light switching and is verified using ModelSim simulation.

# Features
- FSM-based traffic light controller
- North-South and East-West signal control
- Timer-based state transitions
- Reset functionality
- Verilog RTL design
- ModelSim simulation verification


## 🔁 State Description

| State | North-South | East-West | Duration |
|------|-------------|-----------|----------|
| S0   | Green       | Red       | 30 cycles |
| S1   | Yellow      | Red       | 5 cycles  |
| S2   | Red         | Green     | 30 cycles |
| S3   | Red         | Yellow    | 5 cycles  |



## 🧠 Output Encoding

| Signal | Value | Meaning |
|--------|------|---------|
| 001    | Green |
| 010    | Yellow |
| 100    | Red |



## 🛠️ Tools Used
- Verilog HDL
- ModelSim Simulator


## 📂 Project Structure
```plaintext id="struct1"
traffic-management-system/
│
├── rtl/
│   └── traffic_controller.v
│
├── testbench/
│   └── tb.v
│
├── docs/
│   └── waveform.png
│
└── README.md