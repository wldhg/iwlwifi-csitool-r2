#!/bin/sh

export INSTALL_MOD_PATH=$PWD/packed/BPI-ROOT/

rm -rf packed
mkdir -p packed/BPI-BOOT/bananapi/r2/linux
mkdir -p packed/BPI-ROOT/lib/modules
mkdir -p packed/BPI-ROOT/lib/firmware
cp ./uImage packed/BPI-BOOT/bananapi/r2/linux/uImage
mkdir -p packed/BPI-ROOT/etc/modprobe.d
make modules_install ARCH=arm
echo "blacklist cryptodev" > packed/BPI-ROOT/etc/modprobe.d/cryptodev.conf
cd packed
tar -cz --owner=root --group=root -f kernel.tar.gz BPI-ROOT BPI-BOOT
echo "Check ./packed"
