#!/bin/bash
set -eu

rm -rf ~/tensorflow

git clone https://github.com/tensorflow/tensorflow.git -b r1.4 --depth 1 ~/tensorflow

cd ~/tensorflow

export PYTHON_BIN_PATH=/opt/conda/bin/python
export CC_OPT_FLAGS="-march=native"
export TF_ENABLE_XLA=0
export TF_NEED_GDR=0
export TF_NEED_VERBS=0
export TF_NEED_JEMALLOC=1
export TF_NEED_GCP=0
export TF_NEED_HDFS=0
export TF_NEED_S3=0
export TF_NEED_OPENCL=0
export TF_NEED_CUDA=0
export TF_NEED_MPI=0
echo "/opt/conda/lib/python3.6/site-packages" | ./configure

bazel build -j 4 -c opt --copt=-march=native //tensorflow/tools/pip_package:build_pip_package

bazel-bin/tensorflow/tools/pip_package/build_pip_package $HOME