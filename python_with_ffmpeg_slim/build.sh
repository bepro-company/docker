#!/bin/bash

docker build -t bepro/python_with_ffmpeg:slim .
docker push bepro/python_with_ffmpeg:slim
