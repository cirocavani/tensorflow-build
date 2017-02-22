#!/bin/bash
set -eu

cd `dirname "$0"`/..

./setup.sh

docker build -t tensorflow_build/ubuntu1604:1.0.0 -f 1.0.0/Dockerfile .

docker run -t \
  --name tensorflow_1.0.0 \
  --user tensorflow \
  tensorflow_build/ubuntu1604:1.0.0 \
  /bin/bash --login /home/tensorflow/build.sh

docker cp \
  tensorflow_1.0.0:/home/tensorflow/tensorflow-1.0.0-cp35-cp35m-linux_x86_64.whl \
  .

docker rm tensorflow_1.0.0
