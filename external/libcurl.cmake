# Set up sol2, either by finding the package directly, or by fetching it from GitHub
message(STATUS "Could not find CURL package so we are downloading it.")

# Declare where to find glfw and what version to use
FetchContent_Declare(
    curl_external
    URL https://curl.haxx.se/windows/dl-7.68.0/curl-7.68.0-win64-mingw.zip
    URL_HASH SHA256=5e49e97ea3e3dd707f1f56985113b908b9a95e81c3212290c7fefbe4d79fb093
)

# Populate it for building
FetchContent_MakeAvailable(curl_external)

if(WIN32)
    set(CURL_LIBRARY ${PROJECT_BINARY_DIR}/_deps/curl_external-src/lib/libcurl.a CACHE STRING "The path of cURL libary")
    #set(CURL_LIBRARY ${PROJECT_BINARY_DIR}/_deps/curl_external-src/bin/libcurl-x64.dll CACHE STRING "The path of cURL libary")
    #set(CURL_LIBRARIES ${PROJECT_BINARY_DIR}/_deps/curl_external-src/lib/ CACHE STRING "The path of cURL libary")
    
    set(CURL_INCLUDE_DIR ${PROJECT_BINARY_DIR}/_deps/curl_external-src/include/ CACHE STRING "The path of cURL include")
endif()
