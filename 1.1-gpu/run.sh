#!/bin/bash
set -eu

cd `dirname "$0"`/..

rm -rf tensorflow_gpu-1.1.0-cp35-cp35m-linux_x86_64.whl

./setup.sh

docker build -t tensorflow_gpu/build/ubuntu1604:1.1 -f 1.1-gpu/Dockerfile .

docker run -t \
  --name tensorflow_gpu_1.1 \
  --user tensorflow \
  tensorflow_gpu/build/ubuntu1604:1.1 \
  /bin/bash --login /home/tensorflow/build.sh

docker cp \
  tensorflow_gpu_1.1:/home/tensorflow/tensorflow_gpu-1.1.0-cp35-cp35m-linux_x86_64.whl \
  .

docker rm tensorflow_gpu_1.1
