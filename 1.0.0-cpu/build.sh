#!/bin/bash
set -eu

rm -rf ~/tensorflow-1.0

git clone https://github.com/tensorflow/tensorflow.git -b r1.0 --depth 1 ~/tensorflow-1.0

cd ~/tensorflow-1.0

export PYTHON_BIN_PATH=/usr/bin/python
export CC_OPT_FLAGS="-march=native"
export TF_ENABLE_XLA=0
export TF_NEED_JEMALLOC=1
export TF_NEED_GCP=0
export TF_NEED_HDFS=1
export TF_NEED_OPENCL=0
export TF_NEED_CUDA=0
echo "/usr/lib/python3/dist-packages" | ./configure

bazel build -j 4 -c opt //tensorflow/tools/pip_package:build_pip_package

bazel-bin/tensorflow/tools/pip_package/build_pip_package $HOME

mv ~/tensorflow{,-cpu}-1.0.0-cp35-cp35m-linux_x86_64.whl
