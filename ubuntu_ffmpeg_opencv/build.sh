#!/bin/bash

docker build -t bepro/ubuntu_ffmpeg_opencv .
docker push bepro/ubuntu_ffmpeg_opencv:latest
