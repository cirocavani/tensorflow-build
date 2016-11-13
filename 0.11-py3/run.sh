#!/bin/bash
set -eu

cd `dirname "$0"`/..

./setup.sh

docker build -t tensorflow_build/ubuntu1604:0.11-py3 -f 0.11-py3/Dockerfile .

docker run -t \
  --name tensorflow_0.11_py3 \
  --user tensorflow \
  tensorflow_build/ubuntu1604:0.11-py3 \
  /bin/bash --login /home/tensorflow/build.sh

docker cp \
  tensorflow_0.11_py3:/home/tensorflow/tensorflow-0.11.0-py3-none-linux_x86_64.whl \
  .

docker rm tensorflow_0.11_py3
