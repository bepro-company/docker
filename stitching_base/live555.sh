#!/bin/bash

# live555 library for rtsp input
wget -O live555-stable.tar.gz https://storage.googleapis.com/bepro-dev/jetson/live.2022.04.12.tar.gz
tar xvzf live555-stable.tar.gz
rm live555-stable.tar.gz
cd live/
./genMakefiles linux-with-shared-libraries
make -j$(nproc) && make install
