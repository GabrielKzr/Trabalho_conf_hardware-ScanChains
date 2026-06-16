##############################################################
##         Initial Encounter Configuration                  ##
## Script Generated for Undergrad class of microelectronics ##
## GAPH/FACIN/PUCRS                                         ##
##                                                          ##
## Functionalities of this script:                          ##
##  -Export design netlist to verilog                       ##
##  -Annotate the delay of the final design                 ##
##############################################################
##Export design netlist
write_netlist busca_padrao.v
##Annotate design delay
extract_rc
write_sdf busca_padrao.sdf
