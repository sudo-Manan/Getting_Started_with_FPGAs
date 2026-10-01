<!-- markdownlint-disable-file MD033 MD013 MD003-->
# Project-4: Debouncing a Switch

## Project Overview

In Project-3, push button inputs did not always toggle cleanly. This is due to mechanical contact bounce: when contacts close or open, they bounce rapidly before settling, causing timing violations and unwanted pulse edges.

This project implements a counter-based digital debounce filter to deliver clean single pulse transitions to the FPGA logic.

**Project Structure:**

```txt
project_4.srcs
|---- sources_1/new/top.sv
|---- sources_1/ip/clk_wiz_0/clk_wiz_0.xci
|---- sources_1/new/LED_Toggle.sv
|---- sources_1/new/Debounce_Filter.sv
|---- constrs_1/new/io_pins.xdc
```

### Design Decisions

- A human button press typically lasts 50 ms to several seconds; a 10 ms delay threshold is standard for filtering mechanical bounce on most tactile push buttons. Noisier buttons may use 20-50 ms.
- Two independent buttons debounced with different thresholds to compare behaviour:
  - Button 1: 10 ms threshold
  - Button 2: 20 ms threshold
- 10 MHz system clock generated via the Vivado Clocking Wizard IP.

---

## Lint & Elaboration

### Linter Output

```tcl
INFO: [Synth 37-85] Total of 0 linter message(s) generated.
INFO: [Synth 37-45] Linter Run Finished!
```

### Post Elaboration Schematic

![Schematic](/images/project4/schem_expanded_elaboration.png)

---

## Behavioural Simulation

### Debounce Filter: Simulation Waveform

![Simulation Result](/images/project4/waveform_behav_sim_debounce_filter.png)

---

## Synthesis

**Main Design:**

```tcl
---------------------------------------------------------------------------------
Start Writing Synthesis Report
---------------------------------------------------------------------------------

Report BlackBoxes: 
+------+--------------+----------+
|      |BlackBox name |Instances |
+------+--------------+----------+
|1     |clk_wiz_0     |         1|
+------+--------------+----------+

Report Cell Usage: 
+------+--------+------+
|      |Cell    |Count |
+------+--------+------+
|1     |clk_wiz |     1|
|2     |CARRY8  |     6|
|3     |LUT1    |     2|
|4     |LUT2    |     1|
|5     |LUT3    |     2|
|6     |LUT4    |     3|
|7     |LUT5    |     3|
|8     |LUT6    |     7|
|9     |FDRE    |    41|
|10    |IBUF    |     3|
|11    |OBUF    |     2|
+------+--------+------+
---------------------------------------------------------------------------------
Finished Writing Synthesis Report
```

**Clocking Wizard Instance:**

```tcl
---------------------------------------------------------------------------------
Start Writing Synthesis Report
---------------------------------------------------------------------------------

Report BlackBoxes: 
+-+--------------+----------+
| |BlackBox name |Instances |
+-+--------------+----------+
+-+--------------+----------+

Report Cell Usage: 
+------+-----------+------+
|      |Cell       |Count |
+------+-----------+------+
|1     |BUFG       |     2|
|2     |MMCME4_ADV |     1|
|3     |IBUFDS     |     1|
+------+-----------+------+
---------------------------------------------------------------------------------
Finished Writing Synthesis Report
```

***Inference***: The synthesized design uses 41 flip-flops, 18 LUTs, and 6 CARRY8 primitives, in addition to the resources required by the clocking infrastructure. The relatively small number of logic resources reflects the simplicity of the debounce circuit and its counter-based implementation.

---

## Hardware Validation

Demo Video:<br>
[![Project Demo](https://img.youtube.com/vi/gVNNTs2BxKI/mqdefault.jpg)](https://youtu.be/gVNNTs2BxKI)

---

## Reference

- Project 4, Chapter 5 of the book
- [Bouncing of Switch - Real Digital](https://www.realdigital.org/doc/49c53dbf5b54b73f393d18a87f7c3fe0)
