##############################################################
##         Initial Encounter Configuration                  ##
## Script Generated for Undergrad class of microelectronics ##
## GAPH/FACIN/PUCRS                                         ##
##                                                          ##
## Functionalities of this script:                          ##
##  -Route the design with nanoroute                        ##
##############################################################

##########################################
# Pos Clock Tree Synthesys Optimizations
##########################################
# Fix DRC
set_db opt_fix_fanout_load true
opt_design -post_cts

# Fix DRC + setup
set_db opt_fix_fanout_load false
opt_design -post_cts -drv

# Fix hold
opt_design -hold -post_cts
opt_design -post_cts -incremental

####################################
# Route
####################################
route_design
route_design -global_detail -wire_opt
set_db timing_analysis_type ocv
opt_design -post_route


####################################
# Check Design
####################################
check_design -type all
report_timing
check_drc


