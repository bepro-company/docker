#!/bin/bash

git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
cd nv-codec-headers
git checkout tags/n9.0.18.3
make -j$(nproc) && make install
