#!/bin/bash
# start building...
cmake -H"./" -B"./build_armeabi-v7a" -G Ninja  \
    -DANDROID_ABI=armeabi-v7a \
    -DANDROID_PLATFORM=android-29 \
    -DANDROID_NDK=${HOME}/Android/Sdk/ndk/21.3.6528147 \
    -DCMAKE_TOOLCHAIN_FILE=${HOME}/Android/Sdk/ndk/21.3.6528147/build/cmake/android.toolchain.cmake \
    -DANDROID_TOOLCHAIN=clang \
    -DCMAKE_RUNTIME_OUTPUT_DIRECTORY="./bin/armeabi-v7a" \
    -DCMAKE_BUILD_TYPE=Release \
    ..

cd build_armeabi-v7a
ninja -j16
