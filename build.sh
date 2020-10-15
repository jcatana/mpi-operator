#!/bin/bash
export REGISTRY=hpcregistry.hpc.ford.com
export NS=jcatana1
export REPO=mpi-operator
export VERSION=1
export IMAGE=${REGISTRY}/${NS}/${REPO}:${VERSION}
echo $IMAGE
export PROJECT=$(basename `pwd`)
docker build --build-arg "https_proxy=http://internet.ford.com:83" --build-arg "http_proxy=http://internet.ford.com:83"  -t ${IMAGE} -f Dockerfile . && \
docker push ${IMAGE} 
IMAGE1=${IMAGE}
export REGISTRY=hpcregistry.hpc.ford.com
export NS=jcatana1
export REPO=kubectl-delivery
export VERSION=2
export IMAGE=${REGISTRY}/${NS}/${REPO}:${VERSION}
echo $IMAGE
export PROJECT=$(basename `pwd`)
docker build --build-arg "https_proxy=http://internet.ford.com:83" --build-arg "http_proxy=http://internet.ford.com:83"  -t ${IMAGE} -f cmd/kubectl-delivery/Dockerfile . && \
docker push ${IMAGE}
echo ${IMAGE1}
echo ${IMAGE}
