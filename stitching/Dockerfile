FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04

RUN \
      apt-get update -y && \
      apt-get install -y curl wget build-essential unzip nasm yasm checkinstall cmake pkg-config yasm git gfortran libjpeg8-dev libpng-dev software-properties-common \
      libx264-dev libx265-dev libnuma-dev libvpx-dev libfdk-aac-dev libmp3lame-dev libopus-dev libssh-dev gnutls-bin libgnutls28-dev libavdevice-dev && \
      add-apt-repository -y "deb http://security.ubuntu.com/ubuntu xenial-security main" && \
      apt-get -y install libjasper1 libtiff-dev libavcodec-dev libavformat-dev libswscale-dev libavutil-dev libavresample-dev libdc1394-22-dev libxine2-dev libv4l-dev && \
      cd /usr/include/linux && ln -s -f ../libv4l1-videodev.h videodev.h && \
      apt-get -y install g++-7 gdb git python3-dev python3-numpy sudo npm libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgtk2.0-dev libtbb-dev qt5-default libatlas-base-dev libfaac-dev \
      libmp3lame-dev libtheora-dev libvorbis-dev libxvidcore-dev libopencore-amrnb-dev libopencore-amrwb-dev libavresample-dev x264 v4l-utils python-pip python3-pip libva-dev \
      libx11-dev xorg-dev libglu1-mesa-dev freeglut3-dev libglew1.5 libglew1.5-dev libglu1-mesa libglu1-mesa-dev libgl1-mesa-glx libgl1-mesa-dev libglfw3-dev libglfw3 freeglut3-dev && \
      pip install numpy && \
      pip3 install numpy

ADD nvcodec.sh /root
RUN chmod +x /root/nvcodec.sh
RUN /root/nvcodec.sh && rm -rfv nvcodec.sh nv-codec-headers

ADD ffmpeg.sh /root
RUN chmod +x /root/ffmpeg.sh
RUN /root/ffmpeg.sh && rm -rfv ffmpeg.sh ffmpeg

ADD opencv.sh /root
RUN chmod +x /root/opencv.sh
RUN /root/opencv.sh && rm -rfv opencv.sh opencv-3.4.1 opencv_contrib-3.4.1

ADD live555.sh /root
RUN chmod +x /root/live555.sh
RUN /root/live555.sh && rm -rfv live555.sh live

ADD hlsserver.sh /root
RUN chmod +x /root/hlsserver.sh
RUN /root/hlsserver.sh && rm -rfv hlsserver.sh hls-server

ADD tensorflow.sh /root
RUN chmod +x /root/tensorflow.sh
RUN /root/tensorflow.sh && rm -rfv tensorflow.sh tensorflow_cc

WORKDIR /root
ENTRYPOINT ["/bin/bash"]
