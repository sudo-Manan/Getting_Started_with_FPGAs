## Slide Switches
set_property PACKAGE_PIN AB1 [get_ports {i_sw0}]
set_property PACKAGE_PIN AF1 [get_ports {i_sw1}]
set_property IOSTANDARD LVCMOS12 [get_ports i_sw*]

## White LEDS 
set_property PACKAGE_PIN AF5 [get_ports {o_and}]
set_property PACKAGE_PIN AE7 [get_ports {o_xor}]
set_property IOSTANDARD LVCMOS12 [get_ports o_*]
