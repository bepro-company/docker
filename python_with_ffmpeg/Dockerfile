# ffmpeg 빌드를 위한 도커 이미지
# https://hub.docker.com/r/jrottenberg/ffmpeg/dockerfile
FROM jrottenberg/ffmpeg:4.3-ubuntu1804 as base

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && apt-get purge -y --auto-remove \
    && rm -rf /var/lib/apt/lists*

# google-cloud-sdk 다운로드
# 버전 고정 처리
ENV GOOGLE_CLOUD_SDK_VERSION=303.0.0
WORKDIR /google-cloud/src
RUN curl -sSLO https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
    && tar xvzf google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
    && rm google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz


FROM python:3.7-slim-bullseye as release

# ffmpeg과 관련된 libgomp1 라이브러리 설치
# opencv와 관련된 libglib2, libgl1-mesa-glx 라이브러리 설치
# bepro-python과 관련된 procps, gcc, git 설치
RUN apt-get update \
    && apt-get install -y --no-install-recommends libgomp1=10.2.1-6 \
       procps=2:3.3.17-5 \
       gcc=4:10.2.1-1 \
       git=1:2.30.2-1 \
       libc6-dev=2.31-13+deb11u3 \
       libglib2.0-0 \
       libgl1-mesa-glx \
       libcairo2 \
    && apt-get purge -y --auto-remove \
    && rm -rf /var/lib/apt/lists*

# google-cloud-sdk 설치 
WORKDIR /google-cloud-sdk
COPY --from=base /google-cloud/src/google-cloud-sdk /google-cloud-sdk
RUN ./install.sh \
     --usage-reporting=false \
     --path-update=true \
     --bash-completion=true \
     --rc-path=/.bashrc \
     --quiet

# ffmpeg, ffprobe 바이너리 설치
COPY --from=base /usr/local /usr/local/

# gcloud binary PATH 추가
ENV PATH=$PATH:/google-cloud-sdk/bin

# ffmpeg 라이브러리 연동
ENV LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64
