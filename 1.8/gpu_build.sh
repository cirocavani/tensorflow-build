#!/bin/bash
set -eu

cd ~/tensorflow

bazel build -j 4 \
    --config=opt \
    --copt=-march=native \
    --config=cuda \
    --config=monolithic \
    //tensorflow/tools/pip_package:build_pip_package

bazel-bin/tensorflow/tools/pip_package/build_pip_package $BUILD_MOUNT --gpu

echo "TensorFlow build done!"
