cmake_minimum_required(VERSION 3.14.2)

project(libutils)

set(LIBUTILS ${AOSP}/system/core/libutils)

set(LIBUTILS_SRC_FILES
    ${LIBUTILS}/Errors.cpp
    ${LIBUTILS}/FileMap.cpp
    ${LIBUTILS}/JenkinsHash.cpp
    ${LIBUTILS}/NativeHandle.cpp
    ${LIBUTILS}/Printer.cpp
    ${LIBUTILS}/RefBase.cpp
    ${LIBUTILS}/SharedBuffer.cpp
    ${LIBUTILS}/StopWatch.cpp
    ${LIBUTILS}/String8.cpp
    ${LIBUTILS}/String16.cpp
    ${LIBUTILS}/StrongPointer.cpp
    ${LIBUTILS}/SystemClock.cpp
    ${LIBUTILS}/Threads.cpp
    ${LIBUTILS}/Timers.cpp
    ${LIBUTILS}/Tokenizer.cpp
    ${LIBUTILS}/Unicode.cpp
    ${LIBUTILS}/VectorImpl.cpp
    ${LIBUTILS}/misc.cpp
    ${LIBUTILS}/Trace.cpp
    ${LIBUTILS}/Looper.cpp
    )

include_directories(
    ${libutils_headers}
    ${liblog_headers}
    ${libcutils_headers}
    ${libbase_headers}
    ${libbacktrace_headers}
    ${libsystem_headers}
    ${libprocessgroup_headers}
    ${libvndksupport_headers}
    )

set(CMAKE_CXX_FLAGS " \
    ${GLOBAL_CXX_FLAGS} \
    -Wall \
    -Werror \
    -fvisibility=protected \
    ")

add_library(utilscallstack STATIC ${LIBUTILS}/CallStack.cpp)
target_link_libraries(utilscallstack)

add_library(utils STATIC ${LIBUTILS_SRC_FILES})
target_link_libraries(utils)
