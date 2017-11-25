#!/bin/bash
set -eu

cd $(dirname "$0")

./setup.sh

docker build -t \
    tensorflow_gpu/build/ubuntu1604 \
    -f Dockerfile.gpu \
    .
