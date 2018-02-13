# Build do TensorFlow

Build do TensorFlow Master, 1.6 e 1.5 no Docker com Ubuntu 16.04, GCC 5.4, Python 3.6, CUDA 9.1 e cuDNN 7.0.

(referência para o TensorFlow 0.10)

http://cirocavani.github.io/post/compilacao-do-tensorflow-0.10-para-linux-com-gpu/

...

## Setup

Download manual necessário:

* `_deps/cudnn-9.1-linux-x64-v7.tgz`: cuDNN 7.0 para CUDA 9.1 [ [Download](https://developer.nvidia.com/rdp/cudnn-download) ]

## Builds

*  `./run.sh master gpu`: constrói pacote `master-gpu/tensorflow_gpu-1.7.0a0-cp36-cp36m-linux_x86_64.whl`
*  `./run.sh master cpu`: constrói pacote `master-cpu/tensorflow-1.7.0a0-cp36-cp36m-linux_x86_64.whl`
*  `./run.sh 1.6 gpu`: constrói pacote `1.6-gpu/tensorflow_gpu-1.6.0rc0-cp36-cp36m-linux_x86_64.whl`
*  `./run.sh 1.6 cpu`: constrói pacote `1.6-cpu/tensorflow-1.6.0rc0-cp36-cp36m-linux_x86_64.whl`
*  `./run.sh 1.5 gpu`: constrói pacote `1.5-gpu/tensorflow_gpu-1.5.0-cp36-cp36m-linux_x86_64.whl`
*  `./run.sh 1.5 cpu`: constrói pacote `1.5-cpu/tensorflow-1.5.0-cp36-cp36m-linux_x86_64.whl`

## Install

```sh
# Python install
curl -k -L -O https://repo.continuum.io/miniconda/Miniconda3-4.3.31-Linux-x86_64.sh
bash Miniconda3-4.3.31-Linux-x86_64.sh -b -f -p tensorflow-gpu
tensorflow-gpu/bin/conda update -y -q --all

# TensorFlow install
tensorflow-gpu/bin/pip install 1.5-gpu/tensorflow_gpu-1.5.0-cp36-cp36m-linux_x86_64.whl

tensorflow-gpu/bin/python -c \
'import tensorflow as tf; print(tf.__version__); print(tf.Session().run(tf.constant("Hello, World!")))'
#> 1.5.0
#> b'Hello, World!'
```
