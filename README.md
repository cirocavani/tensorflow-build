# Build do TensorFlow

Build do TensorFlow Master, 1.5 e 1.4 no Docker com Ubuntu 16.04, GCC 5.4, Python 3.6, Cuda 8.0 e cuDNN 6.0.

(referência para o TensorFlow 0.10)

http://cirocavani.github.io/post/compilacao-do-tensorflow-0.10-para-linux-com-gpu/

...

## Setup

Download manual necessário:

* `_deps/cudnn-8.0-linux-x64-v6.0.tgz`: cuDNN 6.0 para Cuda 8.0 [ [Download](https://developer.nvidia.com/rdp/cudnn-download) ]

## Builds

*  `./run.sh master gpu`: constrói pacote `master-gpu/tensorflow_gpu-1.6.0a0-cp36-cp36m-linux_x86_64.whl`
*  `./run.sh master cpu`: constrói pacote `master-cpu/tensorflow-1.6.0a0-cp36-cp36m-linux_x86_64.whl`
*  `./run.sh 1.5 gpu`: constrói pacote `1.5-gpu/tensorflow_gpu-1.5.0-cp36-cp36m-linux_x86_64.whl`
*  `./run.sh 1.5 cpu`: constrói pacote `1.5-cpu/tensorflow-1.5.0-cp36-cp36m-linux_x86_64.whl`
*  `./run.sh 1.4 gpu`: constrói pacote `1.4-gpu/tensorflow_gpu-1.4.1-cp36-cp36m-linux_x86_64.whl`
*  `./run.sh 1.4 cpu`: constrói pacote `1.4-cpu/tensorflow-1.4.1-cp36-cp36m-linux_x86_64.whl`

## Install

```sh
# Python install
curl -k -L -O https://repo.continuum.io/miniconda/Miniconda3-4.3.30-Linux-x86_64.sh
bash Miniconda3-4.3.30-Linux-x86_64.sh -b -f -p tensorflow-gpu
tensorflow-gpu/bin/conda update -y -q --all

# TensorFlow install
tensorflow-gpu/bin/pip install 1.4-gpu/tensorflow_gpu-1.4.1-cp36-cp36m-linux_x86_64.whl

tensorflow-gpu/bin/python -c \
'import tensorflow as tf; print(tf.__version__); print(tf.Session().run(tf.constant("Hello, World!")))'
#> 1.4.1
#> b'Hello, World!'
```
