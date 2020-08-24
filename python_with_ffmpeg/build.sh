#!/bin/bash

docker build -t "python_with_ffmpeg:3.7" -t "python_with_ffmpeg" .
docker tag python_with_ffmpeg:3.7-test bepro/python_with_ffmpeg:3.7-test
docker push bepro/python_with_ffmpeg:latest
docker push bepro/python_with_ffmpeg:3.7
