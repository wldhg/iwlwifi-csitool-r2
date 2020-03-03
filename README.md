# BPI-R2 Intel CSITool Kernel
This is a Linux **4.4** kernel source for Banana Pi R2 (BPI-R2) which includes [sigcomm2010 CSI tool](https://github.com/dhalperi/linux-80211n-csitool).  

The kernel source is based on [frank-w's kernel](https://github.com/frank-w/BPI-R2-4.4/).  

### How to build and install this?
You can follow the method A, B, C or D.

If you already installed some linux distribution on your BPI-R2, follow **method A**. If not, I recommend **method B**.

##### A - Install prebuilt kernel
1. Download [this file (140MB)](https://go.wldh.org/r2-intel-patch) and extract it.
2. `sudo mount /dev/mmcblk0p1 /boot` on your R2.
3. Copy files in `BPI-BOOT` to `/boot` in R2.
4. Copy files in `BPI-ROOT` to `/` in R2.
5. Edit `/boot/bananapi/bpi-r2/linux/uEnv.txt` and change `kernel=(...)` to `kernel=uImage` at R2.
6. Reboot your R2.

##### B - Use image file
1. Install [this image (7.08GB)](https://go.wldh.org/r2-intel-img) on your sdcard. This image is a result of `dd` of 64GB sdcard.
2. Put the sdcard to BPI-R2 and power on.
3. Log in to the linux with ID `i` and password `me`. (`hostname` is `CSI-Tool`.)
4. Do `dmesg | grep iwl` and check the result. If there is a message which says `connector callback registered`, this means that your installation of BPI-R2 CSITool-enabled kernel is successful.  

##### C - Build yourself (Cross-compile)
1. Prepare cross-compiling environment (`arm-linux-gnueabihf`).  
2. `git clone https://github.com/wldh-g/iwlwifi-csitool-r2`  
3. `cd iwlwifi-csitool-r2`  
4. (Optional) Configure the build `make menuconfig ARCH=arm`
5. `make build_csitool ARCH=arm`
6. `make pack_csitool ARCH=arm`
7. Turn on your BPI-R2.
8. `sudo mount /dev/mmcblk0p1 /boot` on R2.
9. Copy files in `packed/BPI-BOOT` to `/boot` in R2.
10. Copy files in `packed/BPI-ROOT` to `/` in R2.
11. Edit `/boot/bananapi/bpi-r2/linux/uEnv.txt` and change `kernel=(...)` to `kernel=uImage` at R2.
12. Reboot your R2.

##### D - Build yourself (On R2)
1. Resize `/dev/mmcblk0p2` partition to the end of your sdcard.  
2. `git clone https://github.com/wldh-g/iwlwifi-csitool-r2`  
3. `cd iwlwifi-csitool-r2`  
4. (Optional) Configure the build `make menuconfig`
5. `make build_csitool`
6. `sudo mount /dev/mmcblk0p1 /boot`
7. `make install_csitool`
8. Edit `/boot/bananapi/bpi-r2/linux/uEnv.txt` and change `kernel=(... may be uImage)` to `kernel=uImage-csitool` at R2.  
9. Reboot your BPI-R2.  

### How can I check the installation and use it?
- Do `dmesg | grep iwl` and check the result. If there is a message which says `connector callback registered`, this means that your installation of BPI-R2 CSITool-enabled kernel is successful.  
- Please look at this [README of CSI Collector](https://github.com/wldh-g/iwlwifi-csitool-apps#readme).  

### Disclaimer
Linux 4.4 kernel for BPI-R2 was not fully developed yet, so some Mediatek-related features are not included in this kernel.  

The poweroff driver is not included in this kernel.  
So the power of the device will stay on even after the OS successfully shut down.

### LICENSE
Linux is under GPL-2.0 and CSI tool is under MIT license.
