# BPI-R2 CSITool Kernel
This is linux **4.4** kernel source for Banana Pi R2 (BPI-R2) which [sigcomm2010 CSI tool](https://github.com/dhalperi/linux-80211n-csitool)'s driver modification is included.  

## How to build and install it
1. First, install [this image](https://drive.google.com/file/d/1Ze_YGDT3B1-P57wPcm3gcVFcCMfBLspL/view?usp=sharing) on your sd card.  
2. Resize `/dev/mmcblk0p2` partition to the end of your sdcard  
3. `git clone https://github.com/widh/BPI-R2-CSITool-Kernel`  
4. `cd BPI-R2-CSITool-Kernel; ./make build_csitool`  
5. `sudo mount /dev/mmcblk0p1 /boot`  
6. `./make install_csitool`  
7. Edit `/boot/bananapi/bpi-r2/linux/uEnv.txt` and change `kernel=uImage` to `kernel=uImage-csitool`.  
8. Reboot your BPI-R2.  
9. Do `dmesg | grep iwl` and check the result. If there is a message which says `connector callback registered`, this means that your installation of BPI-R2 CSITool-enabled kernel is successful.  

## How to use CSITool
Please look [README for Data Acquirer](https://github.com/widh/BPI-R2-CSITool-DataAcquirer#readme).  

## LICENSE
Linux is under GPL-2.0 and CSI tool is under MIT license.
