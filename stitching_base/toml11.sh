#!/bin/bash

git clone https://github.com/ToruNiina/toml11.git
cd toml11
mkdir build
cd build
cmake .. && make -j$(nproc) && make install
