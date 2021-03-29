#!/bin/bash

# install bazel
cd ~
installer=bazel-0.26.1-installer-linux-x86_64.sh
wget -O $installer https://github.com/bazelbuild/bazel/releases/download/0.26.1/$installer
chmod +x $installer
./$installer
source /usr/local/lib/bazel/bin/bazel-complete.bash
rm -fv $installer

# install tensorflow cpp api
cd ~
git clone -b v2.2.0 https://github.com/FloopCZ/tensorflow_cc.git
cd ~/tensorflow_cc/tensorflow_cc
echo "2.0.0" > PROJECT_VERSION
mkdir build
cd build
cmake ..
make -j$(nproc) && make install
