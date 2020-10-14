#!/bin/bash

docker build -t bepro/lambda_python3.7 .
docker push bepro/lambda_python3.7:latest

# CR_USER: github user id
# CR_PAT: https://docs.github.com/en/free-pro-team@latest/packages/managing-container-images-with-github-container-registry/pushing-and-pulling-docker-images#authenticating-to-github-container-registry
if [[ $CR_USER ]] && [[ $CR_PAT ]]
then
  docker tag bepro/lambda_python3.7:latest ghcr.io/bepro-company/docker/lambda_python3.7:latest
  echo $CR_PAT | docker login ghcr.io -u $CR_USER --password-stdin
  docker push ghcr.io/bepro-company/docker/lambda_python3.7:latest
else
  echo "CR_USER, CR_PAT environment variables required!"
fi
