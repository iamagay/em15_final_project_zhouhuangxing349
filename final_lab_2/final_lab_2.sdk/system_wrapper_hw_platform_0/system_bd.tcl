
################################################################
# This is a generated script based on design: system
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2014.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source system_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z010clg400-1


# CHANGE DESIGN NAME HERE
set design_name system

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}


# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]
  set gpio_button [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 gpio_button ]
  set gpio_led [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 gpio_led ]
  set gpio_switch [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 gpio_switch ]

  # Create ports

  # Create instance: button, and set properties
  set button [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 button ]
  set_property -dict [ list CONFIG.C_ALL_INPUTS {1} CONFIG.C_GPIO_WIDTH {4}  ] $button

  # Create instance: final_core, and set properties
  set final_core [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 final_core ]
  set_property -dict [ list CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {0} CONFIG.PCW_EN_CLK0_PORT {1} CONFIG.PCW_EN_RST0_PORT {1} CONFIG.PCW_IMPORT_BOARD_PRESET {C:/xup/embedded/sources/ps7_system_prj.xml} CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {0} CONFIG.PCW_SD0_PERIPHERAL_ENABLE {0} CONFIG.PCW_TTC0_PERIPHERAL_ENABLE {0} CONFIG.PCW_USB0_PERIPHERAL_ENABLE {0} CONFIG.PCW_USE_M_AXI_GP0 {1}  ] $final_core

  # Create instance: led, and set properties
  set led [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 led ]
  set_property -dict [ list CONFIG.C_ALL_INPUTS {0} CONFIG.C_ALL_OUTPUTS {1} CONFIG.C_DOUT_DEFAULT {0x00000000} CONFIG.C_GPIO_WIDTH {3}  ] $led

  # Create instance: rst_processing_system7_0_100M, and set properties
  set rst_processing_system7_0_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_processing_system7_0_100M ]

  # Create instance: switch, and set properties
  set switch [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 switch ]
  set_property -dict [ list CONFIG.C_ALL_INPUTS {1} CONFIG.C_GPIO_WIDTH {1}  ] $switch

  # Create instance: system, and set properties
  set system [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 system ]
  set_property -dict [ list CONFIG.NUM_MI {3}  ] $system

  # Create interface connections
  connect_bd_intf_net -intf_net button_GPIO [get_bd_intf_ports gpio_button] [get_bd_intf_pins button/GPIO]
  connect_bd_intf_net -intf_net led_GPIO [get_bd_intf_ports gpio_led] [get_bd_intf_pins led/GPIO]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins final_core/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins final_core/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins final_core/M_AXI_GP0] [get_bd_intf_pins system/S00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M00_AXI [get_bd_intf_pins led/S_AXI] [get_bd_intf_pins system/M00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M01_AXI [get_bd_intf_pins button/S_AXI] [get_bd_intf_pins system/M01_AXI]
  connect_bd_intf_net -intf_net switch_GPIO [get_bd_intf_ports gpio_switch] [get_bd_intf_pins switch/GPIO]
  connect_bd_intf_net -intf_net system_M02_AXI [get_bd_intf_pins switch/S_AXI] [get_bd_intf_pins system/M02_AXI]

  # Create port connections
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins button/s_axi_aclk] [get_bd_pins final_core/FCLK_CLK0] [get_bd_pins final_core/M_AXI_GP0_ACLK] [get_bd_pins led/s_axi_aclk] [get_bd_pins rst_processing_system7_0_100M/slowest_sync_clk] [get_bd_pins switch/s_axi_aclk] [get_bd_pins system/ACLK] [get_bd_pins system/M00_ACLK] [get_bd_pins system/M01_ACLK] [get_bd_pins system/M02_ACLK] [get_bd_pins system/S00_ACLK]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins final_core/FCLK_RESET0_N] [get_bd_pins rst_processing_system7_0_100M/ext_reset_in]
  connect_bd_net -net rst_processing_system7_0_100M_interconnect_aresetn [get_bd_pins rst_processing_system7_0_100M/interconnect_aresetn] [get_bd_pins system/ARESETN]
  connect_bd_net -net rst_processing_system7_0_100M_peripheral_aresetn [get_bd_pins button/s_axi_aresetn] [get_bd_pins led/s_axi_aresetn] [get_bd_pins rst_processing_system7_0_100M/peripheral_aresetn] [get_bd_pins switch/s_axi_aresetn] [get_bd_pins system/M00_ARESETN] [get_bd_pins system/M01_ARESETN] [get_bd_pins system/M02_ARESETN] [get_bd_pins system/S00_ARESETN]

  # Create address segments
  create_bd_addr_seg -range 0x10000 -offset 0x41210000 [get_bd_addr_spaces final_core/Data] [get_bd_addr_segs button/S_AXI/Reg] SEG_btns_4bit_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41200000 [get_bd_addr_spaces final_core/Data] [get_bd_addr_segs led/S_AXI/Reg] SEG_sw_4bit_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41220000 [get_bd_addr_spaces final_core/Data] [get_bd_addr_segs switch/S_AXI/Reg] SEG_switch_Reg
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


