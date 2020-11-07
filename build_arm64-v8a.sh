#!/bin/bash
# start building...
cmake -H"./" -B"./build_arm64-v8a" -G Ninja  \
    -DANDROID_ABI=arm64-v8a \
    -DANDROID_PLATFORM=android-29 \
    -DANDROID_NDK=${HOME}/Android/Sdk/ndk/21.3.6528147 \
    -DCMAKE_TOOLCHAIN_FILE=${HOME}/Android/Sdk/ndk/21.3.6528147/build/cmake/android.toolchain.cmake \
    -DANDROID_TOOLCHAIN=clang \
    -DCMAKE_RUNTIME_OUTPUT_DIRECTORY="./bin/arm64-v8a" \
    -DCMAKE_BUILD_TYPE=Release \
    ..

cd build_arm64-v8a
ninja -j16
