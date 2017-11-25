#!/bin/bash
set -eu

cd $(dirname "$0")

./setup.sh

docker build -t \
    tensorflow_cpu/build/ubuntu1604 \
    -f Dockerfile.cpu \
    .
