################################################################################
#
# Genus(TM) Synthesis Solution setup file
# Created by Genus(TM) Synthesis Solution 21.12-s068_1
#   on 06/18/2026 19:52:42
#
# This file can only be run in Genus Common UI mode.
#
################################################################################


# This script is intended for use with Genus(TM) Synthesis Solution version 21.12-s068_1


# Remove Existing Design
################################################################################
if {[::legacy::find -design design:multiplier_param_N16] ne ""} {
  puts "** A design with the same name is already loaded. It will be removed. **"
  delete_obj design:multiplier_param_N16
}


# To allow user-readonly attributes
################################################################################
::legacy::set_attribute -quiet force_tui_is_remote 1 /


# Libraries
################################################################################
::legacy::set_attribute library {/soft64/design-kits/stm/65nm-cmos065_536/CORE65GPSVT_5.1/libs/CORE65GPSVT_nom_1.00V_25C.lib /soft64/design-kits/stm/65nm-cmos065_536/CLOCK65GPSVT_3.1/libs/CLOCK65GPSVT_nom_1.00V_25C.lib /soft64/design-kits/stm/65nm-cmos065_536/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_7.0/libs/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_nom_1.00V_1.80V_25C.lib} /

::legacy::set_attribute lef_library {/soft64/design-kits/stm/65nm-cmos065_536/EncounterTechnoKit_cmos065_7m4x0y2z_AP@5.3.1/TECH/cmos065_7m4x0y2z_AP_Worst.lef /soft64/design-kits/stm/65nm-cmos065_536/PRHS65_7.0.a/CADENCE/LEF/PRHS65_soc.lef /soft64/design-kits/stm/65nm-cmos065_536/CORE65GPSVT_5.1/CADENCE/LEF/CORE65GPSVT_soc.lef /soft64/design-kits/stm/65nm-cmos065_536/CLOCK65GPSVT_3.1/CADENCE/LEF/CLOCK65GPSVT_soc.lef /soft64/design-kits/stm/65nm-cmos065_536/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_7.0/CADENCE/LEF/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_soc.lef /soft64/design-kits/stm/65nm-cmos065_536/IO65LPHVT_CORESUPPLY_50A_7M4X0Y2Z@7.0.c.UD5357/CADENCE/LEF/IO65LPHVT_CORESUPPLY_50A_7M4X0Y2Z_gaph.lef /soft64/design-kits/stm/65nm-cmos065_536/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z_7.2/CADENCE/LEF/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z_soc.lef} /
::legacy::set_attribute cap_table_file /soft64/design-kits/stm/65nm-cmos065_536/EncounterTechnoKit_cmos065_7m4x0y2z_AP@5.3.1/TECH/cmos065_7m4x0y2z_AP_Worst.captable /


# Design
################################################################################
read_netlist -top multiplier_param_N16 layout/logical_multiplier_param_N16.v.gz
read_metric -id current layout/logical_multiplier_param_N16.metrics.json

phys::read_script layout/logical_multiplier_param_N16.g.gz
puts "\n** Restoration Completed **\n"


# Data Integrity Check
################################################################################
# program version
if {"[string_representation [::legacy::get_attribute program_version /]]" != "21.12-s068_1"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-91] "golden program_version: 21.12-s068_1  current program_version: [string_representation [::legacy::get_attribute program_version /]]"
}
# license
if {"[string_representation [::legacy::get_attribute startup_license /]]" != "Genus_Synthesis"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-91] "golden license: Genus_Synthesis  current license: [string_representation [::legacy::get_attribute startup_license /]]"
}
# slack
set _slk_ [::legacy::get_attribute slack design:multiplier_param_N16]
if {[regexp {^-?[0-9.]+$} $_slk_]} {
  set _slk_ [format %.1f $_slk_]
}
if {$_slk_ != "0.1"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden slack: 0.1,  current slack: $_slk_"
}
unset _slk_
# multi-mode slack
# tns
set _tns_ [::legacy::get_attribute tns design:multiplier_param_N16]
if {[regexp {^-?[0-9.]+$} $_tns_]} {
  set _tns_ [format %.0f $_tns_]
}
if {$_tns_ != "0"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden tns: 0,  current tns: $_tns_"
}
unset _tns_
# cell area
set _cell_area_ [::legacy::get_attribute cell_area design:multiplier_param_N16]
if {[regexp {^-?[0-9.]+$} $_cell_area_]} {
  set _cell_area_ [format %.0f $_cell_area_]
}
if {$_cell_area_ != "1965"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden cell area: 1965,  current cell area: $_cell_area_"
}
unset _cell_area_
# net area
set _net_area_ [::legacy::get_attribute net_area design:multiplier_param_N16]
if {[regexp {^-?[0-9.]+$} $_net_area_]} {
  set _net_area_ [format %.0f $_net_area_]
}
if {$_net_area_ != "829"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden net area: 829,  current net area: $_net_area_"
}
unset _net_area_
