FROM    circleci/python:3.7
USER    root
RUN     apt-get update -y && apt-get install ffmpeg -y && \
        apt-get autoremove -y && \
        apt-get clean -y
RUN     curl -sSL https://sdk.cloud.google.com | bash
ENV     PATH $PATH:/root/google-cloud-sdk/bin