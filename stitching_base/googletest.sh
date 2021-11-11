#!/bin/bash

cd ~
git clone https://github.com/google/googletest.git googletest
mkdir -p googletest/build
cd googletest/build
cmake .. && make -j$(nproc) && make install
