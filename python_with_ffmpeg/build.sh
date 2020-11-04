#!/bin/bash

# for bepro-python-api cloud run / bepro-python github actions
docker build -t "python_with_ffmpeg:3.7-alpine" -t "ghcr.io/bepro-company/docker/python_with_ffmpeg:3.7-alpine" .

# CR_USER: github user id
# CR_PAT: https://docs.github.com/en/free-pro-team@latest/packages/managing-container-images-with-github-container-registry/pushing-and-pulling-docker-images#authenticating-to-github-container-registry
if [[ $CR_USER ]] && [[ $CR_PAT ]]
then
  echo $CR_PAT | docker login ghcr.io -u $CR_USER --password-stdin
  docker push ghcr.io/bepro-company/docker/python_with_ffmpeg:3.7-alpine
else
  echo "CR_USER, CR_PAT environment variables required!"
fi
