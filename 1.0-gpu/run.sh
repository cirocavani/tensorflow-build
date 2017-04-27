#!/bin/bash
set -eu

cd `dirname "$0"`/..

rm -rf tensorflow-gpu-1.0.1-cp35-cp35m-linux_x86_64.whl

./setup.sh

docker build -t tensorflow_gpu/build/ubuntu1604:1.0 -f 1.0-gpu/Dockerfile .

docker run -t \
  --name tensorflow_gpu_1.0 \
  --user tensorflow \
  tensorflow_gpu/build/ubuntu1604:1.0 \
  /bin/bash --login /home/tensorflow/build.sh

docker cp \
  tensorflow_gpu_1.0:/home/tensorflow/tensorflow-gpu-1.0.1-cp35-cp35m-linux_x86_64.whl \
  .

docker rm tensorflow_gpu_1.0
