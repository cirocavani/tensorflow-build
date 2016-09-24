#!/bin/bash
set -eu

cd `dirname "$0"`/..

./setup.sh

docker build -t tensorflow_build/ubuntu1604:0.10 -f 0.10/Dockerfile .

docker run -t \
  --name tensorflow_0.10 \
  --user tensorflow \
  tensorflow_build/ubuntu1604:0.10 \
  /bin/bash --login /home/tensorflow/build.sh

docker cp \
  tensorflow_0.10:/home/tensorflow/tensorflow-0.10.0-py2-none-linux_x86_64.whl \
  .

docker rm tensorflow_0.10
