# syntax=docker/dockerfile:1
FROM jrottenberg/ffmpeg:5.1-ubuntu2004

# Install base packages
# - python
# - wget for gcloud download
# - locales for setup locale
# - cairo for CairoSVG
# - wget for transparent dependencies in graphic-video
# - git for dependencies installation described as git
# - glib for cv2 contrib module dependencies
RUN DEBIAN_FRONTEND=noninteractive apt update \
    && apt install -y --no-install-recommends python3 python3-pip locales libcairo2 wget git libglib2.0-0 \
    && apt purge -y --auto-remove

# Setup locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LC_ALL en_US.UTF-8

# google-cloud-sdk
ARG GOOGLE_CLOUD_SDK_VERSION=396.0.0-linux-x86_64
WORKDIR /google-cloud-sdk
ADD --link https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-${GOOGLE_CLOUD_SDK_VERSION}.tar.gz .
RUN tar xf google-cloud-cli-${GOOGLE_CLOUD_SDK_VERSION}.tar.gz --strip-components=1 \
    && rm google-cloud-cli-${GOOGLE_CLOUD_SDK_VERSION}.tar.gz

RUN ./install.sh \
     --usage-reporting false \
     --path-update true \
     --quiet

ENTRYPOINT [ "bash" ]
