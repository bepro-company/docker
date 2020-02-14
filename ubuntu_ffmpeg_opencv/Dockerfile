FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04

ENV ROOT_DIR /root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y
RUN apt-get install -y \
      curl wget build-essential unzip \
      nasm yasm libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libavresample-dev \
      libx264-dev libx265-dev libnuma-dev libvpx-dev libfdk-aac-dev libmp3lame-dev libopus-dev libssh-dev gnutls-bin libgnutls28-dev libavdevice-dev

# Opencv gcc version must be less then 6.
RUN apt-get -y update
RUN apt-get -y install \
      build-essential checkinstall cmake pkg-config yasm git gfortran libjpeg8-dev libpng-dev software-properties-common

RUN add-apt-repository -y "deb http://security.ubuntu.com/ubuntu xenial-security main"
RUN apt-get -y install \
      libjasper1 libtiff-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine2-dev libv4l-dev

WORKDIR /usr/include/linux
RUN ln -s -f ../libv4l1-videodev.h videodev.h

RUN apt-get -y install \
      libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgtk2.0-dev libtbb-dev qt5-default libatlas-base-dev libfaac-dev \
      libmp3lame-dev libtheora-dev libvorbis-dev libxvidcore-dev libopencore-amrnb-dev libopencore-amrwb-dev libavresample-dev x264 v4l-utils \
      python-pip python3-pip libva-dev
RUN pip install numpy; pip3 install numpy

# nvcodec header
WORKDIR $ROOT_DIR
RUN git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
WORKDIR nv-codec-headers
RUN git checkout tags/n9.0.18.3
RUN make -j$(nproc)
RUN make install

# ffmpeg
WORKDIR $ROOT_DIR
RUN git clone --single-branch --branch release/4.2 https://git.ffmpeg.org/ffmpeg.git
WORKDIR $ROOT_DIR/ffmpeg
RUN ./configure \
      --enable-shared \
      --disable-static \
      --enable-libfdk-aac \
      --enable-libmp3lame \
      --enable-libopus \
      --enable-libvorbis \
      --enable-cuda \
      --enable-cuvid \
      --enable-nvenc \
      --enable-nonfree \
      --enable-libnpp \
      --enable-gpl \
      --enable-gnutls \
      --enable-libfdk-aac \
      --enable-libx264 \
      --enable-libx265 \
      --extra-cflags=-I/usr/local/cuda/include \
      --extra-ldflags=-L/usr/local/cuda/lib64
RUN make -j$(nproc)
RUN make install
RUN ldconfig
RUN ffmpeg -version

# opencv 3.4.1
WORKDIR $ROOT_DIR
RUN wget -qOopencv.zip https://github.com/opencv/opencv/archive/3.4.1.zip
RUN wget -qOopencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/3.4.1.zip
RUN unzip opencv.zip
RUN unzip opencv_contrib.zip
RUN rm -fv opencv*.zip

WORKDIR $ROOT_DIR/opencv-3.4.1
RUN mkdir build
WORKDIR $ROOT_DIR/opencv-3.4.1/build
RUN cmake -D CMAKE_BUILD_TYPE=RELEASE \
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
  -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-3.4.1/modules \
  -D CUDA_NVCC_FLAGS=--expt-relaxed-constexpr \
  -D BUILD_EXAMPLES=OFF \
  -D BUILD_NEW_PYTHON_SUPPORT=ON \
  -D BUILD_opencv_cudacodec=OFF \
  ../
RUN make -j$(nproc)
RUN make install

