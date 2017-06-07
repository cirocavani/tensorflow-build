# Build do TensorFlow

Build do TensorFlow Master no Docker com Ubuntu 16.04, GCC 5.4, Python 3.6, Cuda 8.0 e cuDNN 5.1.

Build do TensorFlow 1.2, 1.1 e 1.0 no Docker com Ubuntu 16.04, GCC 5.4, Python 3.5, Cuda 8.0 e cuDNN 5.1.

(referência para o TensorFlow 0.10)

http://cirocavani.github.io/post/compilacao-do-tensorflow-0.10-para-linux-com-gpu/

...

## Setup

Download manual necessário:

* `build_deps/cudnn-8.0-linux-x64-v5.1.tgz`: cuDNN 5.1 para Cuda 8.0 [ [Download](https://developer.nvidia.com/rdp/cudnn-download) ]

## Builds

*  `master-gpu/run.sh`: constrói pacote `tensorflow_gpu-1.3.0a0-cp36-cp36m-linux_x86_64.whl`
*  `master-cpu/run.sh`: constrói pacote `tensorflow-1.3.0a0-cp36-cp36m-linux_x86_64.whl`
*  `1.2-gpu/run.sh`: constrói pacote `tensorflow_gpu-1.2.0rc2-cp35-cp35m-linux_x86_64.whl`
*  `1.2-cpu/run.sh`: constrói pacote `tensorflow-1.2.0rc2-cp35-cp35m-linux_x86_64.whl`
*  `1.1-gpu/run.sh`: constrói pacote `tensorflow_gpu-1.1.0-cp35-cp35m-linux_x86_64.whl`
*  `1.1-cpu/run.sh`: constrói pacote `tensorflow-1.1.0-cp35-cp35m-linux_x86_64.whl`
*  `1.0-gpu/run.sh`: constrói pacote `tensorflow_gpu-1.0.1-cp35-cp35m-linux_x86_64.whl`
*  `1.0-cpu/run.sh`: constrói pacote `tensorflow-1.0.1-cp35-cp35m-linux_x86_64.whl`

## Install

```sh
# Python install
curl -k -L -O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -f -p conda
conda/bin/conda update --all

# TensorFlow install
conda/bin/conda create -y -p tensorflow-gpu python=3.5
tensorflow-gpu/bin/pip install tensorflow_gpu-1.1.0-cp35-cp35m-linux_x86_64.whl

tensorflow-gpu/bin/python -c \
'import tensorflow as tf; print(tf.__version__); print(tf.Session().run(tf.constant("Hello, World!")))'
#> 1.1.0
#> b'Hello, World!'
```
