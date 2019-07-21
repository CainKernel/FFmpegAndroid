#!/bin/sh
# 根目录
export ROOT_SOURCE=$(cd `dirname $0`; pwd)

#判断系统类型
SYSTEM=$(uname -s)

if [ "${SYSTEM}" = "Linux" ]; then
  export NDK=/opt/Android/android-ndk-r13b
  export TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
fi

if [ "${SYSTEM}" = "Darwin" ]; then
  export NDK=/opt/Android/android-ndk-r13b
  export TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64
fi

if [ "$(uname -o)" = "Msys" ]; then
  export NDK=D:/Android/sdk/ndk-bundle
  export TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64
fi

# 编译的API
export ANDROID_API=android-19
export PLATFORM=$NDK/platforms/${ANDROID_API}/arch-arm

# 编译目录是否存在
if [ ! -d "build" ]; then
  mkdir ${ROOT_SOURCE}/build/
fi

# 源码是否存在
if [ ! -d "ffmpeg" ]; then
  tar -zxvf ffmpeg.tar.gz 
fi

if [ ! -d "x264" ]; then
  tar -zxvf x264.tar.gz
fi

if [ ! -d "fdk-aac" ]; then
  tar -zxvf fdk-aac.tar.gz 
fi

# 判断编译目录是否存在源码, 不存在则复制到编译目录
if [ ! -d "build/ffmpeg" ]; then
  cp -R ffmpeg/ ${ROOT_SOURCE}/build/ffmpeg/
fi

if [ ! -d "build/x264" ]; then
  cp -R x264/ ${ROOT_SOURCE}/build/x264/
fi

if [ ! -d "build/fdk-aac" ]; then
  cp -R fdk-aac/ ${ROOT_SOURCE}/build/fdk-aac/
fi

# 到工具目录执行编译
cd tools

# 编译x264
if [ ! -x "libx264/build_x264_armeabi-v7a.sh" ]; then
    echo "can not find x264 build script"
else
    chmod a+x ./libx264/build_x264_armeabi-v7a.sh
    ./libx264/build_x264_armeabi-v7a.sh
fi

# 编译fdk-aac
if [ ! -x "fdk-aac/build_fdk-aac_armeabi_v7a.sh" ]; then
    echo "can not find x264 build script"
else
    chmod a+x ./fdk-aac/build_fdk-aac_armeabi_v7a.sh
    ./fdk-aac/build_fdk-aac_armeabi_v7a.sh
fi

# 编译ffmpeg
if [ ! -x "ffmpeg/build_ffmpeg_armeabi-v7a.sh" ]; then
  echo "can not find ffmpeg build script"
else
    chmod a+x ./ffmpeg/build_ffmpeg_armeabi-v7a.sh
    ./ffmpeg/build_ffmpeg_armeabi-v7a.sh
fi


