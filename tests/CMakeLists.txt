function(add_gtest TEST_NAME TEST_SOURCE)
    add_executable(${TEST_NAME} ${TEST_SOURCE})
    target_include_directories(${TEST_NAME} PUBLIC ${CMAKE_SOURCE_DIR}/models) # TODO: Change models to source
    target_link_libraries(${TEST_NAME} gtest gtest_main)

    target_compile_options(${TEST_NAME} PRIVATE
        "$<$<CONFIG:DEBUG>:
            ${SANITIZER_OPTIONS};
            ${COVERAGE_COMPILE_OPTIONS};
            -O0 -g
        >")
    target_compile_options(${TEST_NAME} PRIVATE "$<$<CONFIG:RELEASE>:-O3>")
    target_link_options(${TEST_NAME} PRIVATE "${COVERAGE_LINKING_OPTIONS}")

    if (ENABLE_COVERAGE)
        include(CodeCoverage)
        append_coverage_compiler_flags_to_target(${TEST_NAME})
        setup_target_for_coverage_gcovr_html(
                  NAME ${TEST_NAME}_coverage
                  EXECUTABLE ${TEST_NAME}
                  BASE_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
                  EXCLUDE ${PROJECT_BINARY_DIR}/* ${PROJECT_SOURCE_DIR}/external/*)
    endif()

    add_test(NAME ${TEST_NAME} COMMAND ${TEST_NAME})
endfunction()

add_gtest(test_IntTextInput "test_inttextinput.cc")
add_gtest(test_FloatTextInput "test_floattextinput.cc")
add_gtest(test_DateTextInput "test_datetextinput.cc")
