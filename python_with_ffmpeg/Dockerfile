# syntax=docker/dockerfile:1
FROM jrottenberg/ffmpeg:5.1-ubuntu2004 AS base

WORKDIR /google-cloud-cli

FROM base AS google_cloud_cli_downloader

# google-cloud-cli
ARG GOOGLE_CLOUD_CLI_VERSION=396.0.0-linux-x86_64
ADD --link https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-${GOOGLE_CLOUD_CLI_VERSION}.tar.gz .
RUN tar xf google-cloud-cli-${GOOGLE_CLOUD_CLI_VERSION}.tar.gz --strip-components=1 \
    && rm google-cloud-cli-${GOOGLE_CLOUD_CLI_VERSION}.tar.gz

FROM base AS builder

# Install base packages
# - python
# - wget for gcloud download
# - locales for setup locale
# - cairo for CairoSVG
# - wget for transparent dependencies in graphic-video
# - curl for metadata query in Google compute engine VM
# - git for dependencies installation described as git
# - glib for cv2 contrib module dependencies
RUN DEBIAN_FRONTEND=noninteractive apt update \
    && apt install -y --no-install-recommends python3 python3-pip locales libcairo2 wget curl git libglib2.0-0 \
    && apt purge -y --auto-remove

# Setup locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LC_ALL en_US.UTF-8

COPY --link --from=google_cloud_cli_downloader /google-cloud-cli/ /google-cloud-cli/

RUN ./install.sh --usage-reporting false --quiet
ENV PATH /google-cloud-cli/bin:$PATH

ENTRYPOINT [ "bash" ]
