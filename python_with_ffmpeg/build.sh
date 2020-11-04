#!/bin/bash

# TODO: python:3.7-slim-bullseye가 나오면 ffmpeg 4.3 을 쓸 수 있으므로 Dockerfile 하나로 통합 가능. 혹은 alpine 3.12도 가능해보이나 테스트 필요

# default: for bepro-python-api
docker build -t "python_with_ffmpeg:3.7" -t "python_with_ffmpeg" .
docker tag python_with_ffmpeg:latest bepro/python_with_ffmpeg:latest
docker tag python_with_ffmpeg:3.7 bepro/python_with_ffmpeg:3.7

docker push bepro/python_with_ffmpeg:latest
docker push bepro/python_with_ffmpeg:3.7

# libcairo: for bepro-python github actions
docker build -t "python_with_ffmpeg:3.7-libcairo" -t "ghcr.io/bepro-company/docker/python_with_ffmpeg:3.7-libcairo" -f Dockerfile.libcairo .

# CR_USER: github user id
# CR_PAT: https://docs.github.com/en/free-pro-team@latest/packages/managing-container-images-with-github-container-registry/pushing-and-pulling-docker-images#authenticating-to-github-container-registry
if [[ $CR_USER ]] && [[ $CR_PAT ]]
then
  docker tag bepro/python_with_ffmpeg:3.7 ghcr.io/bepro-company/docker/python_with_ffmpeg:3.7
  echo $CR_PAT | docker login ghcr.io -u $CR_USER --password-stdin
  docker push ghcr.io/bepro-company/docker/python_with_ffmpeg:3.7

  # libcairo
  docker push ghcr.io/bepro-company/docker/python_with_ffmpeg:3.7-libcairo
else
  echo "CR_USER, CR_PAT environment variables required!"
fi
