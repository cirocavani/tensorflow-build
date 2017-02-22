#!/bin/bash
set -eu

cd `dirname "$0"`

if [ ! -f build_deps/cudnn-8.0-linux-x64-v5.1.tgz ]; then
    echo "Necessário cuDNN 5.1 para Cuda 8.0."
    echo "https://developer.nvidia.com/rdp/cudnn-download"
    exit 1
fi

if [ ! -f build_deps/cuda_8.0.61_375.26_linux-run ]; then
    curl -k -L \
        https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run \
        -o build_deps/cuda_8.0.61_375.26_linux-run
fi

if [ ! -f build_deps/jdk-8u121-linux-x64.tar.gz ]; then
    curl -k -L \
        -H "Cookie: oraclelicense=accept-securebackup-cookie" \
        http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.tar.gz \
        -o build_deps/jdk-8u121-linux-x64.tar.gz
fi

if [ ! -f build_deps/bazel-0.4.4-installer-linux-x86_64.sh ]; then
    curl -k -L \
        https://github.com/bazelbuild/bazel/releases/download/0.4.4/bazel-0.4.4-installer-linux-x86_64.sh \
        -o build_deps/bazel-0.4.4-installer-linux-x86_64.sh
fi

chmod +x build_deps/cuda_8.0.61_375.26_linux-run
chmod +x build_deps/bazel-0.4.4-installer-linux-x86_64.sh
