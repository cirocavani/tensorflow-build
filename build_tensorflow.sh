#!/bin/bash
set -eu

cd $(dirname "$0")

TF_VERSION=$1
TF_PROC=$2
BUILD_HOME="$(pwd)/$TF_VERSION"
BUILD_MOUNT="/home/tensorflow/build"
IMAGE_NAME="tensorflow_$TF_PROC/build/ubuntu1604"

if [ ! -d "$BUILD_HOME" ]; then
    echo "Build not found: $BUILD_HOME"
    exit 1
fi

if [ ! -z "$(docker ps -q -a -f name=tensorflow_build$)" ]; then
    docker rm -f tensorflow_build
fi

docker run -t --rm \
    --name tensorflow_build \
    --user tensorflow \
    -e BUILD_MOUNT=$BUILD_MOUNT \
    -v $BUILD_HOME:$BUILD_MOUNT:rw \
    $IMAGE_NAME \
    $BUILD_MOUNT/build.sh $TF_PROC
