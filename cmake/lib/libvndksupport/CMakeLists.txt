cmake_minimum_required(VERSION 3.14.2)

project(libvndksupport)

set(LIBVNDKSUPPORT ${AOSP}/system/core/libvndksupport)

set(LIBVNDKSUPPORT_SRC_FILES
    ${LIBVNDKSUPPORT}/linker.cpp
    )

include_directories(
    ${libvndksupport_headers}
    ${liblog_headers}
    )

set(CMAKE_CXX_FLAGS "${GLOBAL_CXX_FLAGS}")

add_library(vndksupport STATIC ${LIBVNDKSUPPORT_SRC_FILES})
target_link_libraries(vndksupport)
