.PHONY: all genus modus xcelium clean

N=16

all: genus modus xcelium

genus:
	genus -f comandos_genus.txt -execute "set N $(N)"

modus:
	modus -file outputs/dft/modus_atpg/runmodus.atpg.tcl

xcelium:
	./outputs/dft/modus_atpg/run_fullscan_sim

clean:
	rm -rf INCA_libs 
	rm -rf xcelium.d 
	rm -rf *.log 
	rm -rf *.cmd[0-9]* 
	rm -rf genus.log* 
	rm -rf genus.cmd* 
	rm -rf modus.log* 
	rm -rf modus.cmd* 
	rm -rf layout/*.db 
	rm -rf layout/*.g.gz 
	rm -rf layout/*.v.gz 
	rm -rf layout/*.metrics.json 
	rm -rf layout/*.scan.def.gz 
	rm -rf layout/*.taf.gz 
	rm -rf layout/*.mode 
	rm -rf layout/*.min_layer 
	rm -rf outputs/dft/modus_atpg/Inca_libs_* 
	rm -rf outputs/dft/modus_atpg/testresults 
	rm -rf outputs/dft/modus_atpg/tbdata
