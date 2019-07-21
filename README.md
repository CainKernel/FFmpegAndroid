# FFmpegAndroid
本项目为简单的将FFmpeg + x264 + fdk-aac 编译成单个 libffmpeg.so 的脚本

ffmpeg.tar.gz: ffmpeg-3.3.3的源码
x264.tar.gz: libx264 源码
fdk-aac.tar.gz: fdk-aac-0.1.5源码

如果要更新源码，直接将压缩包替换即可

本项目仅仅是一个简单的编译脚本，如果想要做成可裁剪的自动化编译工具，可参考ijkplayer等开源库的实现方案。

# 使用
建议在Linux环境下编译
执行脚本前，需要更改自己的NDK路径

编译armeabi-v7a:
```
$ ./build_armeabi-v7a.sh
```

编译 arm64-v8a:
```
$ ./build_arm64-v8a.sh
```

其他平台如x86、x86-64暂无实现，有兴趣可自行实现

