## White LEDS 
set_property PACKAGE_PIN AF5 [get_ports {o_led0}]
set_property PACKAGE_PIN AE7 [get_ports {o_led1}]
set_property PACKAGE_PIN AH2 [get_ports {o_led2}]
set_property PACKAGE_PIN AE5 [get_ports {o_led3}]
set_property IOSTANDARD LVCMOS12 [get_ports o_led*]

## Pushbutton Switches 
set_property PACKAGE_PIN AB6 [get_ports {i_sw0}]
set_property PACKAGE_PIN AB7 [get_ports {i_sw1}]
set_property PACKAGE_PIN AB2 [get_ports {i_sw2}]
set_property PACKAGE_PIN AC6 [get_ports {i_sw3}]
set_property IOSTANDARD LVCMOS12 [get_ports i_sw*]
