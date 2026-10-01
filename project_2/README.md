<!-- markdownlint-disable-file MD033 MD013 MD003-->
# Project-2: Lighting an LED with Logic Gates

## Project Overview

- User can change the input via slider switches: sw0, sw1.
- These switches both drive the two gates, `and`, and `xor`.
- Each gate output drives one LED: [XOR, AND] from leftmost (MSB) to rightmost (LSB).

**Project Structure**:

```txt
project_2.srcs
|---- sources_1/new/And_Gate_Project.sv     # top-level design
|---- constrs_1/new/pins.xdc                # constraint file
|---- sim_1/new/And_Gate_Project_tb.sv      # testbench
```

### Design Decisions

- Implemented both `and` and `xor` gates rather than just `and`.
- Slide switches for input, LEDs for output.

---

## Linter & Elaboration

### RTL Linter Report

``` tcl
INFO: [Synth 37-85] Total of 0 linter message(s) generated.
INFO: [Synth 37-45] Linter Run Finished!
```

### Post-Elaboration Schematic

![Schematic](/images/project2/schem_elaborated_des.png)

---

## Behavioural Simulation

### Waveform

![Simulation Result](/images/project2/waveform_behav_sim.png)

### Simulation Log

```tcl
Time resolution is 1 ps
| Time = 0 | in1 = x | in2 = x | and = x | xor = x |
| Time = 10 | in1 = 0 | in2 = 0 | and = 0 | xor = 0 |
| Time = 20 | in1 = 1 | in2 = 0 | and = 0 | xor = 1 |
| Time = 30 | in1 = 1 | in2 = 1 | and = 1 | xor = 0 |
| Time = 40 | in1 = 0 | in2 = 1 | and = 0 | xor = 1 |
$finish called at time : 50 ns
```

---

## Synthesis

### Synthesis Report

```tcl
Start Writing Synthesis Report
---------------------------------------------------------------------------------

Report BlackBoxes: 
+-+--------------+----------+
| |BlackBox name |Instances |
+-+--------------+----------+
+-+--------------+----------+

Report Cell Usage: 
+------+-----+------+
|      |Cell |Count |
+------+-----+------+
|1     |LUT2 |     2|
|2     |IBUF |     2|
|3     |OBUF |     2|
+------+-----+------+
---------------------------------------------------------------------------------
Finished Writing Synthesis Report
```

### Post-Synthesis Schematic

![Schematic](/images/project2/schem_synth.png)

---

## Implementation

### Utilization

![Post-Implementation Utilization](/images/project2/utiliz_impl.png)

---

## Hardware Validation

Demo Video:<br>
<a href="https://youtube.com/shorts/see_1Q9hq7s?feature=share">
  <img src="https://img.youtube.com/vi/see_1Q9hq7s/maxresdefault.jpg"
       width="360" alt="Project Demo"/>
</a>

---

## Reference

- Project 2, Chapter 3 of the book
- Testbench: page 72, Chapter 5 of the book
