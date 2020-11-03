cmake_minimum_required(VERSION 3.14.2)

project(libbuildversion)

set(LIBUILDVERSION ${AOSP}/build/soong/cc/libbuildversion)


set(LIBUILDVERSION_SRC_FILES
    ${LIBUILDVERSION}/libbuildversion.cpp
    )

include_directories(
    ${libbuildversion_headers}
    )

set(CMAKE_CXX_FLAGS "${GLOBAL_CXX_FLAGS} -fvisibility=hidden")

add_library(buildversion STATIC ${LIBUILDVERSION_SRC_FILES})
target_link_libraries(buildversion)
