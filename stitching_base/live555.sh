#!/bin/bash

# live555 library for rtsp input
wget -O live555-latest.tar.gz http://www.live555.com/liveMedia/public/live555-latest.tar.gz
tar xvzf live555-latest.tar.gz
rm live555-latest.tar.gz
cd live/
./genMakefiles linux-with-shared-libraries
make -j$(nproc) && make install
