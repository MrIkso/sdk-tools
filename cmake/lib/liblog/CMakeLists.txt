cmake_minimum_required(VERSION 3.14.2)

project(liblog)

set(LOG ${AOSP}/system/core/liblog)

# liblog src files
set(LIBLOG_SRC_FILES
${LOG}/log.cpp
   
    )

include_directories(
    ${liblog_headers}
    ${libbase_headers}
    ${libutils_headers}
    ${libcutils_headers}
    ${libsystem_headers}
    )

set(CMAKE_CXX_FLAGS " \
    ${GLOBAL_CXX_FLAGS} \
    -Wall \
    -Wextra \
    -Wno-gnu-designator \
    ")

add_library(log STATIC ${LIBLOG_SRC_FILES})

target_link_libraries(log)

