#!/bin/bash
set -eu

rm -rf ~/tensorflow-0.10

git clone https://github.com/tensorflow/tensorflow.git -b r0.10 ~/tensorflow-0.10

cd ~/tensorflow-0.10

export PYTHON_BIN_PATH=/usr/bin/python
export TF_NEED_GCP=0
export TF_NEED_CUDA=1
export GCC_HOST_COMPILER_PATH=/usr/bin/gcc
export TF_CUDA_VERSION=8.0
export CUDA_TOOLKIT_PATH=/usr/local/cuda-8.0
export TF_CUDNN_VERSION=5
export CUDNN_INSTALL_PATH=/usr/local/cuda-8.0
export TF_CUDA_COMPUTE_CAPABILITIES=3.0
./configure

bazel build -j 4 -c opt --config=cuda //tensorflow/tools/pip_package:build_pip_package

bazel-bin/tensorflow/tools/pip_package/build_pip_package $HOME

mv ~/tensorflow-0.10.0-py2-none-{any,linux_x86_64}.whl
