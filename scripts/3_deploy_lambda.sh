#!/bin/bash

export CLUSTER="localCluster"
export CLUSTER_REGISTRY_PORT="5000"
export DOCKER_IMAGE="lambda-app"

envsubst < kubernetes/deployment.yaml | kubectl apply -f -
kubectl apply -f kubernetes/service.yaml