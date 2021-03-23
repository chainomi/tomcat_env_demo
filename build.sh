#!/usr/bin/env bash


set -xe

echo "copying env files"

cp .env.prod .env
cp .env.prod ./docker/.env

echo "Loading the .env files: \n" "info"
export $(grep -v '^#' docker/.env | xargs -0)
export $(grep -v '^#' .env | xargs -0)

docker-compose build
echo "loging into AWS"
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 488144151286.dkr.ecr.us-east-2.amazonaws.com

echo "tagging image for AWS ECR"
docker tag ${MY_IMAGE_NAME}:latest 488144151286.dkr.ecr.us-east-2.amazonaws.com/tomcat_env_demo:latest

echo "pushing image to AWS ECR"

docker push 488144151286.dkr.ecr.us-east-2.amazonaws.com/tomcat_env_demo:latest

#docker-compose up -d
#docker-compose images
#docker-compose logs
