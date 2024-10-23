#!/bin/bash

CLUSTER="localCluster"
CLUSTER_REGISTRY_PORT="5000"

k3d cluster create ${CLUSTER} \
    --registry-create ${CLUSTER}:${CLUSTER_REGISTRY_PORT} \
    -p 5432:5432@loadbalancer