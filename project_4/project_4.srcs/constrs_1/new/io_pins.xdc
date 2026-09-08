#clk 100 mhz
set_property PACKAGE_PIN D7 [get_ports {top_in_clk_p}]
set_property IOSTANDARD LVDS [get_ports top_in_clk_p]
set_property PACKAGE_PIN D6 [get_ports {top_in_clk_n}]
set_property IOSTANDARD LVDS [get_ports top_in_clk_n]

## Slide Switches
set_property PACKAGE_PIN AB1 [get_ports {top_in_rst}]
set_property IOSTANDARD LVCMOS12 [get_ports top_in_rst]

## Pushbutton Switches 
set_property PACKAGE_PIN AB6 [get_ports {top_in_sw0}]
set_property PACKAGE_PIN AB7 [get_ports {top_in_sw1}]
set_property IOSTANDARD LVCMOS12 [get_ports top_in_sw*]

## White LEDS 
set_property PACKAGE_PIN AF5 [get_ports {top_out_led0}]
set_property PACKAGE_PIN AE7 [get_ports {top_out_led1}]
set_property IOSTANDARD LVCMOS12 [get_ports top_out_led*]
