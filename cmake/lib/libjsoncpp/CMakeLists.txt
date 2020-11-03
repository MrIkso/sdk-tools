cmake_minimum_required(VERSION 3.14.2)

project(libjsoncpp)

set(LIBJSONCPP ${AOSP}/external/jsoncpp)

set(LIBJSONCPP_SRC_FILES
    ${LIBJSONCPP}/src/lib_json/json_reader.cpp
    ${LIBJSONCPP}/src/lib_json/json_value.cpp
    ${LIBJSONCPP}/src/lib_json/json_writer.cpp
    )

include_directories(
    ${libjsoncpp_headers}
    )

set(CMAKE_CXX_FLAGS "${GLOBAL_CXX_FLAGS} -DJSON_USE_EXCEPTION=0 -Wno-implicit-fallthrough")

add_library(jsoncpp STATIC ${LIBJSONCPP_SRC_FILES})
target_link_libraries(jsoncpp)
