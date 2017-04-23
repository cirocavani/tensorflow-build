#!/bin/bash
set -eu

cd `dirname "$0"`/..

./setup.sh

docker build -t tensorflow_cpu/build/ubuntu1604:1.0 -f 1.0-cpu/Dockerfile .

docker run -t \
  --name tensorflow_cpu_1.0 \
  --user tensorflow \
  tensorflow_cpu/build/ubuntu1604:1.0 \
  /bin/bash --login /home/tensorflow/build.sh

docker cp \
  tensorflow_cpu_1.0:/home/tensorflow/tensorflow-cpu-1.0.1-cp35-cp35m-linux_x86_64.whl \
  .

docker rm tensorflow_cpu_1.0
