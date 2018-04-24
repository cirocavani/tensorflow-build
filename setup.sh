#!/bin/bash
set -eu

cd $(dirname "$0")

if [ ! -f _deps/cudnn-9.1-linux-x64-v7.1.tgz ]; then
    echo "Required cuDNN 7.1 for CUDA 9.1."
    echo "https://developer.nvidia.com/rdp/cudnn-download"
    exit 1
fi

if [ ! -f _deps/cuda_9.1.85_387.26_linux ]; then
    curl -k -L \
        https://developer.nvidia.com/compute/cuda/9.1/Prod/local_installers/cuda_9.1.85_387.26_linux \
        -o _deps/cuda_9.1.85_387.26_linux
    chmod +x _deps/cuda_9.1.85_387.26_linux
fi

if [ ! -f _deps/cuda_9.1.85.1_linux ]; then
    curl -k -L \
        https://developer.nvidia.com/compute/cuda/9.1/Prod/patches/1/cuda_9.1.85.1_linux \
        -o _deps/cuda_9.1.85.1_linux
    chmod +x _deps/cuda_9.1.85.1_linux
fi

if [ ! -f _deps/cuda_9.1.85.2_linux ]; then
    curl -k -L \
        https://developer.nvidia.com/compute/cuda/9.1/Prod/patches/2/cuda_9.1.85.2_linux \
        -o _deps/cuda_9.1.85.2_linux
    chmod +x _deps/cuda_9.1.85.2_linux
fi

if [ ! -f _deps/cuda_9.1.85.3_linux ]; then
    curl -k -L \
        https://developer.nvidia.com/compute/cuda/9.1/Prod/patches/3/cuda_9.1.85.3_linux \
        -o _deps/cuda_9.1.85.3_linux
    chmod +x _deps/cuda_9.1.85.3_linux
fi

if [ ! -f _deps/bazel-0.11.0-installer-linux-x86_64.sh ]; then
    curl -k -L \
        https://github.com/bazelbuild/bazel/releases/download/0.11.0/bazel-0.11.0-installer-linux-x86_64.sh \
        -o _deps/bazel-0.11.0-installer-linux-x86_64.sh
fi

if [ ! -f _deps/Miniconda3-4.4.10-Linux-x86_64.sh ]; then
    curl -k -L \
        https://repo.continuum.io/miniconda/Miniconda3-4.4.10-Linux-x86_64.sh \
        -o _deps/Miniconda3-4.4.10-Linux-x86_64.sh
fi
