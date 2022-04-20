#!/bin/bash

git clone -b v2.1.0 https://github.com/yse/easy_profiler.git
cd easy_profiler
mkdir build
cd build
cmake .. && make -j$(nproc) && make install