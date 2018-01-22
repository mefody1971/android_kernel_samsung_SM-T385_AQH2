#!/bin/bash

#BUILD SCRIPT BY MEFODY (Original by ASHYX)

#SETUP BUILD ENVIROMENT
export ARCH=arm
export CROSS_COMPILE=/home/mefody/Projects/tool-chain/arm-cortex-linux-gnueabi-linaro_4.9.4-2015.06/bin/arm-eabi-

#MAKE DEFCONFIG
make  msm8937_sec_defconfig VARIANT_DEFCONFIG=msm8937_sec_gta2slte_sea_open_defconfig SELINUX_DEFCONFIG=selinux_defconfig
cp $(pwd)/arch/arm/configs/mefody_gta2slte_defconfig $(pwd)/.config

#MAKE MENU CONFIG(REMOVE # TO ENABLE)
#make nconfig

#GET CPU COUNT
CORE_COUNT=`grep processor /proc/cpuinfo|wc -l`
make -j$CORE_COUNT

#BUILD DTB
tools/dtbTool -s 2048 -o arch/arm/boot/dt.img -p scripts/dtc/ arch/arm/boot/dts/