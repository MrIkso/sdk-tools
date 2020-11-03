cmake_minimum_required(VERSION 3.14.2)

project(libcxx)

set(LIBCXX ${AOSP}/external/libcxx)

# libcxx src files
set(LIBCXX_SRC_FILES
    ${LIBCXX}/src/algorithm.cpp
    ${LIBCXX}/src/any.cpp
    ${LIBCXX}/src/bind.cpp
    ${LIBCXX}/src/charconv.cpp
    ${LIBCXX}/src/chrono.cpp
    ${LIBCXX}/src/condition_variable.cpp
    ${LIBCXX}/src/debug.cpp
    ${LIBCXX}/src/exception.cpp
    ${LIBCXX}/src/future.cpp
    ${LIBCXX}/src/hash.cpp
    ${LIBCXX}/src/ios.cpp
    ${LIBCXX}/src/iostream.cpp
    ${LIBCXX}/src/locale.cpp
    ${LIBCXX}/src/memory.cpp
    ${LIBCXX}/src/mutex.cpp
    ${LIBCXX}/src/new.cpp
    ${LIBCXX}/src/optional.cpp
    ${LIBCXX}/src/random.cpp
    ${LIBCXX}/src/regex.cpp
    ${LIBCXX}/src/shared_mutex.cpp
    ${LIBCXX}/src/stdexcept.cpp
    ${LIBCXX}/src/string.cpp
    ${LIBCXX}/src/strstream.cpp
    ${LIBCXX}/src/system_error.cpp
    ${LIBCXX}/src/thread.cpp
    ${LIBCXX}/src/typeinfo.cpp
    ${LIBCXX}/src/utility.cpp
    ${LIBCXX}/src/valarray.cpp
    ${LIBCXX}/src/variant.cpp
    ${LIBCXX}/src/vector.cpp
    )



# libc++experimental
set(C++_EXPERIMENTAL_SRC_FILES
    ${LIBCXX}/src/experimental/memory_resource.cpp
    )


# libc++fs
set(LIBC++FS_SRC_FILES
    ${LIBCXX}/src/filesystem/directory_iterator.cpp
    ${LIBCXX}/src/filesystem/operations.cpp
    )


set(TEST_SRC_FILES
    ${LIBCXX}/libcxx_test_template.cpp
    )


set(CMAKE_CXX_FLAGS  "${GLOBAL_CXX_FLAGS} -frtti -fexceptions -DLIBCXX_BUILDING_LIBCXXABI -D_LIBCPP_BUILDING_LIBRARY")

add_library(c++experimental ${C++_EXPERIMENTAL_SRC_FILES})
target_link_libraries(c++experimental)

add_library(c++fs ${LIBC++FS_SRC_FILES})
target_link_libraries(c++fs)

add_library(c++ STATIC ${LIBCXX_SRC_FILES})
target_link_libraries(c++)


add_executable(libcxx_test_template ${TEST_SRC_FILES})
target_link_libraries(libcxx_test_template c++experimental c++fs c++)
