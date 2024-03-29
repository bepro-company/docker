#!/bin/bash
git clone --recursive https://github.com/opencv/opencv-python.git
cd ./opencv-python && git checkout -b 3.4 origin/3.4 && cp /root/pyproject.toml .
export CMAKE_ARGS="-DPYTHON3_LIMITED_API=ON -DWITH_FFMPEG=ON"
pip wheel . --verbose
python3 -m pip install -U --root-user-action=ignore numpy