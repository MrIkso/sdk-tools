cmake_minimum_required(VERSION 3.14.2)

project(libbase)

set(BASE ${AOSP}/system/core/base)

set(LIBBASE_SRC_FILES
    ${BASE}/abi_compatibility.cpp
    ${BASE}/chrono_utils.cpp
    ${BASE}/cmsg.cpp
    ${BASE}/file.cpp
    ${BASE}/liblog_symbols.cpp
    ${BASE}/logging.cpp
    ${BASE}/mapped_file.cpp
    ${BASE}/parsebool.cpp
    ${BASE}/parsenetaddress.cpp
    ${BASE}/process.cpp
    ${BASE}/properties.cpp
    ${BASE}/stringprintf.cpp
    ${BASE}/strings.cpp
    ${BASE}/threads.cpp
    ${BASE}/test_utils.cpp
    ${BASE}/errors_unix.cpp
    )


include_directories(
    ${liblog_headers}
    ${libbase_headers}
    )

set(CMAKE_C_FLAGS  " \
    -Wall \
    -Werror \
    -Wextra \
    -D_FILE_OFFSET_BITS=64 \
    ")

set(CMAKE_CXX_FLAGS " \
    ${GLOBAL_CXX_FLAGS} \
    -Wexit-time-destructors \
    ")

add_library(base STATIC ${LIBBASE_SRC_FILES})
target_link_libraries(base)
