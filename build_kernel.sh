#!/bin/bash

export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-
export PATH=$PWD/toolchain/bin:$PATH
export ANDROID_MAJOR_VERSION=o
COMMON="O=out CC=clang LD=ld.lld OBJDUMP=llvm-objdump OBJCOPY=llvm-objcopy AR=llvm-ar AS=llvm-as"

make $COMMON exynos7870-a3y17lte_defconfig
cp out/.config arch/arm64/configs/exynos7870-a3y17lte_defconfig
make $COMMON -j$(nproc)
