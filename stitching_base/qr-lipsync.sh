#!/bin/bash

set -e

git clone https://github.com/UbiCastTeam/qr-lipsync.git
cd qr-lipsync

/usr/bin/python3.6 setup.py install
