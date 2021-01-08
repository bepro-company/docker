FROM lambci/lambda:build-python3.7 as base

# google-cloud-sdk 다운로드
ENV GOOGLE_CLOUD_SDK_VERSION=303.0.0
WORKDIR /google-cloud/src
RUN curl -sSLO https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
    && tar xvzf google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
    && rm google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz

FROM lambci/lambda:build-python3.7 as release
RUN rpm --rebuilddb; yum install -y mysql-devel nc bsdtar

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
