#!/bin/bash

# 특정 명령어를 반복적으로 실행하는 스크립트
while true; do
    # 명령어 실행 및 출력 저장
    output=$(/usr/bin/time -f "real-%e-time" /home/grad/wamr/wasm-micro-runtime/product-mini/platforms/linux/iwasm --llvm-jit "./out/trmm.wasm" 2>&1)
    
    # 명령어 출력 출력
    echo "$output"
    

    # 출력에 "Command terminated by signal 11"이 있는지 확인
    if ! echo "$output" | grep -q "Command terminated by signal 11"; then
        echo "Terminated by signal 11, exiting..."
        break
    fi
done


