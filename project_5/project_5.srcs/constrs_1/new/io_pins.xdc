## clk 100 mhz
set_property PACKAGE_PIN D7 [get_ports {sys_clk_p}]
set_property IOSTANDARD LVDS [get_ports sys_clk_p]

# create_clock -name sys_clk -period 10.000 [get_ports sys_clk_p]

set_property PACKAGE_PIN D6 [get_ports {sys_clk_n}]
set_property IOSTANDARD LVDS [get_ports sys_clk_n]


## Slide Switches
set_property PACKAGE_PIN AB1 [get_ports {in_sw0}]
set_property PACKAGE_PIN AF1 [get_ports {in_sw1}]
set_property IOSTANDARD LVCMOS12 [get_ports in_sw*]

## White LEDS (8 outputs)
set_property PACKAGE_PIN AF5 [get_ports {out_led0}]
set_property PACKAGE_PIN AE7 [get_ports {out_led1}]
set_property PACKAGE_PIN AH2 [get_ports {out_led2}]
set_property PACKAGE_PIN AE5 [get_ports {out_led3}]
set_property IOSTANDARD LVCMOS12 [get_ports out_led*]