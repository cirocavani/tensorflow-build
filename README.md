# TensorFlow Build

Build of TensorFlow Master, 1.8 and 1.7.1 on Docker with Ubuntu 16.04, GCC 5.4, Python 3.6, CUDA 9.1 and cuDNN 7.1.

(old build documentation for TensorFlow 0.10 in Portuguese)

http://cirocavani.github.io/post/compilacao-do-tensorflow-0.10-para-linux-com-gpu/

...

## Setup

Manual download required:

* `_deps/cudnn-9.1-linux-x64-v7.1.tgz`: cuDNN 7.1 for CUDA 9.1 [ [Download](https://developer.nvidia.com/rdp/cudnn-download) ]

```sh
./build_image.sh cpu
./build_image.sh gpu
```

## Builds

*  `./build_tensorflow.sh master gpu`: builds package `master/tensorflow_gpu-1.9.0a0-cp36-cp36m-linux_x86_64.whl`
*  `./build_tensorflow.sh master cpu`: builds package `master/tensorflow-1.9.0a0-cp36-cp36m-linux_x86_64.whl`
*  `./build_tensorflow.sh 1.8 gpu`: builds package `1.8/tensorflow_gpu-1.8.0-cp36-cp36m-linux_x86_64.whl`
*  `./build_tensorflow.sh 1.8 cpu`: builds package `1.8/tensorflow-1.8.0-cp36-cp36m-linux_x86_64.whl`
*  `./build_tensorflow.sh 1.7 gpu`: builds package `1.7/tensorflow_gpu-1.7.1-cp36-cp36m-linux_x86_64.whl`
*  `./build_tensorflow.sh 1.7 cpu`: builds package `1.7/tensorflow-1.7.1-cp36-cp36m-linux_x86_64.whl`

## Install

```sh
# Python install
curl -k -L -O https://repo.continuum.io/miniconda/Miniconda3-4.5.1-Linux-x86_64.sh
bash Miniconda3-4.5.1-Linux-x86_64.sh -b -f -p tensorflow-gpu
tensorflow-gpu/bin/conda update -y -q --all

# TensorFlow install
tensorflow-gpu/bin/pip install 1.8/tensorflow_gpu-1.8.0-cp36-cp36m-linux_x86_64.whl

tensorflow-gpu/bin/python -c \
'import tensorflow as tf; print(tf.__version__); print(tf.Session().run(tf.constant("Hello, World!")))'
#> 1.8.0
#> b'Hello, World!'
```
