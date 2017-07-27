#!/bin/bash
set -eu

rm -rf ~/tensorflow

git clone https://github.com/tensorflow/tensorflow.git -b r1.3 --depth 1 ~/tensorflow

cd ~/tensorflow

export PYTHON_BIN_PATH=/opt/conda/bin/python
export CC_OPT_FLAGS="-march=native"
export TF_ENABLE_XLA=1
export TF_NEED_VERBS=0
export TF_NEED_JEMALLOC=1
export TF_NEED_GCP=0
export TF_NEED_HDFS=0
export TF_NEED_OPENCL=0
export TF_NEED_CUDA=1
export TF_CUDA_CLANG=0
export GCC_HOST_COMPILER_PATH=/usr/bin/gcc
export TF_CUDA_VERSION=8.0
export CUDA_TOOLKIT_PATH=/usr/local/cuda-8.0
export TF_CUDNN_VERSION=6
export CUDNN_INSTALL_PATH=/usr/local/cuda-8.0
export TF_CUDA_COMPUTE_CAPABILITIES=3.5
export TF_NEED_MKL=0
export TF_NEED_MPI=0
echo "/opt/conda/lib/python3.6/site-packages" | ./configure

bazel build -j 4 -c opt --copt=-march=native --config=cuda //tensorflow/tools/pip_package:build_pip_package

bazel-bin/tensorflow/tools/pip_package/build_pip_package $HOME --gpu