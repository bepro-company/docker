#!/bin/bash
git config --global http.sslverify false
git clone -b n9.0.18.3 https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
cd nv-codec-headers
make -j$(nproc) && make install