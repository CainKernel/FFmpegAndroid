#!/bin/sh

# 编译选项
EXTRA_CFLAGS="-march=armv8-a -D__ANDROID__ -D__ARM_ARCH_8__ -D__ARM_ARCH_8A__"

# x264 源码目录
X264_SOURCE=${ROOT_SOURCE}/build/x264
# 输出路径
PREFIX=${X264_SOURCE}/android/arm64-v8a

# 配置和编译
cd ${X264_SOURCE}
./configure \
--host=aarch64-linux-android \
--sysroot=${PLATFORM} \
--cross-prefix=${TOOLCHAIN}/bin/aarch64-linux-android- \
--prefix=${PREFIX} \
--enable-static \
--enable-pic \
--enable-strip \
--disable-cli \
--disable-win32thread \
--disable-avs \
--disable-swscale \
--disable-lavf \
--disable-ffms \
--disable-gpac \
--disable-lsmash \
--extra-cflags="-Os -fpic ${EXTRA_CFLAGS}" \
--extra-ldflags="" \
${ADDITIONAL_CONFIGURE_FLAG}

make clean
make -j4
make install
