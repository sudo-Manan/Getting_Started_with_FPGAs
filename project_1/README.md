<!-- markdownlint-disable-file MD033 MD013 MD003-->
# Project-1: Wiring Switches to LEDs

## Project Overview

- When user presses one of the push button switches, one of the LEDs should light up.<br>
- The led that lights up, is the one that is wired to the push button.<br>
- btn0 is connected to led0, btn1 to led1, and so on till btn3 and led3

<!-- ### Design Decisions

- Made use of vector assignment available in system verilog instead of using 4 different assign statements.
- Kept 4 different ports for input and output each instead of taking them as vectors.
- Naming change: Used the values go from 3 down to 0, instead of 4 to 1.
- Use Push Buttons for input port.
- Use LEDs for the output ports. -->

**Project Structure**:

```txt
project_1.srcs
|---- sources_1/new/Switches_To_LEDs.sv     # top level design
|---- constrs_1/new/pins.xdc        # constraint file
```

---

## Linter

```tcl
RTL Linter Report

Table of Contents
-----------------
1. Summary

1. Summary
----------

+---------+----------+--------------+----------+
| Rule ID | Severity | # Violations | # Waived |
+---------+----------+--------------+----------+


INFO: [Synth 37-85] Total of 0 linter message(s) generated.
INFO: [Synth 37-45] Linter Run Finished!
```

---

## Post Synthesis Schematic

![Schematic_top](/images/project1/schem_synth1.png)

---

## Planned Updates

- Implementation on FPGA.
- Demonstarion of the implementation (either images or video).

---

## *Reference*

- Project#1, Chapter-2 of the book
