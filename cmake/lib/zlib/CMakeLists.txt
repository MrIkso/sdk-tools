cmake_minimum_required(VERSION 3.14.2)

project(zlib)

set(ZLIB ${AOSP}/external/zlib)

set(ZLIB_SRC_FILES
    ${ZLIB}/adler32_simd.c
    ${ZLIB}/cpu_features.c
    ${ZLIB}/crc32_simd.c
    ${ZLIB}/adler32.c
    ${ZLIB}/compress.c
    ${ZLIB}/crc32.c
    ${ZLIB}/deflate.c
    ${ZLIB}/gzclose.c
    ${ZLIB}/gzlib.c
    ${ZLIB}/gzread.c
    ${ZLIB}/gzwrite.c
    ${ZLIB}/infback.c
    ${ZLIB}/inffast.c
    ${ZLIB}/inflate.c
    ${ZLIB}/inftrees.c
    ${ZLIB}/trees.c
    ${ZLIB}/uncompr.c
    ${ZLIB}/zutil.c
    ${AOSP}/prebuilts/ndk/r21/sources/android/cpufeatures/cpu-features.c
    )

# android-11/prebuilts/ndk/r21/sources/android/cpufeatures/cpu-features.c
list(APPEND ZLIB_SRC_FILES ${AOSP}/prebuilts/ndk/r21/sources/android/cpufeatures/cpu-features.c)

include_directories(
	${zlib_headers}
	${cpu_features_headers}
	${AOSP}/prebuilts/ndk/r21/sources/android/cpufeatures
	)

set(CMAKE_C_FLAGS " \
    ${GLOBAL_C_FLAGS} \
    -O3 \
    -DHAVE_HIDDEN \
    -DZLIB_CONST \
    -Wall \
    -Werror \
    -Wno-unused-variable \
    -Wno-unused-function \
    ")

add_library(z STATIC ${ZLIB_SRC_FILES})
target_link_libraries(z)
