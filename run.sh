#!/bin/bash
set -eu

cd `dirname "$0"`

./setup.sh

docker build -t tensorflow_build/ubuntu1604:0.10 .

docker run -t \
  --name tensorflow_build \
  --user tensorflow \
  tensorflow_build/ubuntu1604:0.10 \
  /bin/bash --login /home/tensorflow/build.sh

docker cp \
  tensorflow_build:/home/tensorflow/tensorflow-0.10.0-py2-none-linux_x86_64.whl \
  .

docker rm tensorflow_build
