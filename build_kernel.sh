#!/bin/bash

OUT_DIR=out
COMMON_ARGS="-j8 -C $(pwd) O=$(pwd)/${OUT_DIR} ARCH=arm64 CROSS_COMPILE=aarch64-linux-android-"

export PATH=$(pwd)/../PLATFORM/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin:$PATH 

[ -d ${OUT_DIR} ] && rm -rf ${OUT_DIR}
mkdir ${OUT_DIR}

make ${COMMON_ARGS} sdm450_sec_defconfig VARIANT_DEFCONFIG=sdm450_sec_a6plte_eur_open_defconfig SELINUX_DEFCONFIG=selinux_defconfig
make -j64 ${COMMON_ARGS}

cp ${OUT_DIR}/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image

