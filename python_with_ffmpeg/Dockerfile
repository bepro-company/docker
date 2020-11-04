FROM alpine:3.12 as base

RUN apk update \
    && apk add curl=7.69.1-r1

# google-cloud-sdk 다운로드
# 버전 고정 처리
ENV GOOGLE_CLOUD_SDK_VERSION=303.0.0
WORKDIR /google-cloud/src
RUN curl -sSLO https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
    && tar xvzf google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
    && rm google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz


FROM python:3.7-alpine3.12 as release

# ffmpeg과 관련된 libgomp1 라이브러리 설치
# opencv와 관련된 libglib2, libgl1-mesa-glx 라이브러리 설치
# bepro-python과 관련된 procps, gcc, git, cairo, jpeg-dev, zlib-dev 설치
RUN apk update \
    && apk add --no-cache \
       libgomp=9.3.0-r2 \
       procps=3.3.16-r0 \
       gcc=9.3.0-r2 \
       git=2.26.2-r0 \
       libc-dev=0.7.2-r3 \
       glib-dev=2.64.6-r0 \
       mesa-gl=20.0.7-r0 \
       cairo=1.16.0-r2 \
       ffmpeg=4.3.1-r0 \
       jpeg-dev \
       zlib-dev


# google-cloud-sdk 설치 
WORKDIR /google-cloud-sdk
COPY --from=base /google-cloud/src/google-cloud-sdk /google-cloud-sdk
RUN ./install.sh \
     --usage-reporting=false \
     --path-update=true \
     --bash-completion=true \
     --rc-path=/.bashrc \
     --quiet

# gcloud binary PATH 추가
ENV PATH=$PATH:/google-cloud-sdk/bin

RUN ffmpeg -version
