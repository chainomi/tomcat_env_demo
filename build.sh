#!/usr/bin/env bash

set -xe

echo "copying env files"

cp .env.prod .env
cp .env.prod /home/ec2-user/Docker_env_demo/docker/.env

echo "Loading the .env files: \n" "info"
export $(grep -v '^#' docker/.env | xargs -0)
export $(grep -v '^#' .env | xargs -0)

docker-compose build

docker-compose up -d
