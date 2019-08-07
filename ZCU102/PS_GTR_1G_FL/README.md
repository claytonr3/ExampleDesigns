# PS-GTR 1G
## DESCRIPTION:
This project utilizes the PS-GTR in Fixed-Link SGMII/1000BASE-X mode, locked to 1000Mbps with Autonegotiation Disabled. This project requires the following additional hardware:

PCIE -> SMA Breakout Card

SMA -> SFP Adapter Card 

## USAGE:
Place all files into a new project directory.
#### VIVADO:
From the command line run the following:

`vivado -source *top.tcl`
    
#### PETALINUX:
From the command line run the following:

`petalinux-create -t project -s *.bsp`
