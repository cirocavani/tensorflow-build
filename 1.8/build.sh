#!/bin/bash
set -eu

cd $(dirname "$0")

TF_PROC=$1

./download.sh
./${TF_PROC}_configure.sh
./${TF_PROC}_build.sh
