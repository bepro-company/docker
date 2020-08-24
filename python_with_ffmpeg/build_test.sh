#!/bin/zsh

docker build -t "python_with_ffmpeg:test" .
docker tag python_with_ffmpeg:test bepro/python_with_ffmpeg:test
docker push bepro/python_with_ffmpeg:test
