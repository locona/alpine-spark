#!/bin/sh

REPO=alpine-spark
TAG=latest

source ./spark.env
docker build -t $DOCKER_USER_NAME/$REPO .
docker login -u $DOCKER_USER_NAME -p $DOCKER_PASSWORD

docker build -t $REPO .
docker push $DOCKER_USER_NAME/$REPO:$TAG
