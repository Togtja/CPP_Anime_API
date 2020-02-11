cmake_minimum_required(VERSION 3.15 FATAL_ERROR)
project(web_scaper VERSION 0.0.0)


set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/external ${CMAKE_MODULE_PATH})

# Set CULTSIM_DEBUG so we can know if we're in debug mode or not
#[=[if(CMAKE_BUILD_TYPE STREQUAL "[Dd]ebug")
    set(CULTSIM_DEBUG 1)
else()
    set(CULTSIM_DEBUG 0)
endif()
#]=]

# Add dependencies and our executables
#add_subdirectory(external)
add_subdirectory(web_cpp)
