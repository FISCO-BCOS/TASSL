#!/bin/sh

git clone https://github.com/FISCO-BCOS/TASSL-1.1.1b.git
cd TASSL-1.1.1b/

# config project with benchmark code enabled
./config CFLAGS='-DSM2_BENCHMARK'
# uncomment for multithread benchmark
# ./config CFLAGS='-DSM2_BENCHMARK -DSM2_BENCHMARK_PARALLEL'

make

# add current path to environment variable. exit current shell session to remove it after benchmark
export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH
./test/sm2_benchmark_test
