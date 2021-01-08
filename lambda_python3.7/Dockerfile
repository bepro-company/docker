FROM lambci/lambda:build-python3.7
RUN rpm --rebuilddb; yum install -y mysql-devel nc bsdtar

ENV GOOGLE_CLOUD_SDK_VERSION=303.0.0
WORKDIR /google-cloud/src
RUN curl -sSLO https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
    && tar xvzf google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
    && rm google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz

WORKDIR /google-cloud/src/google-cloud-sdk
RUN ./install.sh \
     --usage-reporting=false \
     --path-update=true \
     --bash-completion=true \
     --rc-path=/.bashrc \
     --quiet

ENV PATH=$PATH:/google-cloud/src/google-cloud-sdk/bin