#!/bin/bash
set -eu

cd `dirname "$0"`/..

rm -rf tensorflow-1.2.0rc0-cp35-cp35m-linux_x86_64.whl

./setup.sh

docker build -t tensorflow_cpu/build/ubuntu1604:1.2 -f 1.2-cpu/Dockerfile .

docker run -t \
  --name tensorflow_cpu_1.2 \
  --user tensorflow \
  tensorflow_cpu/build/ubuntu1604:1.2 \
  /bin/bash --login /home/tensorflow/build.sh

docker cp \
  tensorflow_cpu_1.2:/home/tensorflow/tensorflow-1.2.0rc0-cp35-cp35m-linux_x86_64.whl \
  .

docker rm tensorflow_cpu_1.2
