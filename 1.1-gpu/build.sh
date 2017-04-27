#!/bin/bash
set -eu

rm -rf ~/tensorflow-1.1

git clone https://github.com/tensorflow/tensorflow.git -b r1.1 --depth 1 ~/tensorflow-1.1

cd ~/tensorflow-1.1

export PYTHON_BIN_PATH=/usr/bin/python
export TF_ENABLE_XLA=1
export TF_NEED_JEMALLOC=1
export TF_NEED_GCP=0
export TF_NEED_HDFS=1
export TF_NEED_OPENCL=0
export TF_NEED_CUDA=1
export GCC_HOST_COMPILER_PATH=/usr/bin/gcc
export TF_CUDA_VERSION=8.0
export CUDA_TOOLKIT_PATH=/usr/local/cuda-8.0
export TF_CUDNN_VERSION=5
export CUDNN_INSTALL_PATH=/usr/local/cuda-8.0
export TF_CUDA_COMPUTE_CAPABILITIES=3.0,3.5
echo "/usr/lib/python3/dist-packages" | ./configure

bazel build -j 4 -c opt --copt=-march=native --config=cuda //tensorflow/tools/pip_package:build_pip_package

bazel-bin/tensorflow/tools/pip_package/build_pip_package $HOME

mv ~/tensorflow{,-gpu}-1.1.0-cp35-cp35m-linux_x86_64.whl
