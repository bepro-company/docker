FROM bepro/tensorflow_cc:ubuntu-cuda-2.5.0

RUN \
      # node v14 (LTS until 2023-04-30)
      curl -sL https://deb.nodesource.com/setup_14.x | bash - \
      apt-get update -y && \
      # for add-apt-repository
      apt-get install -y --no-install-recommends software-properties-common && \
      # xenial-security required for libjasper1
      add-apt-repository -y "deb http://security.ubuntu.com/ubuntu xenial-security main" && \
      apt-get install -y --no-install-recommends \
       python3.7 python3.7-dev python3.7-venv python3-pip nodejs curl wget build-essential unzip nasm yasm checkinstall cmake pkg-config yasm git gfortran libjpeg8-dev \
       libpng-dev libx264-dev libx265-dev libnuma-dev libvpx-dev libfdk-aac-dev libmp3lame-dev libopus-dev libssh-dev gnutls-bin libgnutls28-dev libavdevice-dev \
       libjasper1 libtiff-dev libavcodec-dev libavformat-dev libswscale-dev libavutil-dev libavresample-dev libdc1394-22-dev libxine2-dev libv4l-dev && \
      update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1 && \
      update-alternatives --config python3 && \
      cd /usr/include/linux && \
      ln -s -f ../libv4l1-videodev.h videodev.h && \
      apt-get install -y --no-install-recommends \
       g++-7 gdb sudo libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgtk2.0-dev libtbb-dev \
       qt5-default libatlas-base-dev libfaac-dev libtheora-dev libvorbis-dev libxvidcore-dev libopencore-amrnb-dev libopencore-amrwb-dev x264 v4l-utils libva-dev \
       libx11-dev xorg-dev libglew1.5 libglew1.5-dev libglu1-mesa libglu1-mesa-dev libgl1-mesa-glx libgl1-mesa-dev libglfw3-dev libglfw3 freeglut3-dev && \
      rm -rf /var/lib/apt/lists/* && \
      pip3 install numpy

WORKDIR /root

ADD *.sh ./
RUN chmod +x nvcodec.sh && ./nvcodec.sh && rm -rfv nvcodec.sh nv-codec-headers
RUN chmod +x ffmpeg.sh && ./ffmpeg.sh && rm -rfv ffmpeg.sh ffmpeg && ldconfig && ffmpeg -version
RUN chmod +x opencv.sh && ./opencv.sh && rm -rfv opencv.sh opencv-3.4.12 opencv_contrib-3.4.12
RUN chmod +x live555.sh && ./live555.sh && rm -rfv live555.sh live
RUN chmod +x hlsserver.sh && ./hlsserver.sh && rm -rfv hlsserver.sh hls-server

ENTRYPOINT ["/bin/bash"]
