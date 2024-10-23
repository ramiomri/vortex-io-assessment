#!/bin/bash

DOCKER_IMAGE="lambda-app"
CLUSTER_REGISTRY_PORT="5000"

docker build -t ${DOCKER_IMAGE} .
docker tag ${DOCKER_IMAGE} localhost:${CLUSTER_REGISTRY_PORT}/${DOCKER_IMAGE}
docker push localhost:${CLUSTER_REGISTRY_PORT}/${DOCKER_IMAGE}