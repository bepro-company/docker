#!/bin/bash

set -e

git clone https://github.com/UbiCastTeam/qr-lipsync.git
cd qr-lipsync

# default python 3
python3 setup.py install

# python 3.6 (adding setuptools for arm64's python3.6)
if which python3.6
then
    python3.6 -m pip install setuptools
    python3.6 setup.py install
fi
which python3.6 && python3.6 setup.py install
