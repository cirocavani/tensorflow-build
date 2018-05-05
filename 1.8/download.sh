#!/bin/bash
set -eu

rm -rf ~/tensorflow

git clone https://github.com/tensorflow/tensorflow.git --depth 1 -b v1.8.0 ~/tensorflow

echo "TensorFlow download done!"
