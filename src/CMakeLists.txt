file(GLOB_RECURSE SOURCE_FILES "*.c" "${CMAKE_CURRENT_SOURCE_DIR}/src")
if (SOURCE_FILES)
    target_sources(${LIB}
        PRIVATE
            ${SOURCE_FILES}
    )
endif()
