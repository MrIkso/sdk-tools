# Android.cmake
# check android toolchain api level __ANDROID_API__
# defined in toolchain/sysroot/usr/include/android/api-level.h
# building library needs api >= 26

include_guard(GLOBAL)

function(check_android_api api_level)
    if(CMAKE_HOST_SYSTEM_NAME STREQUAL "Android")
	message(STATUS "build host is Android.")
    endif()
    
    # get toolchain path
    string(REGEX REPLACE "(.+)\\/bin/.*" "\\1"
        NDK_TOOLCHAIN
        ${CMAKE_C_COMPILER}
        )
        
    message(STATUS "toolchain path: ${NDK_TOOLCHAIN}")
    
    # Try to read the API level from the toolchain launcher.
    if(EXISTS "${NDK_TOOLCHAIN}/bin/clang")
	set(ANDROID_API_LEVEL_REGEX "__ANDROID_API__=([0-9]+)")
		
	file(STRINGS "${NDK_TOOLCHAIN}/bin/clang" 
	    STANDALONE_TOOLCHAIN_BIN_CLANG
            REGEX "${ANDROID_API_LEVEL_REGEX}" 
            LIMIT_COUNT 1 
            LIMIT_INPUT 65536
            )
            
        if(STANDALONE_TOOLCHAIN_BIN_CLANG MATCHES "${ANDROID_API_LEVEL_REGEX}")
	    set(${api_level} "${CMAKE_MATCH_1}")
        endif()
    
        unset(STANDALONE_TOOLCHAIN_BIN_CLANG)
        unset(ANDROID_API_LEVEL_REGEX)
    endif()
    
    # Try to read the API level from the api-level.h
    if(NOT ${api_level})
        # The compiler launcher does not know __ANDROID_API__.  Assume this
	# is not unified headers and look for it in the api-level.h header.
	set(API_LEVEL_H_REGEX "^[\t ]*#[\t ]*define[\t ]+__ANDROID_API__[\t ]+([0-9]+)")
	    
	# api-level.h location
	set(HEADER_FILE_PATH "${NDK_TOOLCHAIN}/sysroot/usr/include/android/api-level.h")
	if(NOT EXISTS ${HEADER_FILE_PATH})
	    set(HEADER_FILE_PATH "${NDK_TOOLCHAIN}/include/android/api-level.h")
	endif()
	    
	file(STRINGS "${HEADER_FILE_PATH}"
	    API_LEVEL_H_CONTENT 
	    REGEX "${API_LEVEL_H_REGEX}"
	    )
	        
        if(API_LEVEL_H_CONTENT MATCHES "${API_LEVEL_H_REGEX}")
	    set(${api_level} "${CMAKE_MATCH_1}")
        endif()
        set(${api_level} "${${api_level}}" PARENT_SCOPE)
    endif()
    
endfunction()

