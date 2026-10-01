<!-- markdownlint-disable-file MD033 MD013 MD003-->
# Project-1: Wiring Switches to LEDs

## Project Overview

- When user presses one of the push button switches, the corresponding LED should light up.
- LED lights up: `btn0 -> led0`, `btn1 -> led1`, `btn2 -> led2`, `btn3 -> led3`

**Project Structure**:

```txt
project_1.srcs
|---- sources_1/new/Switches_To_LEDs.sv     # top-level design
|---- constrs_1/new/pins.xdc                # constraint file
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

## Post-Synthesis Schematic

![Schematic](/images/project1/schem_synth1.png)

---

## Hardware Validation

<a href="https://youtube.com/shorts/nrHFqv3ak0E?feature=share">
  <img src="https://img.youtube.com/vi/nrHFqv3ak0E/maxresdefault.jpg"
       width="360" alt="Project Demo"/>
</a>

---

## Reference

- Project 1, Chapter 2 of the book
