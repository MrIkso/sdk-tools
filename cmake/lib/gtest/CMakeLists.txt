cmake_minimum_required(VERSION 3.14.2)

project(gtest)

set(GOOGLETEST ${AOSP}/external/googletest/googletest)

set(GOOGLEMOCK ${AOSP}/external/googletest/googlemock)

set(CMAKE_CXX_FLAGS " \
    ${GLOBAL_CXX_FLAGS} \
    -Wno-unused-private-field \
    -Wno-missing-field-initializers \
    -Wno-sign-compare \
    -Wno-unused-parameter \
    -frtti \
    ")

include_directories(
    ${gtest_headers}
    ${GOOGLEMOCK}
    ${GOOGLETEST}
    )

# libgmock
add_library(gmock STATIC ${GOOGLEMOCK}/src/gmock-all.cc)
target_link_libraries(gmock)

# libgmock_main
add_library(gmock_main STATIC ${GOOGLEMOCK}/src/gmock_main.cc)
target_link_libraries(gmock)

# libgtest
add_library(gtest STATIC ${GOOGLETEST}/src/gtest-all.cc)
target_link_libraries(gtest)

# libgtest_main
add_library(gtest_main STATIC ${GOOGLETEST}/src/gtest_main.cc)
target_link_libraries(gtest_main)

