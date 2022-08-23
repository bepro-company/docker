FROM jrottenberg/ffmpeg:5.1-ubuntu2004

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl python3 python3-pip wget locales \
    && apt-get purge -y --auto-remove \
    && rm -rf /var/lib/apt/lists*

# Setup locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LC_ALL en_US.UTF-8

# google-cloud-sdk
ARG GOOGLE_CLOUD_SDK_VERSION=396.0.0-linux-x86_64
WORKDIR /google-cloud-sdk
RUN curl -sSLO https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-${GOOGLE_CLOUD_SDK_VERSION}.tar.gz \
    && tar xf google-cloud-cli-${GOOGLE_CLOUD_SDK_VERSION}.tar.gz --strip-components=1 \
    && rm google-cloud-cli-${GOOGLE_CLOUD_SDK_VERSION}.tar.gz

RUN ./install.sh \
     --usage-reporting false \
     --path-update true \
     --quiet

ENTRYPOINT [ "bash" ]
