FROM lambci/lambda:build-python3.7
RUN rpm --rebuilddb; yum install -y mysql-devel nc bsdtar

# google-cloud-sdk 다운로드
# 버전 고정 처리
ENV GOOGLE_CLOUD_SDK_VERSION=303.0.0
WORKDIR /google-cloud/src
RUN curl -sSLO https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
    && tar xvzf google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
    && rm google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz

ENV PATH $PATH:/google-cloud/src/google-cloud-sdk/bin