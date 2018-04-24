#!/bin/bash
set -eu

cd $(dirname "$0")

./setup.sh

TF_PROC=$1
IMAGE_NAME="tensorflow_$TF_PROC/build/ubuntu1604"
DOCKERFILE="Dockerfile-$TF_PROC"

docker build -t \
     $IMAGE_NAME \
    -f $DOCKERFILE \
    .

echo "Docker image done!"
