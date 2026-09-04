#clk 100 mhz
set_property PACKAGE_PIN D7 [get_ports {clk_p}]
set_property IOSTANDARD LVDS [get_ports clk_p]
set_property PACKAGE_PIN D6 [get_ports {clk_n}]
set_property IOSTANDARD LVDS [get_ports clk_n]

## Slide Switches
set_property PACKAGE_PIN AB1 [get_ports {rst}]
set_property IOSTANDARD LVCMOS12 [get_ports rst]

## Pushbutton Switches 
set_property PACKAGE_PIN AB6 [get_ports {i_btn}]
set_property IOSTANDARD LVCMOS12 [get_ports i_btn]

## White LEDS 
set_property PACKAGE_PIN AF5 [get_ports {o_led}]
set_property IOSTANDARD LVCMOS12 [get_ports o_led]