# Steps to build the VM

1. Create a new VM with Virtual Box (2 GB DRAM, 8 GB Disk, 4 CPU)
2. Install Debian 32-bit with XFCE (look in advanced settings)
3. Name: Nerves User, Username: nerves, Password: nerves
4. sudo apt-get install git g++ libssl-dev libncurses5-dev bc
5. Disable screen saver
6. git clone git://github.com/nerves-project/nerves-sdk.git
7. mkdir dl
8. cd nerves-sdk
9. make nerves_rpi_defconfig
10. Enable ccache
11. make
12. (Optional) rm -fr buildroot

Build time after ccache has been initialized -> ~12 minutes
