#!/bin/bash
# start building...
mkdir build && cd build
# settings the ndk toolchain
TOOLCHAIN=/home/mrikso/Android/Sdk/ndk/21.3.6528147/toolchains/llvm/prebuilt/linux-x86_64

cmake -G 'Ninja' \
    -DCMAKE_C_COMPILER=$TOOLCHAIN/bin/armv7a-linux-androideabi29-clang \
    -DCMAKE_CXX_COMPILER=$TOOLCHAIN/bin/armv7a-linux-androideabi29-clang++ \
    -DCMAKE_SYSROOT=$TOOLCHAIN/sysroot \
    -DCMAKE_BUILD_TYPE=Release \
    ..

ninja -j16