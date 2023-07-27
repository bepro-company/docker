#!/bin/bash

# opencv 3.4.12
wget -qO opencv.zip https://github.com/opencv/opencv/archive/4.7.0.zip
wget -qO opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.7.0.zip
unzip opencv.zip
unzip opencv_contrib.zip
rm -fv opencv*.zip

cd opencv-3.4.16
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
  -D CMAKE_INSTALL_PREFIX=/usr/local \
  -D WITH_NVCUVID=ON \
  -D WITH_TBB=ON \
  -D WITH_FFMPEG=ON \
  -D WITH_CUBLAS=1 \
  -D WITH_CUDA=ON \
  -D WITH_GTK=ON \
  -D ENABLE_FAST_MATH=1 \
  -D CUDA_FAST_MATH=1 \
  -D OPENCV_ENABLE_NONFREE=True \
  -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-3.4.16/modules \
  -D CUDA_NVCC_FLAGS=--expt-relaxed-constexpr \
  -D BUILD_EXAMPLES=OFF \
  -D BUILD_NEW_PYTHON_SUPPORT=ON \
  -D BUILD_opencv_cudacodec=OFF \
  -D WITH_V4L=OFF \
  -D WITH_LIBV4L=ON \
  ../
make -j$(nproc) && make install
