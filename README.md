# BPI-R2 CSITool Kernel
This is a Linux **4.4** kernel source for Banana Pi R2 (BPI-R2) which includes [sigcomm2010 CSI tool](https://github.com/dhalperi/linux-80211n-csitool).  

The kernel source is based on [frank-w's kernel](https://github.com/frank-w/BPI-R2-4.4/).  

### How to build and install this?
You can follow the method A or B.

##### A - Use image file (Recommended)
1. Install [this image](https://go.wldh.org/r2-intel-img) on your sdcard. This image is a result of `dd` of 64GB sdcard.
2. Put the sdcard to BPI-R2 and power on.
3. Log in to the linux with ID `i` and password `me`.
3. Do `dmesg | grep iwl` and check the result. If there is a message which says `connector callback registered`, this means that your installation of BPI-R2 CSITool-enabled kernel is successful.  

##### B - Build yourself
1. First, prepare the build environment by installing [this image](https://drive.google.com/file/d/1Ze_YGDT3B1-P57wPcm3gcVFcCMfBLspL/view?usp=sharing) on your BPI-R2 sdcard.  
2. Resize `/dev/mmcblk0p2` partition to the end of your sdcard.  
3. `git clone https://github.com/wldh-g/BPI-R2-Intel-CSITool-Kernel`  
4. `cd BPI-R2-Intel-CSITool-Kernel; make build_csitool`  
5. `sudo mount /dev/mmcblk0p1 /boot`  
6. `./make install_csitool`  
7. Edit `/boot/bananapi/bpi-r2/linux/uEnv.txt` and change `kernel=uImage` to `kernel=uImage-csitool`.  
8. Reboot your BPI-R2.  
9. Do `dmesg | grep iwl` and check the result. If there is a message which says `connector callback registered`, this means that your installation of BPI-R2 CSITool-enabled kernel is successful.  

### How can I collect packets after the installation?
Please look at this [README for Data Collector](https://github.com/wldh-g/BPI-R2-Intel-CSITool-DataCollector#readme).  

### Disclaimer
The poweroff driver is not included in this kernel.  
So the power of the device will stay on even after the OS successfully shut down.

### LICENSE
Linux is under GPL-2.0 and CSI tool is under MIT license.
