##############################################################
##         Initial Encounter Configuration                  ##
## Script Generated for Undergrad class of microelectronics ##
## GAPH/FACIN/PUCRS                                         ##
##                                                          ##
## Functionalities of this script:                          ##
##  -Place standard cells                                   ##
##  -Place core pins                                        ##
##  -Perform initial route of the design                    ##
##############################################################

##########################################
## Place the design
##########################################
place_opt_design

##########################################
## Place pins in the chip sides
##########################################
edit_pin -side Top -layer 2 -spread_type center -spacing 3 -pin {Bus2IP_Clk {Bus2IP_RdCE[0]} {Bus2IP_RdCE[1]} {Bus2IP_RdCE[2]} {Bus2IP_RdCE[3]} {Bus2IP_RdCE[4]} {Bus2IP_RdCE[5]} {Bus2IP_RdCE[6]} {Bus2IP_RdCE[7]} {Bus2IP_RdCE[8]} {Bus2IP_RdCE[9]} {Bus2IP_RdCE[10]} {Bus2IP_RdCE[11]} {Bus2IP_RdCE[12]} {Bus2IP_RdCE[13]} {Bus2IP_RdCE[14]}}

edit_pin -side Left -layer 3 -spread_type center -spacing 3 -pin {{Bus2IP_Data[0]} {Bus2IP_Data[1]} {Bus2IP_Data[2]} {Bus2IP_Data[3]} {Bus2IP_Data[4]} {Bus2IP_Data[5]} {Bus2IP_Data[6]} {Bus2IP_Data[7]} Bus2IP_Reset chip_scan_se chip_scan_tm chip_sdi_1 chip_sdo_1 chip_sdi_2 chip_sdo_2}

edit_pin -side Bottom -layer 2 -spread_type center -spacing 3 -pin {{Bus2IP_WrCE[0]} {Bus2IP_WrCE[1]} {Bus2IP_WrCE[2]} {Bus2IP_WrCE[3]} {Bus2IP_WrCE[4]} {Bus2IP_WrCE[5]} {Bus2IP_WrCE[6]} {Bus2IP_WrCE[7]} {Bus2IP_WrCE[8]} {Bus2IP_WrCE[9]} {Bus2IP_WrCE[10]} {Bus2IP_WrCE[11]} {Bus2IP_WrCE[12]} {Bus2IP_WrCE[13]} {Bus2IP_WrCE[14]}}

edit_pin -side Right -layer 3 -spread_type center -spacing 3 -pin {{IP2Bus_Data[0]} {IP2Bus_Data[1]} {IP2Bus_Data[2]} {IP2Bus_Data[3]} {IP2Bus_Data[4]} {IP2Bus_Data[5]} {IP2Bus_Data[6]} {IP2Bus_Data[7]} user_int}

##########################################
# Pre Clock Tree Synthesys Optimizations
##########################################
set_interactive_constraint_modes [all_constraint_modes -active]
reset_ideal_network *

# Optimize only for setup
set_db opt_fix_fanout_load false
opt_design -pre_cts 
opt_design -pre_cts -incremental

# Optimize MaxFan
set_db opt_fix_fanout_load true
opt_design -pre_cts
opt_design -pre_cts -incremental

#######################
# Clock Tree Synthesys 
#######################
ccopt_design 
report_timing
