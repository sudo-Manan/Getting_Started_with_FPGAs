<!-- markdownlint-disable-file MD033 MD013 MD003-->
# Project-3: Blinking an LED

## Project Overview

Whenever user presses and releases the push button, after the 10MHz clk has stabalized, and the pressing of push button is registered at the positive clock edge of the 10MHz clk, the led toggles.

- user i/o: rst mapped to slide switch, i_btn mapped to a push button, o_led mapped to a led.
- i_btn is used to control the led toggle.
- o_led shows the toggling of led to the user.
- the internal clock for the Programmable Logic (PL), or the FPGA component of the MPSoC is a 100MHz Differencial Pair Clock (we will refer to positive end as clk_p, and negative as clk_n).

<!-- We feed the differencial Clock to the MMCM builtin IP core via the clock wizard of vivado to generate a 10MHz clock, which  is slower, and gives enough time for the user to press and release the push button for the toggle to actually occur. -->

### Design Decisions

- Uses a Clocking Wizard IP to divide the 100MHz board clock down to 10MHz. <br>
  Instead of using 100MHz onboard clock directly, or using a 25MHz clock, as used in the reference material, we have chosen to use a slower clock for allowing better input capturing.
- Used the board schematics from real digital website for internal clock properties clk_p at pin D7, with LVDS Voltage, and 100MHz frequency diff_clk
- Used a `top.sv` module to connect on board clk, the clocking wizard ip, and the actual design together, and also wrote the constraint file accordingly
- Also, wait for the clock to stabalize, before allowing input changes (`i_btn && clk_lock`)
- Use Push Buttons for input port (toggle of the led)
- Use LED for output port

<!-- 
top:
inputs: clk_p, clk_n, rst, i_btn
output: o_led

LED_Toggle:
inputs: clk_10mhz, i_btn
outputs: o_led

clk_wiz_0 (its a .xci file)
inputs: clk_in1_d (Takes clk_p, clk_n as input), reset
outputs: locked, clk_out1 (10mhz clock)
 -->

---

## Planned Updates

- Add the schematic and linter output.
- Programming the FPGA.
- Demonstarion of the implementation (either images or video).

---

## *Reference*

- Project#3, Chapter-4 of the book
