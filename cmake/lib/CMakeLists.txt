cmake_minimum_required(VERSION 3.14.2)

project(lib)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)

# check host arch
execute_process(COMMAND uname -m 
    COMMAND tr -d '\n' 
    OUTPUT_VARIABLE 
    HOST_ARCH
    )

# only support aarch64(arm64-v8a)
#if(HOST_ARCH STREQUAL "aarch64")
#    message(STATUS "host arch: ${HOST_ARCH}")
#else()
#    message(FATAL_ERROR "not support host arch: ${HOST_ARCH}")
#endif()


# load the Android.cmake
include(Android)

# check android api level
#check_android_api(ANDROID_API_LEVEL)

#if(ANDROID_API_LEVEL)
#    message(STATUS "Found __ANDROID_API__=${ANDROID_API_LEVEL}")
#    if(ANDROID_API_LEVEL LESS "26")
#         message(WARNING "Current API is less than 26, compilation may fail.")
#    endif()
#else()
#    message(WARNING "Can't find __ANDROID_API__ definition, please set the path of toolchain correctly.")
#endif()


# add subprojects
add_subdirectory(libcxx)
add_subdirectory(libcxxabi)

add_subdirectory(zlib)
add_subdirectory(expat)
add_subdirectory(libjsoncpp)
add_subdirectory(liblog)
add_subdirectory(libpng)
add_subdirectory(libutils)
add_subdirectory(libcutils)
add_subdirectory(libbase)
add_subdirectory(libziparchive)
add_subdirectory(libvndksupport)
add_subdirectory(libprocessgroup)
#билиотека для определения версии
add_subdirectory(libbuildversion)
#главная билиотека для aapt/aapt2
add_subdirectory(androidfw)
add_subdirectory(protobuf)
#для тестов
add_subdirectory(gtest)
