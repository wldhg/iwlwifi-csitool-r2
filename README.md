# BPI-R2 Intel CSITool Kernel
This is a Linux **4.4** kernel source for Banana Pi R2 (BPI-R2) which includes [sigcomm2010 CSI tool](https://github.com/dhalperi/linux-80211n-csitool).  

The kernel source is based on [frank-w's kernel](https://github.com/frank-w/BPI-R2-4.4/).  

### How to build and install this?
You can follow the method A, B or C.

##### A - Use image file (Recommended)
1. Install [this image (7.08GB)](https://go.wldh.org/r2-intel-img) on your sdcard. This image is a result of `dd` of 64GB sdcard.
2. Put the sdcard to BPI-R2 and power on.
3. Log in to the linux with ID `i` and password `me`. (`hostname` is `CSI-Tool`.)
4. Do `dmesg | grep iwl` and check the result. If there is a message which says `connector callback registered`, this means that your installation of BPI-R2 CSITool-enabled kernel is successful.  

##### B - Build yourself (Cross-compile)
1. Prepare cross-compiling environment (`arm-linux-gnueabihf`).  
2. `git clone https://github.com/wldh-g/BPI-R2-Intel-CSITool`  
3. `cd BPI-R2-Intel-CSITool; make build_csitool`  
4. Turn on your BPI-R2.
5. `sudo mount /dev/mmcblk0p1 /boot` on R2.
6. Copy a new `uImage` file on the repository root to `/boot/bananapi/bpi-r2/linux/uImage-csitool` at R2.
7. Edit `/boot/bananapi/bpi-r2/linux/uEnv.txt` and change `kernel=uImage` to `kernel=uImage-csitool` at R2.
8. Reboot your R2.

##### C - Build yourself (On R2)
1. Resize `/dev/mmcblk0p2` partition to the end of your sdcard.  
2. `git clone https://github.com/wldh-g/BPI-R2-Intel-CSITool`  
3. `cd BPI-R2-Intel-CSITool; make build_csitool`  
4. `sudo mount /dev/mmcblk0p1 /boot`
5. `make install_csitool`
6. Edit `/boot/bananapi/bpi-r2/linux/uEnv.txt` and change `kernel=uImage` to `kernel=uImage-csitool` at R2.  
7. Reboot your BPI-R2.  

### How can I check the installation and use it?
- Do `dmesg | grep iwl` and check the result. If there is a message which says `connector callback registered`, this means that your installation of BPI-R2 CSITool-enabled kernel is successful.  
- Please look at this [README of CSI Collector](https://github.com/wldh-g/BPI-R2-Intel-CSITool-App#readme).  

### Disclaimer
The poweroff driver is not included in this kernel.  
So the power of the device will stay on even after the OS successfully shut down.

### LICENSE
Linux is under GPL-2.0 and CSI tool is under MIT license.
