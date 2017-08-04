#!/bin/bash
set -eu

cd $(dirname "$0")

if [ ! -f build_deps/cudnn-8.0-linux-x64-v6.0.tgz ]; then
    echo "Necessário cuDNN 6.0 para Cuda 8.0."
    echo "https://developer.nvidia.com/rdp/cudnn-download"
    exit 1
fi

if [ ! -f build_deps/cuda_8.0.61_375.26_linux-run ]; then
    curl -k -L \
        https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run \
        -o build_deps/cuda_8.0.61_375.26_linux-run
fi

if [ ! -f build_deps/jdk-8u131-linux-x64.tar.gz ]; then
    curl -k -L \
        -H "Cookie: oraclelicense=accept-securebackup-cookie" \
        http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz \
        -o build_deps/jdk-8u131-linux-x64.tar.gz
fi

if [ ! -f build_deps/bazel-0.5.3-installer-linux-x86_64.sh ]; then
    curl -k -L \
        https://github.com/bazelbuild/bazel/releases/download/0.5.3/bazel-0.5.3-installer-linux-x86_64.sh \
        -o build_deps/bazel-0.5.3-installer-linux-x86_64.sh
fi

if [ ! -f build_deps/Miniconda3-4.3.21-Linux-x86_64.sh ]; then
    curl -k -L \
        https://repo.continuum.io/miniconda/Miniconda3-4.3.21-Linux-x86_64.sh \
        -o build_deps/Miniconda3-4.3.21-Linux-x86_64.sh
fi

chmod +x build_deps/cuda_8.0.61_375.26_linux-run
chmod +x build_deps/bazel-0.5.3-installer-linux-x86_64.sh
chmod +x build_deps/Miniconda3-4.3.21-Linux-x86_64.sh
