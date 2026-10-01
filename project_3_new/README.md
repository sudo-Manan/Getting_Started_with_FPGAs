<!-- markdownlint-disable-file MD033 MD013 MD003-->
# Project-3: Blinking an LED

## Project Overview

When the user presses and releases the push button, the LED toggles on the registered **button release** at the positive clock edge.

- `rst` mapped to a slide switch; `i_btn` to a push button; `o_led` to an LED.
- The onboard PL clock is a 100 MHz LVDS differential pair (`clk_p`, `clk_n`), fed through the Clocking Wizard to generate a 10 MHz clock - slow enough for reliable button press capture.
- Input is gated as `i_btn && clk_lock` to prevent spurious edges before the clock stabilizes.

**Project Structure**:

```txt
project_3_new.srcs
|---- sources_1/new/top.sv 
|---- sources_1/ip/clk_wiz_0/clk_wiz_0.xci
|---- sources_1/new/LED_Toggle.sv
|---- constrs_1/new/io_pins.xdc
|---- sim_1/new/led_toggle_tb.sv
```

**Note:** The testbench must run for at least 30 *microseconds* to allow the Clocking Wizard to stabilize the generated clock before input changes are applied.

### Design Decisions

- 100 MHz board clock divided down to 10 MHz via the Clocking Wizard (MMCM), instead of using 25 MHz as in the reference material, for more reliable input capture.
- Input qualified with `clk_lock` to avoid false edges during MMCM lock acquisition.

---

## Post Elaboration Schematic

![Schematic](/images/project3/schem_elaborated_des.png)

---

## Behavioural Simulation

### Waveform

![Simulation Result](/images/project3/waveform_behav_sim.png)

---

## Synthesis

### Post-Synthesis Schematic

![Schematic](/images/project3/schem_synth_des.png)

### Post-Synthesis Utilization Report

![Summary](/images/project3/utiliz_synth.png)

**Top Module:**

```tcl
Report Cell Usage: 
+------+--------+------+
|      |Cell    |Count |
+------+--------+------+
|1     |clk_wiz |     1|
|2     |LUT2    |     1|
|3     |LUT4    |     1|
|4     |FDRE    |     2|
|5     |IBUF    |     2|
|6     |OBUF    |     1|
+------+--------+------+
```

**Clock Wizard Instance:**

```tcl
Report Cell Usage: 
+------+-----------+------+
|      |Cell       |Count |
+------+-----------+------+
|1     |BUFG       |     2|
|2     |MMCME4_ADV |     1|
|3     |IBUFDS     |     1|
+------+-----------+------+
```

*Observation*: The design infers 2 **FDREs** (`r_btn`, `r_led`), 1 **LUT2** for the `i_btn && clk_lock` gate , and 1 **LUT4** for the toggle condition. Resource usage is minimal as expected.

---

## Hardware Validation

Demo Video:<br>
[![Project Demo](https://img.youtube.com/vi/WUblVmYnfNk/mqdefault.jpg)](https://youtu.be/WUblVmYnfNk)

---

## Reference

- Project 3, Chapter 4 of the book
