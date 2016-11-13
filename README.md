# Build do TensorFlow

Build do TensorFlow 0.11 no Docker com Ubuntu 16.04, GCC 5.4, Python 2.7 ou 3.5, Cuda 8.0 e cuDNN 5.1.

(referência para o TensorFlow 0.10)

http://cirocavani.github.io/post/compilacao-do-tensorflow-0.10-para-linux-com-gpu/

...

Download manual necessário:

* `build_deps/cudnn-8.0-linux-x64-v5.1.tgz`: cuDNN 5.1 para Cuda 8.0

Procedimento:

*  `0.11/run.sh`: constrói pacote `tensorflow-0.11.0-py2-none-linux_x86_64.whl`
*  `0.11-py3/run.sh`: constrói pacote `tensorflow-0.11.0-py3-none-linux_x86_64.whl`
