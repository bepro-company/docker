#!/bin/bash

git clone -b v1.9.2 https://github.com/gabime/spdlog.git
cd spdlog
mkdir build
cd build
cmake .. && make -j$(nproc) && make install
