#!/bin/bash
set -eu

cd `dirname "$0"`

if [ ! -f build_deps/cuda_8.0.27_linux.run ]; then
  echo "Necessário intalador do Cuda 8.0 RC."
  echo "http://cirocavani.github.io/post/compilacao-do-tensorflow-0.10-para-linux-com-gpu/"
  exit 1
fi

if [ ! -f build_deps/cuda_8.0.27.1_linux.run ]; then
  echo "Necessário patch do Cuda 8.0 RC para GCC 5.4."
  echo "http://cirocavani.github.io/post/compilacao-do-tensorflow-0.10-para-linux-com-gpu/"
  exit 1
fi

if [ ! -f build_deps/cudnn-8.0-linux-x64-v5.1.tgz ]; then
  echo "Necessário cuDNN 5.1 para Cuda 8.0."
  echo "http://cirocavani.github.io/post/compilacao-do-tensorflow-0.10-para-linux-com-gpu/"
  exit 1
fi

if [ ! -f build_deps/jdk-8u102-linux-x64.tar.gz ]; then
  curl -k -L \
    -H "Cookie: oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.tar.gz \
    -o build_deps/jdk-8u102-linux-x64.tar.gz
fi

if [ ! -f build_deps/bazel-0.3.1-installer-linux-x86_64.sh ]; then
  curl -k -L \
    https://github.com/bazelbuild/bazel/releases/download/0.3.1/bazel-0.3.1-installer-linux-x86_64.sh \
    -o build_deps/bazel-0.3.1-installer-linux-x86_64.sh
fi

chmod +x build_deps/cuda_8.0.27_linux.run
chmod +x build_deps/cuda_8.0.27.1_linux.run
chmod +x build_deps/bazel-0.3.1-installer-linux-x86_64.sh
