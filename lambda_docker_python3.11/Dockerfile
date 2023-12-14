# FROM public.ecr.aws/lambda/python:3.11
FROM python:3.11-bullseye

RUN apt-get update
RUN apt-get install -y unzip awscli
RUN rm -rf /var/lib/apt/lists/*

# Install docker for deployment
RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh && rm -fv get-docker.sh

