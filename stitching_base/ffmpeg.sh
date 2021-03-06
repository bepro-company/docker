#!/bin/bash

# ffmpeg
cd ~
git clone --single-branch --branch release/4.2 https://git.ffmpeg.org/ffmpeg.git
cd ffmpeg
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
  --enable-libnpp \
  --enable-gpl \
  --enable-gnutls \
  --enable-libfdk-aac \
  --enable-libx264 \
  --enable-libx265 \
  --extra-cflags=-I/usr/local/cuda/include \
  --extra-ldflags=-L/usr/local/cuda/lib64
make -j$(nproc) && make install
