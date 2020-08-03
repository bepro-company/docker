#!/bin/bash

docker build -t "python_with_ffmpeg:3.7" -t "python_with_ffmpeg" .
docker tag python_with_ffmpeg:latest bepro/python_with_ffmpeg:latest
docker tag python_with_ffmpeg:3.7 bepro/python_with_ffmpeg:3.7
docker push bepro/python_with_ffmpeg:latest
docker push bepro/python_with_ffmpeg:3.7
