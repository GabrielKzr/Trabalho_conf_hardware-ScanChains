##############################################################
##         Initial Encounter Configuration                  ##
## Script Generated for Undergrad class of microelectronics ##
## GAPH/FACIN/PUCRS                                         ##
##                                                          ##
## Functionalities of this script:                          ##
##  -Load the required standard cell libraries              ##
##  -Load synthesized netlist                               ##
##  -Load design constraints                                ##
##  -Generate a floorplan                                   ##
##############################################################
##Loading std cell libs / netlist / constraints / setting vdd/gnd
set_db init_power_nets {VDD vdd vdd!}
set_db init_ground_nets {VSS GND gnd gnd!}
source layout/logical_busca_padrao.invs_setup.tcl

##Generating square floorplan (1) with 80% of density (0.7) with 3um margins (3 3 3 3)
create_floorplan -site CORE -core_density_size 1 0.8 3 3 3 3
##fit screen
gui_fit


