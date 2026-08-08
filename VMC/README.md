# Vending Machine Controller using Verilog

## Overview

This project implements a **Vending Machine Controller** using Verilog HDL based on a Finite State Machine (FSM).

The vending machine accepts coins and dispenses a product when the required amount is collected.

## Features

- FSM based design
- Supports 5-unit and 10-unit coins
- Product price = 15 units
- Dispense control output
- Simulation using GTKWave

## Inputs

| Signal | Description |
|--------|-------------|
| clk | Clock signal |
| reset | Reset signal |
| coin5 | Insert 5 unit coin |
| coin10 | Insert 10 unit coin |

## Outputs

| Signal | Description |
|--------|-------------|
| dispense | Product delivery signal |
| change | Change return signal |

## FSM States

| State | Amount |
|------|--------|
| S0 | 0 units |
| S5 | 5 units |
| S10 | 10 units |
| S15 | 15 units / Dispense |

## Project Files

- `vending_machine.v` - Verilog FSM design
- `vending_machine_tb.v` - Testbench
- `vending_machine.vcd` - Simulation waveform
- `simulation_result.png` - Waveform screenshot

## Simulation

### Compile

```bash
iverilog -o vending vending_machine.v vending_machine_tb.v
```

### Run

```bash
vvp vending
```

### View Waveform

```bash
gtkwave vending_machine.vcd
```

## Applications

- Automatic vending systems
- Smart payment machines
- Embedded controllers
- Digital control systems

## Author

Your Name