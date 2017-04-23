# Build do TensorFlow

Build do TensorFlow 1.1 e 1.0.1 no Docker com Ubuntu 16.04, GCC 5.4, Python 3.5, Cuda 8.0 e cuDNN 5.1.

(referência para o TensorFlow 0.10)

http://cirocavani.github.io/post/compilacao-do-tensorflow-0.10-para-linux-com-gpu/

...

Download manual necessário:

* `build_deps/cudnn-8.0-linux-x64-v5.1.tgz`: cuDNN 5.1 para Cuda 8.0 [ [Download](https://developer.nvidia.com/rdp/cudnn-download) ]

Procedimento:

*  `1.1-gpu/run.sh`: constrói pacote `tensorflow-gpu-1.1.0-cp35-cp35m-linux_x86_64.whl`
*  `1.1-cpu/run.sh`: constrói pacote `tensorflow-cpu-1.1.0-cp35-cp35m-linux_x86_64.whl`
*  `1.0-gpu/run.sh`: constrói pacote `tensorflow-gpu-1.0.1-cp35-cp35m-linux_x86_64.whl`
*  `1.0-cpu/run.sh`: constrói pacote `tensorflow-cpu-1.0.1-cp35-cp35m-linux_x86_64.whl`
