################################################################################
#
# Innovus setup file
# Created by Genus(TM) Synthesis Solution 21.12-s068_1
#   on 06/11/2026 20:32:27
#
################################################################################
#
# Genus(TM) Synthesis Solution setup file
# This file can only be run in Innovus Common UI mode.
#
################################################################################


# Version Check
###########################################################

      namespace eval ::genus_innovus_version_check { 
        set minimum_version 21
        set maximum_version 22
        regexp {\d\d} [get_db program_version] this_version
        puts "Checking Innovus major version against Genus expectations ..."
        if { $this_version < $minimum_version || $this_version > $maximum_version } {
          error "**ERROR: this operation requires Innovus major version to be between '$minimum_version' and '$maximum_version'."
        }
      }
    
set _t0 [clock seconds]
puts [format  {%%%s Begin Genus to Innovus Setup (%s)} \# [clock format $_t0 -format {%m/%d %H:%M:%S}]]
set_db read_physical_allow_multiple_port_pin_without_must_join true
set_db must_join_all_ports true
set_db timing_cap_unit 1pf
set_db timing_time_unit 1ns


# Design Import
################################################################################
source -quiet /soft64/cadence/ferramentas/GENUS211/tools.lnx86/lib/cdn/rc/edi/innovus_procs_common_ui.tcl
## Reading FlowKit settings file
source layout/logical_multiplier_param_N128.flowkit_settings.tcl

source layout/logical_multiplier_param_N128.invs_init.tcl

# Reading metrics file
################################################################################
read_metric -id current layout/logical_multiplier_param_N128.metrics.json
## Reading Innovus Mode attributes file
pqos_eval {rcp::read_taf layout/logical_multiplier_param_N128.mode_attributes.taf.gz}

## Reading common preserve file for dont_touch and dont_use preserve settings
source -quiet layout/logical_multiplier_param_N128.preserve.tcl

read_def /home/gabriel.kaizer/Downloads/testa_padrao_scan/synthesis/layout/logical_multiplier_param_N128.scan.def.gz


# Mode Setup
################################################################################
source layout/logical_multiplier_param_N128.mode


# MSV Setup
################################################################################

# Reading write_name_mapping file
################################################################################

      if { [is_attribute -obj_type port original_name] &&
           [is_attribute -obj_type pin original_name] &&
           [is_attribute -obj_type pin is_phase_inverted]} {
        source layout/logical_multiplier_param_N128.wnm_attrs.tcl
      }
    

# Reading NDR file
source layout/logical_multiplier_param_N128.ndr.tcl

# Reading Instance Attributes file
pqos_eval { rcp::read_taf layout/logical_multiplier_param_N128.inst_attributes.taf.gz}

# Reading minimum routing layer data file
################################################################################
eval_legacy {gpsPrivate::readMinLayerCstr -file layout/logical_multiplier_param_N128.min_layer} 

eval_legacy {set edi_pe::pegConsiderMacroLayersUnblocked 1}
eval_legacy {set edi_pe::pegPreRouteWireWidthBasedDensityCalModel 1}

      set _t1 [clock seconds]
      puts [format  {%%%s End Genus to Innovus Setup (%s, real=%s)} \# [clock format $_t1 -format {%m/%d %H:%M:%S}] [clock format [expr {28800 + $_t1 - $_t0}] -format {%H:%M:%S}]]
    
