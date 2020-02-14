#!/bin/bash

docker build -t bepro/python_with_ffmpeg .
docker push bepro/python_with_ffmpeg:latest
