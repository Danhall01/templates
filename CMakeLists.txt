cmake_minimum_required(VERSION 4.0.2)
project(TEMPLATE VERSION 0.1)

set(TARGET "TEMPLATE")
set(COMMON_LIBS "SharedLibraries")

# Set all compile definitions
set(CMAKE_C_STANDARD ${CMAKE_C_STANDARD_LATEST})
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/archive/${CMAKE_BUILD_TYPE}/")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/lib/${CMAKE_BUILD_TYPE}/")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/run")


# Create the common library with import modules
add_library(${COMMON_LIBS} INTERFACE)
include(FetchContent)

# Example include CAT for utility functions
FetchContent_Declare(
    cat_lib
    GIT_REPOSITORY https://github.com/Danhall01/CAT
    GIT_TAG "main" # Specific commit version
)
FetchContent_MakeAvailable(cat_lib)
target_link_libraries(${COMMON_LIBS}
    INTERFACE
        cat
)

# Main executable
add_executable(${TARGET} main.c)
target_link_libraries(${TARGET} PRIVATE ${COMMON_LIBS})

# Precompile headers
target_precompile_headers(${TARGET} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/include/pch.h")

# Add Debug flags
if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    add_compile_definitions(${TARGET} PUBLIC _DEBUG)
endif()

# Include all source files
target_include_directories(${TARGET} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/include")
add_subdirectory(src)

