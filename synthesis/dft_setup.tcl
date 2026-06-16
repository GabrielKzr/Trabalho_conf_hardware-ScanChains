##########################################################################################
# 1) TOP LEVEL DFT SETUP (DFT design attributes & scan_chain, test clock definition ...) #
##########################################################################################

## Set the DFT scan FF style for scan replacement {muxed_scan|clocked_lssd_scan}. Muxed scan is the most commonly used
set_db dft_scan_style muxed_scan 

## Prefix is added to name of DFT logic that is inserted
# prefix of the scan chain names, otherwise the pattern 'DFT_sdi_<X>' and 'DFT_sdo_<X>' is adopted, where X is 1 to N-number of scan chains
#set_db dft_prefix scan_
set_db dft_prefix chip_ 

## This attribute tells RC to trace clock lines to automatically find the top-level clocks
## and automatically assign them as test clocks
set_db dft_identify_top_level_test_clocks true 
## This attribute tells RC to trace async set/reset pins of FF's back to top-level pins
## and automatically assign them as test signals
set_db dft_identify_test_signals true 

## This attribute tell RC whether to treat outputs of clock gating elements as different
## test clock domains as the clock that fed the gating.
set_db dft_identify_internal_test_clocks false 
## This attribute controls mapping of non-scan flops to scan FF's for functional purposes
set_db use_scan_seqs_for_non_dft false 

# Specify whether to allow mixing of rising and falling edge-triggered scan flip-flops from the same test-clock domain in the same scan chain:
# By default, the scan configuration engine creates a different scan chain for scan flip-flops triggered by the rising and falling edges of the same test clock
#set_db dft_mix_clock_edges_in_scan_chain {true | false} top_design
#define_dft dft_mix_clock_edges_in_scan_chains false
set_db designs .dft_mix_clock_edges_in_scan_chains false

## Definition of a DFT pin used for Scan Shift. It is also possible to share test and functional pins in order to reduce the pin count
## define_dft shift_enable -name <shiftEnableObject> -active <high|low> <portOrpin> [-create_port]
define_dft shift_enable -name se -create_port -active high chip_scan_se

## Definition of a DFT pin used as a Test Mode control
## define_dft test_mode -name <testModeObject> -active <high|low> <portOrpin> [-create_port] [-shared_in]
define_dft test_mode -name tm -create_port -active high chip_scan_tm

#Specify the minimum number of scan chains to be created (recommended for block-level approach to DFT):
#set_db dft_min_number_of_scan_chains integer top_design

#Specify the maximum length of any scan chain (recommended for block-level approach to DFT):
#set_db dft_max_length_of_scan_chains integer top_design
#set_db dft_max_length_of_scan_chains 205 ${DESIGN}

#######################################################################################################
## 2) CREATING SCAN CHAINS
## scan chains can be created automatically using '-auto_create_chains' or manually 
#######################################################################################################
check_dft_rules

#########################################
#### automatic scan generation mode #####

# replace normal flip-flops by scan flip-flops
replace_scan
# check scan insertion before actually insert it into your design
connect_scan_chains -auto_create_chains -preview -pack
# perform scan insertion
connect_scan_chains -auto_create_chains

#########################################
#### manual scan generation mode #####
# in this case there is a single clock domain, but it might be required to attach different scan chains to different clock domains
#define_dft test_clock -name clk -period 50000 chip_clk_i
#define_dft scan_chain -sdi {chip_scan_in[0]} -sdo {chip_scan_out[0]} -create_ports -non_shared_output -domain chip_clk_i -name chain0
#define_dft scan_chain -create_ports -non_shared_output -domain chip_clk_i -name chain0
#define_dft scan_chain -create_ports -non_shared_output -domain chip_clk_i -name chain1
#define_dft scan_chain -create_ports -non_shared_output -domain chip_clk_i -name chain2
#define_dft scan_chain -create_ports -non_shared_output -domain chip_clk_i -name chain3

# check the scan chains again
#connect_scan_chains -preview
#connect_scan_chains

#######################################################################################################
## 3) INCREMENTAL SYNTHESIS
#######################################################################################################
puts "###############################################################"
puts "################ Incremental Synthesis (Post DfT) #############"
puts "###############################################################"
syn_opt

#####################################################################################################
## 4) REPORTING AND EXPORTING TEST RELATED INFO
#####################################################################################################
puts "########### Reporting and Exporting Test Info ###########"
## Check DFT rules again
check_dft_rules -advanced

## Report out the scan chains
report dft_chains > ${_DFT_PATH}/${DESIGN}_dft_chains.rpt
report dft_setup > ${_DFT_PATH}/${DESIGN}_dft_setup.rpt

puts "############ Exporting the Design to Encounter Test ###########"
# scan chain info
write_scandef > ${_DFT_PATH}/${DESIGN}.scandef
# Creating an Interface File for ATPG Tool
write_atpg -stil > ${_DFT_PATH}/${DESIGN}_atpg.stil
# these steps are required to perform further verification using incisive simulator for scan chains and test patterns verification
write_dft_atpg -library ${LIB_FILES} -directory ${_DFT_PATH}/modus_atpg -ncsim_library ${LIB_FILES}
# after synthesis, run the following commands to verify the DfT insertion
# $ modus -file outputs/dft/modus_atpg/runmodus.atpg.tcl
# $ outputs/dft/modus_atpg/run_fullscan_sim
