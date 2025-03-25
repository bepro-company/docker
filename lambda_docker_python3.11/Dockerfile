FROM python:3.11-bullseye

RUN apt-get update
RUN apt-get install -y unzip awscli git
RUN rm -rf /var/lib/apt/lists/*

# Install docker for deployment
RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh && rm -fv get-docker.sh

# Create tmp directory for TemporaryFile()
RUN mkdir -p /tmp && chmod 1777 /tmp
RUN mkdir -p /var/tmp && chmod 1777 /var/tmp
RUN mkdir -p /usr/tmp && chmod 1777 /usr/tmp
ENV TMPDIR=/tmp
