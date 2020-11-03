cmake_minimum_required(VERSION 3.14.2)

project(build-tools)

# android source code 
set(AOSP ${CMAKE_SOURCE_DIR}/android-11)


# headers files
set(native_headers
    ${AOSP}/frameworks/native/include
    ${AOSP}/frameworks/native/libs/binder/include
    )
              
set(libbacktrace_headers
    ${AOSP}/system/core/libbacktrace
    ${AOSP}/system/core/libbacktrace/include
    )
                
set(libsystem_headers
    ${AOSP}/system/core/libsystem/include
    )

set(androidfw_headers
    ${AOSP}/frameworks/base/libs/androidfw/include
    )
        
set(expat_headers
    ${AOSP}/external/expat
    ${AOSP}/external/expat/lib
    )
         
set(libpng_headers
    ${AOSP}/external/libpng
    )
                
set(protobuf_headers
    ${AOSP}/external/protobuf/android
    ${AOSP}/external/protobuf/src
    )
                
set(zlib_headers
    ${AOSP}/external/zlib
    ${AOSP}/external/zlib/src
    )

set(libcxx_headers
    ${AOSP}/external/libcxx/include
    )

set(libcxxabi_headers
    ${AOSP}/external/libcxxabi/include
    )

set(libbase_headers
    ${AOSP}/system/core/base/include
    )
        
set(libcutils_headers
    ${AOSP}/system/core/libcutils
    ${AOSP}/system/core/libcutils/include
    )
        
set(liblog_headers
    ${AOSP}/system/core/liblog
    ${AOSP}/system/core/liblog/include
    )
        
set(libutils_headers
    ${AOSP}/system/core/libutils
    ${AOSP}/system/core/libutils/include
    )
        
set(libziparchive_headers
    ${AOSP}/system/core/libziparchive
    ${AOSP}/system/core/libziparchive/include
    )
          
set(aapt_headers
    ${AOSP}/frameworks/base/tools/aapt
    )
                
set(aapt2_headers
    ${AOSP}/frameworks/base/tools/aapt2
    ${AOSP}/frameworks/base/tools/aapt2/frameworks/base/tools/aapt2
    )

set(libprocessgroup_headers
    ${AOSP}/system/core/libprocessgroup
    ${AOSP}/system/core/libprocessgroup/include
    ${AOSP}/system/core/libprocessgroup/cgrouprc/include
    ${AOSP}/system/core/libprocessgroup/cgrouprc_format/include
    )

set(libvndksupport_headers
    ${AOSP}/system/core/libvndksupport/include
    ${AOSP}/system/core/libvndksupport/include/vndksupport
    )

set(libjsoncpp_headers
    ${AOSP}/external/jsoncpp/include
    )
	
set(libbuildversion_headers
    ${AOSP}/build/soong/cc/libbuildversion/include
    )

set(gtest_headers                         
    ${AOSP}/external/googletest/googletest/include           
    ${AOSP}/external/googletest/googlemock/include                   
    )
  
set(cpu_features_headers                         
    ${AOSP}/external/cpu_features/include                              
    )

set(libidmap2_policies_headers                        
    ${AOSP}/frameworks/base/cmds/idmap2/libidmap2_policies/include
    )
    
add_subdirectory(cmake)
