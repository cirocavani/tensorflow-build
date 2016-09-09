# Build do TensorFlow

Build do TensorFlow 0.10 no Docker com Ubuntu 16.04, GCC 5.4, Python 2.7, Cuda 8.0 (RC) e cuDNN 5.1.

http://cirocavani.github.io/post/compilacao-do-tensorflow-0.10-para-linux-com-gpu/

Download manual necessário:

* `build_deps/cuda_8.0.27_linux.run`: intalador do Cuda 8.0 RC
* `build_deps/cuda_8.0.27.1_linux.run`: patch do Cuda 8.0 RC para GCC 5.4
* `build_deps/cudnn-8.0-linux-x64-v5.1.tgz`: cuDNN 5.1 para Cuda 8.0

Procedimento (script `run.sh`):

    ./setup.sh

    docker build -t tensorflow_build/ubuntu1604:0.10 .

    docker run -t \
      --name tensorflow_build \
      --user tensorflow \
      tensorflow_build/ubuntu1604:0.10 \
      /bin/bash --login /home/tensorflow/build.sh

    docker cp \
      tensorflow_build:/home/tensorflow/tensorflow-0.10.0-py2-none-linux_x86_64.whl \
      .

    docker rm tensorflow_build
