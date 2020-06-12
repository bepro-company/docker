#!/bin/bash

docker build -t bepro/lambda_python3.6 .
docker push bepro/lambda_python3.6:latest
