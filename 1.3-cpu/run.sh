#!/bin/bash
set -eu

cd $(dirname "$0")/..

TF_WHEEL=tensorflow-1.3.0rc2-cp36-cp36m-linux_x86_64.whl

rm -rf $TF_WHEEL

./setup.sh

docker build -t tensorflow_cpu/build/ubuntu1604:1.3 -f 1.3-cpu/Dockerfile .

docker run -t \
  --name tensorflow_cpu_1.3 \
  --user tensorflow \
  tensorflow_cpu/build/ubuntu1604:1.3 \
  /bin/bash --login /home/tensorflow/build.sh

docker cp tensorflow_cpu_1.3:/home/tensorflow/$TF_WHEEL .

docker rm tensorflow_cpu_1.3
