#!/bin/bash

git clone https://github.com/UbiCastTeam/gst-qroverlay.git
cd gst-qroverlay
./autogen.sh
./configure --prefix=/usr && make install
