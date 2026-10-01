<!-- markdownlint-disable-file MD033 MD013 MD003-->
# Getting Started with FPGAs

Follows the book "Getting Started with FPGAs" by Russell Merrick, hereafter referred to as the book.

FPGA used: AMD (Xilinx) `AUP-ZU3` (Real Digital) <br>
Device Name (Default Part Name): `XCZU3EG-SFVC784-2-E` <br>
Tool Used: `Vivado 2025.2` (free tier) on Windows 11 Home

Other Tools: [DigitalJS](https://digitaljs.tilk.eu/), [RapidRTL](https://www.rapidrtl.com/) as online compilers to check design synthesis/schematics for ASICs for comparison wherever needed.

AUP-ZU3 Board:
![FPGA Board](/docs/aup_zu3_board.png)

General Rules:

1. Following Little Endianness - LSB is the bit with the lowest index value
2. All code is in SystemVerilog (superset of Verilog; plain Verilog will also work)
3. All constraint files are in `.xdc` format - added before running synthesis
4. Optional testbenches are used to verify functionality before programming the FPGA
5. Referenced the [zu3.xdc](/docs/zu3.xdc) file from realdigital.org for the AUP-ZU3 board
6. Preference for synchronous resets as per AMD documentation
7. VIO (Virtual Input/Output) and ILA (Integrated Logic Analyzer) will be used where needed; not used for basic projects
8. Preference for the built-in Clocking Wizard for clock frequency generation

---

## Starting a new Project

Open Vivado
![GUI_Vivado](/images/setup/initial_img0.png)

Start a New Project: give the project a name, select the directory, and choose whether to create a subdirectory.
![New_Project_Step1](/images/setup/initial_img1.png)

Select project type: RTL Project. Sources added later.
![Step2](/images/setup/initial_img2.png)

Select the default part (board or silicon).
![Step4_part_select](/images/setup/initial_img3a.png)

Select either the part or the board, not both. If board files aren't added to Vivado, use part selection instead.
![Step4_part_select](/images/setup/initial_img3b.png)

Verify the summary before finishing.
![Step5](/images/setup/initial_img4.png)

---

## Generate Bitstream & Program Harware Demonstration

(Click on image to go to video demo)<br>
[![Generate Bitstream & Program Harware Demonstration](https://img.youtube.com/vi/wjTXPKl22pU/mqdefault.jpg)](https://youtu.be/wjTXPKl22pU)

---

## [Project-1: Wiring Switches to LEDs](/project_1/README.md)

When you press one of the push button switches, one of the LEDs lights up.

**Learnings: Project-1**:

- Writing SystemVerilog Code
- Writing Physical Constraints
- Implementation & Writing Bitstream to hardware

[Demo Video](https://youtube.com/shorts/nrHFqv3ak0E?feature=share)

---

## [Project-2: Lighting an LED with Logic Gates](/project_2/README.md)

Slide switch inputs drive AND and XOR gates; each gate output drives one LED.

**Learnings: Project-2**:

- Writing Testbenches and running behvioural simulation
- Running Linter
- Reading Synthesis Report & checking utilization

[Demo Video](https://youtube.com/shorts/see_1Q9hq7s?feature=share)

---

## [Project-3: Blinking an LED](/project_3_new/README.md)

When the user presses and releases the push button, the LED toggles. Sequential logic registers the button release to trigger the toggle.

**Learnings: Project-3**:

- Using clocking wizard to generate a 10MHz clock

[Demo Video](https://youtu.be/WUblVmYnfNk)

---

**Note:** From this point forward, all port declarations for the main logic module (not the top module) use the `in_` prefix for inputs and `out_` prefix for outputs.

---

## [Project-4: Debouncing a Switch](/project_4/README.md)

Despite the slower clock in Project-3, glitches were still observed. This project debounces the switch input using a counter-based filter.

**Learnings: Project-4**:

- Reason for gliches in inputs from switches
- Deboucing a switch

[Demo Video](https://youtu.be/gVNNTs2BxKI)

## Basic Building Blocks

Commonly used digital logic building blocks covered across projects: multiplexer, demultiplexer, shift register, LFSR, up counter, RAM, synchronous FIFO, and asynchronous FIFO.

- Multiplexer: A mux takes multiple inputs, and gives one output. We have made a 4:1 mux. It takes 4 inputs, and has a 2 select line, and a single bit output.
- Demultiplexer: A demux takes a single input and gives multiple outputs. We have implemented a 1:4 demux. It takes one input, has 2 select lines, and has 4 output lines.
- Shift Register: N number of flip flops chained together, where the output of 1st flip flop is the input to the next flip flop.
- Linear Feedback Shift Register: When certain flip flops of the shift registers are tapped into and thier output is used as input for either an XOR or an XNOR gate. The output of this gate is then fed back to the input of the beginning of the shift register.
- Up Counter: A counter is used to count to a particular value, and then restart from the initial value again. We can configure it based on our needs (skip specific numbers or a certain set of number, count in a specific code - binary, gray, etc.).
- Memory: Mainly made from Flip Flops, or RAM (SRAM or DRAM), when talking about volatile memory.
  - RAM: Bigger memory sets in a specific configuration, that can be accessed *randomly* at the positive edge of a clock cycle.
  - FIFO: The data written first is accessed first.
    - Synchronous FIFO: Data written and read using syncronous clock and in same clock domain
    - Asynchronous FIFO: There are two clocks involved, where read clock can be faster or slower in comparison to write clock. This FIFO is primarily used to share data between components of diferent clock domains.

**Note**: While *Asynchronous FIFO* was only discussed in the book, after a few different iterations (including a block level approach (using counters for pointers, exchanging pointers via 2 - flip flop syncronizers, bin2gray code converters and comparators); using a write always block, a read always block, and using a modulo-counter for resetting pointers), the current design was made to explore the next step to the sync_fifo.

---

## [Project-5: Selectively Blinking an LED](/project_5/README.md)

Two slide switches select which of four LEDs blinks, driven by a 24-bit LFSR toggle pulse routed through a 1:4 demux.

**Learnings:**

- Timing constraints in `.xdc` - `create_clock`, output delay constraints, `set_false_path`
- Using `IBUFDS` and `BUFG` primitives from template for LVDS clock input
- Clock division using an LFSR

[Demo Video](https://youtu.be/IWhE_IEfWbI)

---

## Planned Updates

- Project-6
- further work on basic building blocks, fsm(s)
