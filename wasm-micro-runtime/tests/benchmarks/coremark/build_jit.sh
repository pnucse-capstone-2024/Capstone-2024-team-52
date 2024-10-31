#!/bin/bash

PLATFORM=$(uname -s | tr A-Z a-z)

if [ ! -d coremark ]; then
    git clone https://github.com/eembc/coremark.git
fi

cd coremark

echo "Build coremark with gcc .."
gcc -O3 -Iposix -I. -DFLAGS_STR=\""-O3 -DPERFORMANCE_RUN=1  -lrt"\" \
        -DITERATIONS=400000 -DSEED_METHOD=SEED_VOLATILE -DPERFORMANCE_RUN=1 \
        core_list_join.c core_main.c core_matrix.c core_state.c \
        core_util.c posix/core_portme.c \
        -o ../coremark.exe -lrt

echo "Build coremark with wasi-sdk .."
/opt/wasi-sdk/bin/clang -O3 -Iposix -I. -DFLAGS_STR=\""-O3 -DPERFORMANCE_RUN=1"\" \
        -Wl,--export=main \
        -DITERATIONS=400000 -DSEED_METHOD=SEED_VOLATILE -DPERFORMANCE_RUN=1 \
        -Wl,--allow-undefined \
        core_list_join.c core_main.c core_matrix.c core_state.c \
        core_util.c posix/core_portme.c \
        -o ../coremark.wasm

cd ..

echo "Done building. Now run with iwasm in JIT mode."
../../../product-mini/platforms/linux/iwasm --llvm-jit coremark.wasm
