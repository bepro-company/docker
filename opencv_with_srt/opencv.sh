#!/bin/bash
wget -qO opencv.zip https://github.com/opencv/opencv/archive/3.4.16.zip
wget -qO opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/3.4.16.zip
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
  -D PYTHON3_EXECUTABLE=$(which python3) \
  -D PYTHON_INCLUDE_DIR=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
  -D PYTHON_INCLUDE_DIR2=$(python3 -c "from os.path import dirname; from distutils.sysconfig import get_config_h_filename; print(dirname(get_config_h_filename()))") \
  -D PYTHON_LIBRARY=$(python3 -c "from distutils.sysconfig import get_config_var;from os.path import dirname,join ; print(join(dirname(get_config_var('LIBPC')),get_config_var('LDLIBRARY')))") \
  -D PYTHON3_NUMPY_INCLUDE_DIRS=$(python3 -c "import numpy; print(numpy.get_include())") \
  -D PYTHON3_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")   -D BUILD_opencv_cudacodec=OFF \
  -D WITH_V4L=OFF \
  -D WITH_LIBV4L=ON \
  ../
make -j$(nproc) && make install
