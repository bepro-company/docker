#!/bin/bash

docker build -t bepro/lambda_python3.8 .
docker push bepro/lambda_python3.8:latest
