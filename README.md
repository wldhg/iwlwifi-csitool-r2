# BPI-R2 CSITool Kernel
This is linux **4.4** kernel source for Banana Pi R2 (BPI-R2) which [sigcomm2010 CSI tool](https://github.com/dhalperi/linux-80211n-csitool)'s driver modification is included.  
My own configuration is also added for CSITool working properly.  
The kernel source is based on [frank-w's kernel](https://github.com/frank-w/BPI-R2-4.4/).  

## How to build and install it
1. First, install [this image](https://drive.google.com/file/d/1Ze_YGDT3B1-P57wPcm3gcVFcCMfBLspL/view?usp=sharing) on your sd card.  
2. Resize `/dev/mmcblk0p2` partition to the end of your sdcard  
3. `git clone https://github.com/wldh-g/BPI-R2-CSITool-Kernel`  
4. `cd BPI-R2-CSITool-Kernel; ./make build_csitool`  
5. `sudo mount /dev/mmcblk0p1 /boot`  
6. `./make install_csitool`  
7. Edit `/boot/bananapi/bpi-r2/linux/uEnv.txt` and change `kernel=uImage` to `kernel=uImage-csitool`.  
8. Reboot your BPI-R2.  
9. Do `dmesg | grep iwl` and check the result. If there is a message which says `connector callback registered`, this means that your installation of BPI-R2 CSITool-enabled kernel is successful.  

## How to use CSITool
Please look [README for Data Collector](https://github.com/wldh-g/BPI-R2-CSITool-DataCollector#readme).  

## Disclaimer
The poweroff driver is not included in this version. In BPI-R2 kernel development, that feature is supported from 4.14 kernel, implemented by *frank-w*. But Intel Wi-Fi firmware version 2, which CSITool uses, is not supported in 4.14 kernel.  
I'm now trying to patch poweroff driver to 4.4 kernel. **For now, you have to check it's power is off by looking wire-connected display before unplug the power cable.**

## LICENSE
Linux is under GPL-2.0 and CSI tool is under MIT license.
