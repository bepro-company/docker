#!/bin/bash

docker build -t bepro/lambda_python3.7 .
docker push bepro/lambda_python3.7:latest
