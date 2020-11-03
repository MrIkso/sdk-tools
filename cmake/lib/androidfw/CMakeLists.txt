cmake_minimum_required(VERSION 3.14.2)

project(androidfw)


set(ANDROIDFW ${AOSP}/frameworks/base/libs/androidfw)


set(ANDROIDFW_SRC_FILES
    ${ANDROIDFW}/ApkAssets.cpp
    ${ANDROIDFW}/Asset.cpp
    ${ANDROIDFW}/AssetDir.cpp
    ${ANDROIDFW}/AssetManager.cpp
    ${ANDROIDFW}/AssetManager2.cpp
    ${ANDROIDFW}/AttributeResolution.cpp
    ${ANDROIDFW}/ChunkIterator.cpp
    ${ANDROIDFW}/ConfigDescription.cpp
    ${ANDROIDFW}/Idmap.cpp
    ${ANDROIDFW}/LoadedArsc.cpp
    ${ANDROIDFW}/Locale.cpp
    ${ANDROIDFW}/LocaleData.cpp
    ${ANDROIDFW}/misc.cpp
    ${ANDROIDFW}/ObbFile.cpp
    ${ANDROIDFW}/PosixUtils.cpp
    ${ANDROIDFW}/ResourceTypes.cpp
    ${ANDROIDFW}/ResourceUtils.cpp
    ${ANDROIDFW}/StreamingZipInflater.cpp
    ${ANDROIDFW}/TypeWrappers.cpp
    ${ANDROIDFW}/Util.cpp
    ${ANDROIDFW}/ZipFileRO.cpp
    ${ANDROIDFW}/ZipUtils.cpp
    )
	

include_directories(
    ${androidfw_headers}
    ${libbase_headers}
    ${libziparchive_headers}
    ${libc_headers}
    ${libutils_headers}
    ${libcutils_headers}
    ${liblog_headers}
    ${libsystem_headers}
    ${native_headers}
    ${zlib_headers}
    )

set(CMAKE_C_FLAGS "${GLOBAL_CXX_FLAGS} -DSTATIC_ANDROIDFW_FOR_TOOLS")
set(CMAKE_CXX_FLAGS "${GLOBAL_CXX_FLAGS} -DSTATIC_ANDROIDFW_FOR_TOOLS")

add_library(androidfw STATIC ${ANDROIDFW_SRC_FILES})
target_link_libraries(androidfw)
