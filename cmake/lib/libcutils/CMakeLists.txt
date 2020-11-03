cmake_minimum_required(VERSION 3.14.2)

project(libcutils)

set(LIBCUTILS ${AOSP}/system/core/libcutils)

set(LIBCUTILS_SRC_FILES
    ${LIBCUTILS}/fs.cpp
    ${LIBCUTILS}/hashmap.cpp
    ${LIBCUTILS}/multiuser.cpp
    ${LIBCUTILS}/str_parms.cpp
    ${LIBCUTILS}/config_utils.cpp
    ${LIBCUTILS}/canned_fs_config.cpp
    ${LIBCUTILS}/iosched_policy.cpp
    ${LIBCUTILS}/load_file.cpp
    ${LIBCUTILS}/native_handle.cpp
    ${LIBCUTILS}/properties.cpp
    ${LIBCUTILS}/record_stream.cpp
    ${LIBCUTILS}/strlcpy.c
    ${LIBCUTILS}/threads.cpp
    ${LIBCUTILS}/android_reboot.cpp
    ${LIBCUTILS}/ashmem-dev.cpp
    ${LIBCUTILS}/fs_config.cpp
    ${LIBCUTILS}/klog.cpp
    ${LIBCUTILS}/partition_utils.cpp
    ${LIBCUTILS}/qtaguid.cpp
    ${LIBCUTILS}/trace-dev.cpp
    ${LIBCUTILS}/uevent.cpp
    )

set(LIBCUTILS_SOCKETS_SRC_FILES
    ${LIBCUTILS}/sockets.cpp
    ${LIBCUTILS}/android_get_control_file.cpp
    ${LIBCUTILS}/socket_inaddr_any_server_unix.cpp
    ${LIBCUTILS}/socket_local_client_unix.cpp
    ${LIBCUTILS}/socket_local_server_unix.cpp
    ${LIBCUTILS}/socket_network_client_unix.cpp
    ${LIBCUTILS}/sockets_unix.cpp
    )

include_directories(
    ${libcutils_headers}
    ${liblog_headers}
    ${libbase_headers}
    ${libutils_headers}
    ${libprocessgroup_headers}
    )

set(CMAKE_CXX_FLAGS " \
    ${GLOBAL_CXX_FLAGS} \
    -Wall \
    -Werror \
    -Wextra \
    -D_GNU_SOURCE \
    ")

add_library(cutils_sockets STATIC ${LIBCUTILS_SOCKETS_SRC_FILES})
target_link_libraries(cutils_sockets)

add_library(cutils STATIC ${LIBCUTILS_SRC_FILES})
target_link_libraries(cutils)
