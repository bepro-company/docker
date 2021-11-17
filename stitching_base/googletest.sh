#!/bin/bash

git clone -b release-1.11.0 https://github.com/google/googletest.git
cd googletest
mkdir build
cd build
cmake .. && make -j$(nproc) && make install
