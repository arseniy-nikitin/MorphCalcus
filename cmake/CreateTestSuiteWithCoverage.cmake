function(create_test_suite_with_coverage NAME)
    set(oneValueArgs BASE_DIRECTORY)
    set(multiValueArgs EXCLUDE)
    cmake_parse_arguments(ARG "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    if(NOT ARG_BASE_DIRECTORY)
        set(ARG_BASE_DIRECTORY "${PROJECT_SOURCE_DIR}")
    endif()

    include(CreateTestSuite)
    create_test_suite(${NAME} ${ARGN})

    include(CodeCoverage)
    append_coverage_compiler_flags_to_target(${NAME})
    setup_target_for_coverage_gcovr_html(
        NAME ${NAME}_coverage
        EXECUTABLE ${NAME}
        BASE_DIRECTORY "${ARG_BASE_DIRECTORY}"
        EXCLUDE ${ARG_EXCLUDE}
    )
endfunction()
