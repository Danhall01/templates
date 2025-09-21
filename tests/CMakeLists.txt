 function (create_test name file)
    add_executable(${name} ${file})
    target_link_libraries(${name} ${COMMON_LIBS})
    add_test(NAME ${name} COMMAND $<TARGET_FILE:${name}>)
endfunction()

# create_test(TestName testfile.c)
