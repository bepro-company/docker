#!/bin/bash
git clone https://github.com/Haivision/srt.git
cd srt
git checkout v1.4.4
./configure
make -j4
make install

# ffmpeg
git clone --single-branch --branch release/4.4 https://git.ffmpeg.org/ffmpeg.git
cd ffmpeg
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
./configure \
  --enable-shared \
  --disable-static \
  --enable-libfdk-aac \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libvorbis \
  --enable-cuda \
  --enable-cuvid \
  --enable-nvenc \
  --enable-nonfree \
  --enable-gpl \
  --enable-gnutls \
  --enable-libfdk-aac \
  --enable-libx264 \
  --enable-libx265 \
  --enable-pthreads \
  --extra-cflags=-I/usr/local/cuda/include \
  --extra-ldflags=-L/usr/local/cuda/lib64 \
  --enable-libsrt
make -j$(nproc) && make install
