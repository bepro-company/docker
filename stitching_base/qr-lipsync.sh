#!/bin/bash

set -e

git clone https://github.com/UbiCastTeam/qr-lipsync.git
cd qr-lipsync

# default python 3
python3 setup.py install

# python 3.6 (adding setuptools for arm64's python3.6)
python3.6 -m pip install setuptools
which python3.6 && python3.6 setup.py install
