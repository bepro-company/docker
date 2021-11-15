FROM floopcz/tensorflow_cc:ubuntu-cuda-2.6.0

RUN \
      apt-get update -y && \
      # software-properties-common for add-apt-repository
      apt-get install -y --no-install-recommends software-properties-common curl wget && \
      # xenial-security required for libjasper1
      add-apt-repository -y "deb http://security.ubuntu.com/ubuntu xenial-security main" && \
      # nvidia vpi
      apt-key adv --fetch-key https://repo.download.nvidia.com/jetson/jetson-ota-public.asc && \
      add-apt-repository -y "deb https://repo.download.nvidia.com/jetson/x86_64 bionic r32.5" && \
      # dvc
      wget https://dvc.org/deb/dvc.list -O /etc/apt/sources.list.d/dvc.list && \
      wget -qO - https://dvc.org/deb/iterative.asc | apt-key add - && \
      # node v14 (LTS until 2023-04-30)
      curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
      apt-get install -y --no-install-recommends \
       python3.7 python3.7-dev python3.7-venv python3-pip python3-setuptools python3-numpy nodejs build-essential \
       automake libtool unzip nasm yasm checkinstall cmake pkg-config yasm git gfortran libjpeg8-dev \
       libpng-dev libx264-dev libx265-dev libnuma-dev libvpx-dev libfdk-aac-dev libmp3lame-dev libopus-dev \
       libssh-dev gnutls-bin libgnutls28-dev libavdevice-dev libjasper1 libtiff-dev libavcodec-dev libavformat-dev \
       libswscale-dev libavutil-dev libavresample-dev libdc1394-22-dev libxine2-dev libv4l-dev && \
      # use python 3.7
      update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1 && \
      update-alternatives --config python3 && \
      cd /usr/include/linux && \
      ln -s -f ../libv4l1-videodev.h videodev.h && \
      apt-get install -y --no-install-recommends \
       sudo g++-7 gdb clang-format-10 libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgtk2.0-dev libtbb-dev \
       qt5-default libatlas-base-dev libfaac-dev libtheora-dev libvorbis-dev libxvidcore-dev libopencore-amrnb-dev \
       libopencore-amrwb-dev x264 v4l-utils libva-dev libx11-dev xorg-dev libglew1.5 libglew1.5-dev \
       libglu1-mesa libglu1-mesa-dev libgl1-mesa-glx libgl1-mesa-dev libglfw3-dev libglfw3 freeglut3-dev \
       libzbar-dev libzbar0 libnvvpi1 vpi1-dev libmediainfo-dev mediainfo libqrencode-dev \
       gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly \
       gstreamer1.0-libav python3-gst-1.0 gstreamer1.0-tools dvc && \
      apt-get install --reinstall ca-certificates && \
      rm -rf /var/lib/apt/lists/* && \
      # use latest cmake
      pip3 install cmake --upgrade && \
      update-alternatives --install /usr/bin/cmake cmake /usr/local/bin/cmake 1 --force

WORKDIR /root

ADD *.sh ./
RUN bash nvcodec.sh && rm -rfv nvcodec.sh nv-codec-headers
RUN bash ffmpeg.sh && rm -rfv ffmpeg.sh ffmpeg && ldconfig && ffmpeg -version
RUN bash opencv.sh && rm -rfv opencv.sh opencv-3.4.12 opencv_contrib-3.4.12
RUN bash live555.sh && rm -rfv live555.sh live
RUN bash hlsserver.sh && rm -rfv hlsserver.sh hls-server
RUN bash googletest.sh && rm -rfv googletest.sh googletest
RUN bash gst-qroverlay.sh && rm -rfv gst-qroverlay.sh gst-qroverlay
RUN bash qr-lipsync.sh && rm -rfv qr-lipsync.sh qr-lipsync
RUN bash spdlog.sh && rm -rfv spdlog

ENTRYPOINT ["/bin/bash"]
