#!/bin/bash

# Copyright (C) 2019 Intel Corporation.  All rights reserved.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

PLATFORM=$(uname -s | tr A-Z a-z)

OUT_DIR=$PWD/out
POLYBENCH_CASES="datamining linear-algebra medley stencils"

if [ ! -d PolyBenchC-4.2.1 ]; then
    git clone https://github.com/MatthiasJReisinger/PolyBenchC-4.2.1.git
fi

mkdir -p ${OUT_DIR}

cd PolyBenchC-4.2.1

for case in $POLYBENCH_CASES
do
    files=`find ${case} -name "*.c"`
    for file in ${files}
    do
        file_name=${file##*/}

        # Skip Nussinov.orig.c
        if [[ ${file_name} == "Nussinov.orig.c" ]]; then
            continue
        fi

        echo "Build ${file_name%.*}.wasm"
        /opt/wasi-sdk/bin/clang -O3 -I utilities -I ${file%/*}      \
            utilities/polybench.c ${file}                       \
            -Wl,--export=__heap_base -Wl,--export=__data_end    \
            -Wl,--export=malloc -Wl,--export=free               \
            -DPOLYBENCH_TIME -o ${OUT_DIR}/${file_name%.*}.wasm \
            -D_WASI_EMULATED_PROCESS_CLOCKS

        # Here, instead of AOT compilation, just leave the .wasm file for JIT execution
        echo "${file_name%.*}.wasm is ready for JIT execution"
    done
done

cd ..

echo "Done"

