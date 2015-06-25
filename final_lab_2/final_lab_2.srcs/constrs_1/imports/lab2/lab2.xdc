# ZYBO Pin Assignments
############################
# On-board Slide Switches  #
############################
set_property PACKAGE_PIN G15 [get_ports {sw_4bit_tri_i[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw_4bit_tri_i[0]}]
set_property PACKAGE_PIN P15 [get_ports {sw_4bit_tri_i[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw_4bit_tri_i[1]}]
set_property PACKAGE_PIN W13 [get_ports {sw_4bit_tri_i[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw_4bit_tri_i[2]}]
set_property PACKAGE_PIN T16 [get_ports {sw_4bit_tri_i[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw_4bit_tri_i[3]}]


set_property IOSTANDARD LVCMOS33 [get_ports {btns_4bit_tri_i[3]}]
set_property PACKAGE_PIN Y16 [get_ports {btns_4bit_tri_i[3]}]
set_property PACKAGE_PIN V16 [get_ports {btns_4bit_tri_i[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btns_4bit_tri_i[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btns_4bit_tri_i[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btns_4bit_tri_i[0]}]
set_property PACKAGE_PIN P16 [get_ports {btns_4bit_tri_i[1]}]
set_property PACKAGE_PIN R18 [get_ports {btns_4bit_tri_i[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {gpio_led_tri_o[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_button_tri_i[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_button_tri_i[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_button_tri_i[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_button_tri_i[0]}]
set_property PACKAGE_PIN V18 [get_ports {gpio_led_tri_o[0]}]
set_property PACKAGE_PIN Y16 [get_ports {gpio_button_tri_i[3]}]
set_property PACKAGE_PIN V16 [get_ports {gpio_button_tri_i[2]}]
set_property PACKAGE_PIN P16 [get_ports {gpio_button_tri_i[1]}]
set_property PACKAGE_PIN R18 [get_ports {gpio_button_tri_i[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {gpio_switch_tri_i[0]}]
set_property PACKAGE_PIN U12 [get_ports {gpio_led_tri_o[1]}]
set_property PACKAGE_PIN W19 [get_ports {gpio_led_tri_o[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_led_tri_o[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_led_tri_o[1]}]
set_property PACKAGE_PIN R14 [get_ports {gpio_switch_tri_i[0]}]

