#!/bin/bash
set -eu

cd `dirname "$0"`

if [ ! -f build_deps/cudnn-8.0-linux-x64-v5.1.tgz ]; then
    echo "Necessário cuDNN 5.1 para Cuda 8.0."
    echo "https://developer.nvidia.com/rdp/cudnn-download"
    exit 1
fi

if [ ! -f build_deps/cuda_8.0.44_linux-run ]; then
    curl -k -L \
        https://developer.nvidia.com/compute/cuda/8.0/prod/local_installers/cuda_8.0.44_linux-run \
        -o build_deps/cuda_8.0.44_linux-run
fi

if [ ! -f build_deps/jdk-8u112-linux-x64.tar.gz ]; then
    curl -k -L \
        -H "Cookie: oraclelicense=accept-securebackup-cookie" \
        http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.tar.gz \
        -o build_deps/jdk-8u112-linux-x64.tar.gz
fi

if [ ! -f build_deps/bazel-0.4.0-installer-linux-x86_64.sh ]; then
    curl -k -L \
        https://github.com/bazelbuild/bazel/releases/download/0.4.0/bazel-0.4.0-installer-linux-x86_64.sh \
        -o build_deps/bazel-0.4.0-installer-linux-x86_64.sh
fi

chmod +x build_deps/cuda_8.0.44_linux-run
chmod +x build_deps/bazel-0.4.0-installer-linux-x86_64.sh
