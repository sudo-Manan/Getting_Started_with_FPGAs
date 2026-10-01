<!-- markdownlint-disable-file MD033 MD013 MD003-->
# Project-5: Selectively Blinking an LED

## Project Overview

- Two slide switches select which of four LEDs blinks.
- A 24-bit LFSR running on the 100 MHz system clock generates a periodic toggle pulse (once per `2^24 − 1` cycles, once evry 0.16 seconds approx.); a 1:4 demux routes that pulse to the LED selected by the switch combination.

**Project Structure**:

```txt
project_5.srcs
|---- sources_1/new/demux_lfsr_project_top.sv
|---- sources_1/new/lfsr_24.sv
|---- sources_1/new/demux_1to4.sv
|---- constrs_1/new/io_pins.xdc
```

### Design

| Module | Role |
| :---: | :---: |
| `lfsr_24` | 24-bit LFSR; asserts `out_lfsr_done` on all-zero state |
| `demux_1to4` | Routes toggle signal to one of four outputs based on 2-bit select |
| `demux_lfsr_project_top` | Top-level Module; IBUFDS + BUFG for LVDS clock input, instantiates both modules |

**Switch to LED mapping**:

| `in_sw1` | `in_sw0` | Active LED |
| :---: | :---: | :---: |
| 0 | 0 | LED0 |
| 0 | 1 | LED1 |
| 1 | 0 | LED2 |
| 1 | 1 | LED3 |

---

## Post Elaboration Schematic

![Post-Elaboration Schematic](/images/project5/schem_expanded_elaboration.png)

---

## Synthesis Report

```tcl
Report Cell Usage: 
+------+-------+------+
|      |Cell   |Count |
+------+-------+------+
|1     |BUFG   |     1|
|2     |LUT2   |     1|
|3     |LUT3   |     4|
|4     |LUT5   |     1|
|5     |LUT6   |     4|
|6     |FDRE   |    25|
|7     |IBUF   |     2|
|8     |IBUFDS |     1|
|9     |OBUF   |     4|
+------+-------+------+
```

---

## Implementation

![Post Implementation Utilization](/images/project5/utiliz_impl.png)

---

## Timing

Clock: 100 MHz (10 ns period), LVDS input via IBUFDS + BUFG.

Switches are asynchronous inputs with no downstream register -
`set_false_path` applied on `in_sw*` to `out_led*` paths.

Output delay constraints applied on `out_led*`:

- Max: 0.5 ns
- Min: 0.05 ns

---

## Hardware Validation

Demo Video:<br>
[![Project Demo](https://img.youtube.com/vi/IWhE_IEfWbI/mqdefault.jpg)](https://youtu.be/IWhE_IEfWbI)

---

## Reference

- Project#5, Chapter-6 of the book
