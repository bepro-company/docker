FROM python:3.11-bullseye

# 패키지 (curl, git, aws, docker) 설치 + 정리
RUN apt-get update && \
    apt-get install -y unzip awscli git curl && \
    curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh && \
    rm -fv get-docker.sh && \
    rm -rf /var/lib/apt/lists/*

# Create tmp directory for TemporaryFile()
RUN mkdir -p /tmp /var/tmp /usr/tmp && \
    chmod 1777 /tmp /var/tmp /usr/tmp

ENV TMPDIR=/tmp
