## Timing Assertions Section
## sys_clk 100 mhz
set_property PACKAGE_PIN D7 [get_ports {sys_clk_p}]
set_property IOSTANDARD LVDS [get_ports sys_clk_p]

create_clock -name clk_100mhz -period 10 [get_ports sys_clk_p]

set_property PACKAGE_PIN D6 [get_ports {sys_clk_n}]
set_property IOSTANDARD LVDS [get_ports sys_clk_n]

# Input and output delay constraints
set_output_delay -max -clock clk_100mhz 0.5 [get_ports out_led*]
set_output_delay -min -clock clk_100mhz 0.05 [get_ports out_led*]

## Timing Exceptions Section
set_false_path -from [get_ports in_sw*] -to [get_ports out_led*]

## Physical Constraints Section
# located anywhere in the file, preferably before or after the timing constraints # or stored in a separate constraint file

## Slide Switches
set_property PACKAGE_PIN AB1 [get_ports {in_sw0}]
set_property PACKAGE_PIN AF1 [get_ports {in_sw1}]
set_property IOSTANDARD LVCMOS12 [get_ports in_sw*]

## White LEDS
set_property PACKAGE_PIN AF5 [get_ports {out_led0}]
set_property PACKAGE_PIN AE7 [get_ports {out_led1}]
set_property PACKAGE_PIN AH2 [get_ports {out_led2}]
set_property PACKAGE_PIN AE5 [get_ports {out_led3}]
set_property IOSTANDARD LVCMOS12 [get_ports out_led*]
