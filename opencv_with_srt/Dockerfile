FROM nvidia/cuda:11.3.0-base-ubuntu18.04
ENV DEBIAN_FRONTEND noninteractive

RUN \
      apt-get update -y && \
      apt-get install -y --no-install-recommends software-properties-common curl wget && \
      add-apt-repository -y "deb http://security.ubuntu.com/ubuntu xenial-security main" && \
      curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
      apt-get install -y --no-install-recommends \
       python3.8 python3-dev python3.8-venv libpython3.8-dev python3-pip python3-setuptools python3-numpy nodejs build-essential \
       automake libtool unzip nasm yasm checkinstall cmake pkg-config yasm git gfortran libjpeg8-dev \
       libpng-dev libx264-dev libx265-dev libnuma-dev libvpx-dev libfdk-aac-dev libmp3lame-dev libopus-dev \
       libssh-dev gnutls-bin libgnutls28-dev libavdevice-dev libjasper1 libtiff-dev libavcodec-dev libavformat-dev \
       libswscale-dev libavutil-dev libavresample-dev libdc1394-22-dev libxine2-dev libv4l-dev && \
       
      update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1 && \
      update-alternatives --config python3 && \
      curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py --force-reinstall && \
      cd /usr/include/linux && \
      ln -s -f ../libv4l1-videodev.h videodev.h && \
      apt-get install -y --no-install-recommends \
       sudo g++-7 gdb qt5-default libatlas-base-dev libfaac-dev libtheora-dev libvorbis-dev libxvidcore-dev libopencore-amrnb-dev \
       libopencore-amrwb-dev x264 libva-dev libx11-dev xorg-dev libglew1.5 libglew1.5-dev \
       libglu1-mesa libglu1-mesa-dev libgl1-mesa-glx libgl1-mesa-dev libglfw3-dev libglfw3 freeglut3-dev \
       libzbar-dev libzbar0 libmediainfo-dev mediainfo libqrencode-dev tcl && \

      pip3 install cmake --upgrade && \
      update-alternatives --install /usr/bin/cmake cmake /usr/local/bin/cmake 1 --force
      
WORKDIR /root

ADD nvcodec.sh .
RUN bash nvcodec.sh && rm -rfv nvcodec.sh nv-codec-headers

ADD ffmpeg.sh .
RUN bash ffmpeg.sh && rm -rfv ffmpeg.sh ffmpeg && ldconfig && ffmpeg -version

ADD pyproject.toml .
ADD opencv-python.sh .
RUN bash opencv-python.sh && rm -rfv pyproject.toml opencv-python.sh

ENV PYTHONPATH="${PYTHONPATH}:/root/opencv-python/_skbuild/linux-x86_64-3.8/cmake-build/lib/python3"