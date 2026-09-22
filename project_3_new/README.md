<!-- markdownlint-disable-file MD033 MD013 MD003-->
# Project-3: Blinking an LED

## Project Overview

Whenever user presses and releases the push button, after the 10MHz clk has stabilized, the **LED toggles** when the **button release is registered** at the positive clock edge.

- user i/o: rst mapped to slide switch, i_btn mapped to a push button, o_led mapped to a led.
- i_btn is used to control the led toggle.
- o_led shows the toggling of led to the user.
- the internal clock for the Programmable Logic (PL), or the FPGA component of the MPSoC is a 100MHz Differential Pair Clock (we will refer to positive end as clk_p, and negative as clk_n).

<!-- We feed the Differential Clock to the MMCM builtin IP core via the clock wizard of vivado to generate a 10MHz clock, which  is slower, and gives enough time for the user to press and release the push button for the toggle to actually occur. -->

**Project Structure**:

```txt
project_3_new.srcs
|---- sources_1/new/top.sv 
|---- sources_1/ip/clk_wiz_0/clk_wiz_0.xci
|---- sources_1/new/LED_Toggle.sv
|---- constrs_1/new/io_pins.xdc
|---- sim_1/new/led_toggle_tb.sv
```

**Note:** The testbench needs to run for 30 *microseconds* as the clock wizard takes time to stabilize the generated clock

### Design Decisions

- Use a Clocking Wizard IP to divide the 100MHz board clock down to 10MHz. <br>
- Instead of using 100MHz onboard clock directly, or using a 25MHz clock, as used in the reference material, we have chosen to use a slower clock for allowing better input capturing.
- Wait for the clock to stabilize, before allowing input changes (`i_btn && clk_lock`)

<!-- 
top:
inputs: clk_p, clk_n, rst, i_btn
output: o_led

LED_Toggle:
inputs: clk_10mhz, i_btn
outputs: o_led

clk_wiz_0 (its a .xci file)
inputs: clk_in1_d (clk_in1_p, clk_in1_n) (Takes clk_p, clk_n as input), reset
outputs: locked, clk_out1 (10mhz clock)
 -->

---

## Post Elaboration Schematic

![Scematic](/images/project3/schem_elaborated_des.png)

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

**Top Module**:

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

**Clock Wizard Instance**:

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

*Observation*: The design infers 2 **FDREs** (r_btn, r_led), 1 **LUT2** for the `i_btn && clk_lock` gate , and 1 **LUT4** for the toggle condition. Resource usage is minimal as expected.

---

## Planned Updates

- Programming the FPGA.
- Demonstration of the implementation (either images or video).

---

## *Reference*

- Project#3, Chapter-4 of the book
