#!/bin/bash
set -eu

cd `dirname "$0"`/..

TF_WHEEL=tensorflow-1.3.0a0-cp35-cp35m-linux_x86_64.whl

rm -rf $TF_WHEEL

./setup.sh

docker build -t tensorflow_cpu/build/ubuntu1604:master -f master-cpu/Dockerfile .

docker run -t \
  --name tensorflow_cpu_master \
  --user tensorflow \
  tensorflow_cpu/build/ubuntu1604:master \
  /bin/bash --login /home/tensorflow/build.sh

docker cp tensorflow_cpu_master:/home/tensorflow/$TF_WHEEL .

docker rm tensorflow_cpu_master
