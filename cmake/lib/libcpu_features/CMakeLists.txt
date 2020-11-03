cmake_minimum_required(VERSION 3.14.2)

project(libcpu_features)

set(CPU_FEATURES ${AOSP}/external/cpu_features)

set(LIBCPU_FEATURES_SRC_FILES
        ${CPU_FEATURES}/src/filesystem.c
        ${CPU_FEATURES}/src/stack_line_reader.c
        ${CPU_FEATURES}/src/string_view.c
		${CPU_FEATURES}/src/hwcaps.c
        ${CPU_FEATURES}/src/unix_features_aggregator.c
		${CPU_FEATURES}/src/cpuinfo_arm.c
		#${CPU_FEATURES}/src/cpuinfo_aarch64.c
	)

include_directories(
	${cpu_features_headers}
	)

set(CMAKE_C_FLAGS "${GLOBAL_C_FLAGS} -DSTACK_LINE_READER_BUFFER_SIZE=1024 -Wno-gnu-designator -DHAVE_DLFCN_H -DHAVE_STRONG_GETAUXVAL")

add_library(cpu_features STATIC ${LIBCPU_FEATURES_SRC_FILES})
target_link_libraries(cpu_features)