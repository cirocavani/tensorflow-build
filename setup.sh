#!/bin/bash
set -eu

cd $(dirname "$0")

if [ ! -f _deps/cudnn-8.0-linux-x64-v6.0.tgz ]; then
    echo "Necessário cuDNN 6.0 para Cuda 8.0."
    echo "https://developer.nvidia.com/rdp/cudnn-download"
    exit 1
fi

if [ ! -f _deps/cuda_8.0.61_375.26_linux-run ]; then
    curl -k -L \
        https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run \
        -o _deps/cuda_8.0.61_375.26_linux-run
    chmod +x _deps/cuda_8.0.61_375.26_linux-run
fi

if [ ! -f _deps/cuda_8.0.61.2_linux-run ]; then
    curl -k -L \
        https://developer.nvidia.com/compute/cuda/8.0/Prod2/patches/2/cuda_8.0.61.2_linux-run \
        -o _deps/cuda_8.0.61.2_linux-run
    chmod +x _deps/cuda_8.0.61.2_linux-run
fi

if [ ! -f _deps/jdk-8u152-linux-x64.tar.gz ]; then
    curl -k -L \
        -H "Cookie: oraclelicense=accept-securebackup-cookie" \
        http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/jdk-8u152-linux-x64.tar.gz \
        -o _deps/jdk-8u152-linux-x64.tar.gz
fi

if [ ! -f _deps/bazel-0.8.0-installer-linux-x86_64.sh ]; then
    curl -k -L \
        https://github.com/bazelbuild/bazel/releases/download/0.8.0/bazel-0.8.0-installer-linux-x86_64.sh \
        -o _deps/bazel-0.8.0-installer-linux-x86_64.sh
fi

if [ ! -f _deps/Miniconda3-4.3.30-Linux-x86_64.sh ]; then
    curl -k -L \
        https://repo.continuum.io/miniconda/Miniconda3-4.3.30-Linux-x86_64.sh \
        -o _deps/Miniconda3-4.3.30-Linux-x86_64.sh
fi
