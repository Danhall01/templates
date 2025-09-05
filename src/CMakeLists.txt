file(GLOB_RECURSE SOURCE_FILES "*.c" "${CMAKE_CURRENT_SOURCE_DIR}/src")
if (SOURCE_FILES
)
    target_sources(${TARGET}
        PRIVATE
            ${SOURCE_FILES}
    )
endif()
