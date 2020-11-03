cmake_minimum_required(VERSION 3.14.2)

project(libpng)

set(LIBPNG ${AOSP}/external/libpng)

set(LIBPNG_SRC_FILES
    ${LIBPNG}/example.c
    ${LIBPNG}/pngtest.c
    ${LIBPNG}/png.c
    ${LIBPNG}/pngerror.c
    ${LIBPNG}/pngget.c
    ${LIBPNG}/pngmem.c
    ${LIBPNG}/pngpread.c
    ${LIBPNG}/pngread.c
    ${LIBPNG}/pngrio.c
    ${LIBPNG}/pngrtran.c
    ${LIBPNG}/pngrutil.c
    ${LIBPNG}/pngset.c
    ${LIBPNG}/pngtrans.c
    ${LIBPNG}/pngwio.c
    ${LIBPNG}/pngwrite.c
    ${LIBPNG}/pngwtran.c
    ${LIBPNG}/pngwutil.c
    ${LIBPNG}/arm/arm_init.c
    ${LIBPNG}/arm/filter_neon.S
    ${LIBPNG}/arm/filter_neon_intrinsics.c
    ${LIBPNG}/arm/palette_neon_intrinsics.c
    )

include_directories(
    ${libpng_headers}
    ${zlib_headers}
    )

set(CMAKE_CXX_FLAGS "${GLOBAL_CXX_FLAGS} -Wall -Werror -Wno-unused-parameter")

add_library(png STATIC ${LIBPNG_SRC_FILES})
target_link_libraries(png)
