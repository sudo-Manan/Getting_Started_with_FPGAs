# Getting_Started_with_FPGAs
Follows the book "GETTING STARTED WITH FPGAS" by "Russell Merrick"

FPGA being used: AMD (Xilinx) AUP-ZU3 (Real Digital) <br>
Device Name (Default Part Name): XCZU3EG-SFVC784-2-E <br>
Tool Used: Vivado 2025.2 (free tier) on Windows 11 Home <br>

General Rules: 
1. Following Little Endianness - LSB is the bit with lowest index value
2. All the code is in SystemVerilog (its a superset of Verilog and verilog code will also work)
3. All the constraint files are  in .xdc format - for compatibility to Vivado and added before running synthesis
4. Optional Testbenches are used to ensure functionality before programming the FPGA to ensure that Hardware is not damaged in the process
5. Referenced the zu3.xdc file from realdigital.org for the AUP-ZU3 Board to write the constraint files
6. Preference to Synchronous resets as mentioned in AMD Documentation

---

## Starting a new Project

Open Vivado

![GUI_Vivado](images/initial_img0.png)

Start a New Project: give the project name, select the directory/ location, and if you want to create a new sub-directory for the project

![New_Project_Step1](images/initial_img1.png)

Select Project type, I have selected to add my sources later
![Step2](images/initial_img2.png)

Select the default part (board or the silicon)

![Step4_part_select](images/initial_img3a.png)

Since I did not want to add the sources at this stage, the tool skipped step 3

![Step4_part_select](images/initial_img3b.png)

Check if everything is summarised correctly at the last step before finishing and starting to work in the project
![Step5](images/initial_img4.png)

---

## Project-1: Wiring Switches to LEDs 

``` Project Structure
project_1.srcs
|---- constrs_1/new/pins.xdc
|---- sources_1/new/Switches_To_LEDs.sv
```

### Design Decisions:
Made use of vector assignment available in system verilog instead of using 4 different assign statements <br>
Kept 4 different ports for input and output each instead of taking them as vectors <br>
Naming change: Used the values go from 3 down to 0, instead of 4 to 1 <br>
Use push buttons for input switched <br>
Use leds for the output ports <br>

---

## Project-2: Lighting an LED with Logic Gates

``` Project Structure
project_2.srcs
|---- constrs_1/new/pins.xdc
|---- sim_1/new/And_Gate_Project_tb.sv
|---- sources_1/new/And_Gate_Project.sv
```

### Design Decisions
Implement `and`, `xor` gates instead of just and gate for more fun <br>
The ouputs follow the following order going from leftmost (msb) led to the rightmost (lsb) led [XOR, AND] <br>

---

## Project-3: Blinking an LED

``` Project Structure
project_3_new.srcs
|---- constrs_1/new/io_pins.xdc
|---- sources_1/new/LED_Toggle.sv
|---- sources_1/new/top.sv
|---- sources_1/ip/clk_wiz_0/clk_wiz_0.xci
```

### Design Decisions
Uses a Clocking Wizard IP to divide the 100MHz board clock down to 10MHz. <br>
Used the board schematics from real digital website for internal clock properties clk_p at pin D7, with LVDS Voltage, and 100MHz frequency diff_clk <br>
Used a `top.sv` module to connect on board clk, the clocking wizard ip, and the actual design together, and also wrote the constraint file accordingly <br>
Also, wait for the clock to stabalize, before allowing input changes (`i_btn && clk_lock`) 

---

<!-- ## Project-4 

``` Project Structure
``` -->


---

## Planned additions: 
per-project READMEs with resource utilization reports and implementation images.