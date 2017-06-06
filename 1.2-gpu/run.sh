#!/bin/bash
set -eu

cd `dirname "$0"`/..

TF_WHEEL=tensorflow_gpu-1.2.0rc2-cp35-cp35m-linux_x86_64.whl

rm -rf $TF_WHEEL

./setup.sh

docker build -t tensorflow_gpu/build/ubuntu1604:1.2 -f 1.2-gpu/Dockerfile .

docker run -t \
  --name tensorflow_gpu_1.2 \
  --user tensorflow \
  tensorflow_gpu/build/ubuntu1604:1.2 \
  /bin/bash --login /home/tensorflow/build.sh

docker cp tensorflow_gpu_1.2:/home/tensorflow/$TF_WHEEL .

docker rm tensorflow_gpu_1.2
