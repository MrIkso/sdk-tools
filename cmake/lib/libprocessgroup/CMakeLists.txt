cmake_minimum_required(VERSION 3.14.2)

project(libprocessgroup)

set(LIBPROCESSGROUP ${AOSP}/system/core/libprocessgroup)

set(LIBPROCESSGROUP_SRC_FILES
    ${LIBPROCESSGROUP}/cgroup_map.cpp
    ${LIBPROCESSGROUP}/processgroup.cpp
    ${LIBPROCESSGROUP}/sched_policy.cpp
    ${LIBPROCESSGROUP}/task_profiles.cpp
    )

set(LIBCGROUPRC_FORMAT_SRC_FILES
    ${LIBPROCESSGROUP}/cgrouprc_format/cgroup_controller.cpp
    )

set(LIBCGROUPRC_SRC_FILES
    ${LIBPROCESSGROUP}/cgrouprc/cgroup_controller.cpp
    ${LIBPROCESSGROUP}/cgrouprc/cgroup_file.cpp
    )

include_directories(
    ${libprocessgroup_headers}
    ${libcutils_headers}
    ${libbase_headers}
    ${libjsoncpp_headers}
    )

set(CMAKE_CXX_FLAGS "${GLOBAL_CXX_FLAGS} -Wexit-time-destructors")

add_library(cgrouprc_format STATIC ${LIBCGROUPRC_FORMAT_SRC_FILES})
target_link_libraries(cgrouprc_format)

add_library(cgrouprc STATIC ${LIBCGROUPRC_SRC_FILES})
target_link_libraries(cgrouprc)

add_library(processgroup STATIC ${LIBPROCESSGROUP_SRC_FILES})
target_link_libraries(processgroup)


