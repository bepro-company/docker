#!/bin/bash

# live555 library for rtsp input
cd ~
wget http://www.live555.com/liveMedia/public/live555-latest.tar.gz
tar -zxvf live555-latest.tar.gz
rm live555-latest.tar.gz
cd live/
./genMakefiles linux-with-shared-libraries
make -j$(nproc) && make install
