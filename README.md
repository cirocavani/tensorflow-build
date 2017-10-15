# Build do TensorFlow

Build do TensorFlow Master, 1.4 e 1.3 no Docker com Ubuntu 16.04, GCC 5.4, Python 3.6, Cuda 8.0 e cuDNN 6.0.

(referência para o TensorFlow 0.10)

http://cirocavani.github.io/post/compilacao-do-tensorflow-0.10-para-linux-com-gpu/

...

## Setup

Download manual necessário:

* `build_deps/cudnn-8.0-linux-x64-v6.0.tgz`: cuDNN 6.0 para Cuda 8.0 [ [Download](https://developer.nvidia.com/rdp/cudnn-download) ]

## Builds

*  `master-gpu/run.sh`: constrói pacote `tensorflow_gpu-1.5.0a0-cp36-cp36m-linux_x86_64.whl`
*  `master-cpu/run.sh`: constrói pacote `tensorflow-1.5.0a0-cp36-cp36m-linux_x86_64.whl`
*  `1.4-gpu/run.sh`: constrói pacote `tensorflow_gpu-1.4.0rc1-cp36-cp36m-linux_x86_64.whl`
*  `1.4-cpu/run.sh`: constrói pacote `tensorflow-1.4.0rc1-cp36-cp36m-linux_x86_64.whl`
*  `1.3-gpu/run.sh`: constrói pacote `tensorflow_gpu-1.3.1-cp36-cp36m-linux_x86_64.whl`
*  `1.3-cpu/run.sh`: constrói pacote `tensorflow-1.3.1-cp36-cp36m-linux_x86_64.whl`

## Install

```sh
# Python install
curl -k -L -O https://repo.continuum.io/miniconda/Miniconda3-4.3.21-Linux-x86_64.sh
bash Miniconda3-4.3.21-Linux-x86_64.sh -b -f -p tensorflow-gpu
tensorflow-gpu/bin/conda update --all

# TensorFlow install
tensorflow-gpu/bin/pip install tensorflow_gpu-1.3.1-cp36-cp36m-linux_x86_64.whl

tensorflow-gpu/bin/python -c \
'import tensorflow as tf; print(tf.__version__); print(tf.Session().run(tf.constant("Hello, World!")))'
#> 1.3.1
#> b'Hello, World!'
```
