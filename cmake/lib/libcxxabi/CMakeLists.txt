cmake_minimum_required(VERSION 3.14.2)

project(libcxxabi)

set(LIBCXXABI ${AOSP}/external/libcxxabi)

# libcxxabi src files
set(LIBCXXABI_SRC_FILES
    ${LIBCXXABI}/src/abort_message.cpp
    ${LIBCXXABI}/src/cxa_aux_runtime.cpp
    ${LIBCXXABI}/src/cxa_default_handlers.cpp
    ${LIBCXXABI}/src/cxa_demangle.cpp
    ${LIBCXXABI}/src/cxa_exception.cpp
    ${LIBCXXABI}/src/cxa_exception_storage.cpp
    ${LIBCXXABI}/src/cxa_guard.cpp
    ${LIBCXXABI}/src/cxa_handlers.cpp
    ${LIBCXXABI}/src/cxa_personality.cpp
    ${LIBCXXABI}/src/cxa_thread_atexit.cpp
    ${LIBCXXABI}/src/cxa_unexpected.cpp
    ${LIBCXXABI}/src/cxa_vector.cpp
    ${LIBCXXABI}/src/cxa_virtual.cpp
    ${LIBCXXABI}/src/fallback_malloc.cpp
    ${LIBCXXABI}/src/private_typeinfo.cpp
    ${LIBCXXABI}/src/stdlib_exception.cpp
    ${LIBCXXABI}/src/stdlib_new_delete.cpp
    ${LIBCXXABI}/src/stdlib_stdexcept.cpp
    ${LIBCXXABI}/src/stdlib_typeinfo.cpp
    )

set(CMAKE_CXX_FLAGS "${GLOBAL_CXX_FLAGS} -std=c++14 -frtti -fexceptions -Wextra -Wno-unused-function -Wno-implicit-fallthrough -DHAVE___CXA_THREAD_ATEXIT_IMPL")

add_library(c++abi ${LIBCXXABI_SRC_FILES})

target_link_libraries(c++abi)
