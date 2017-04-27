#!/bin/bash
set -eu

cd `dirname "$0"`/..

rm -rf tensorflow-cpu-1.1.0-cp35-cp35m-linux_x86_64.whl

./setup.sh

docker build -t tensorflow_cpu/build/ubuntu1604:1.1 -f 1.1-cpu/Dockerfile .

docker run -t \
  --name tensorflow_cpu_1.1 \
  --user tensorflow \
  tensorflow_cpu/build/ubuntu1604:1.1 \
  /bin/bash --login /home/tensorflow/build.sh

docker cp \
  tensorflow_cpu_1.1:/home/tensorflow/tensorflow-cpu-1.1.0-cp35-cp35m-linux_x86_64.whl \
  .

docker rm tensorflow_cpu_1.1
