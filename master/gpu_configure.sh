#!/bin/bash
set -eu

cd ~/tensorflow

python tensorflow/tools/ci_build/update_version.py --version 1.9.0-alpha

export PYTHON_BIN_PATH=/opt/conda/bin/python
export CC_OPT_FLAGS="-march=native"
export TF_NEED_JEMALLOC=1
export TF_ENABLE_XLA=1

export TF_NEED_CUDA=1
export TF_CUDA_CLANG=0
export GCC_HOST_COMPILER_PATH=/usr/bin/gcc
export TF_CUDA_VERSION=9.1
export CUDA_TOOLKIT_PATH=/usr/local/cuda-9.1
export TF_CUDNN_VERSION=7
export CUDNN_INSTALL_PATH=/usr/local/cuda-9.1
export TF_CUDA_COMPUTE_CAPABILITIES=3.5
export TF_NCCL_VERSION=1.3

export TF_NEED_GDR=0
export TF_NEED_VERBS=0
export TF_NEED_GCP=0
export TF_NEED_HDFS=0
export TF_NEED_S3=0
export TF_NEED_OPENCL_SYCL=0
export TF_NEED_COMPUTECPP=0
export TF_NEED_OPENCL=0
export TF_NEED_MPI=0
export TF_SET_ANDROID_WORKSPACE=0
export TF_NEED_KAFKA=0
export TF_NEED_TENSORRT=0
export TF_DOWNLOAD_CLANG=0

echo "/opt/conda/lib/python3.6/site-packages" | ./configure

echo "TensorFlow configure done!"
