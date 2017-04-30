#!/bin/bash
set -eu

rm -rf ~/tensorflow-master

git clone https://github.com/tensorflow/tensorflow.git --depth 1 ~/tensorflow-master

cd ~/tensorflow-master

tensorflow/tools/ci_build/update_version.sh 1.2.0-alpha

export PYTHON_BIN_PATH=/usr/bin/python
export CC_OPT_FLAGS="-march=native"
export TF_ENABLE_XLA=0
export TF_NEED_VERBS=0
export TF_NEED_JEMALLOC=1
export TF_NEED_GCP=0
export TF_NEED_HDFS=1
export TF_NEED_OPENCL=0
export TF_NEED_CUDA=0
echo "/usr/lib/python3/dist-packages" | ./configure

bazel build -j 4 -c opt --copt=-march=native //tensorflow/tools/pip_package:build_pip_package

bazel-bin/tensorflow/tools/pip_package/build_pip_package $HOME