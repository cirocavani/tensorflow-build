#!/bin/bash
set -eu

cd $(dirname "$0")

TF_VERSION=$1
TF_PROC=$2
BUILD_HOME="$(pwd)/$TF_VERSION"
BUILD_MOUNT="/home/tensorflow/build"
IMAGE_NAME="tensorflow_$TF_PROC/build/ubuntu1604"
CONTAINER_NAME="tensorflow_${TF_PROC}_${TF_VERSION}"

if [ ! -d "$BUILD_HOME" ]; then
    echo "Build not found: $BUILD_HOME"
    exit 1
fi

if [ ! -z "$(docker ps -q -a -f name=$CONTAINER_NAME$)" ]; then
    docker rm -f $CONTAINER_NAME
fi

docker create -it \
    --name $CONTAINER_NAME \
    --user tensorflow \
    -e BUILD_MOUNT=$BUILD_MOUNT \
    -v $BUILD_HOME:$BUILD_MOUNT:rw \
    $IMAGE_NAME

echo "$CONTAINER_NAME creation done!"
