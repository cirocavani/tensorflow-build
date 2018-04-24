#!/bin/bash
set -eu

cd ~/tensorflow

bazel build -j 4 \
    --config=opt \
    --copt=-march=native \
    //tensorflow/tools/pip_package:build_pip_package

bazel-bin/tensorflow/tools/pip_package/build_pip_package $BUILD_MOUNT

echo "TensorFlow build done!"
