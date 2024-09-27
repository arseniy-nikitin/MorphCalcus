set(TEST_COMPILE_OPTIONS ${BUILD_COMPILE_OPTIONS})
set(TEST_LINKING_OPTIONS ${BUILD_LINKING_OPTIONS})

if(COVERAGE_ENABLE)
    list(APPEND TEST_COMPILE_OPTIONS
        ${COVERAGE_COMPILE_OPTIONS}
    )
    list(APPEND TEST_LINKING_OPTIONS
        ${COVERAGE_LINKING_OPTIONS}
    )
endif()

if(SANITIZER_ENABLE)
    list(APPEND TEST_COMPILE_OPTIONS
        ${SANITIZER_OPTIONS}
    )
    list(APPEND TEST_LINKING_OPTIONS
        ${SANITIZER_OPTIONS}
    )
endif()

set(TEST_FILES
    test_date_input_field.cc
    test_integer_input_field.cc
)

if(TESTING_ENABLE)
    if(COVERAGE_ENABLE)
        include(CreateTestSuiteWithCoverage)
        foreach(TEST_FILE ${TEST_FILES})
            get_filename_component(TEST_NAME ${TEST_FILE} NAME_WE)
            create_test_suite_with_coverage(${TEST_NAME}
                BASE_DIRECTORY "${CMAKE_SOURCE_DIR}/src"
                EXCLUDE
                    "${CMAKE_SOURCE_DIR}/external"
                    "${PROJECT_BINARY_DIR}"
                EXECUTABLE ${TEST_FILE}
                INCLUDE_DIR "${CMAKE_SOURCE_DIR}/include"
                COMPILE_OPTIONS ${TEST_COMPILE_OPTIONS}
                LINKING_OPTIONS ${TEST_LINKING_OPTIONS}
                LINKED_LIBS
                    gtest
                    gtest_main
                    Qt6::Quick
            )
        endforeach()
    else()
        include(CreateTestSuite)
        foreach(TEST_FILE ${TEST_FILES})
            get_filename_component(TEST_NAME ${TEST_FILE} NAME_WE)
            create_test_suite(${TEST_NAME}
                EXECUTABLE ${TEST_FILE}
                INCLUDE_DIR "${CMAKE_SOURCE_DIR}/include"
                COMPILE_OPTIONS ${TEST_COMPILE_OPTIONS}
                LINKING_OPTIONS ${TEST_LINKING_OPTIONS}
                LINKED_LIBS
                    gtest
                    gtest_main
                    Qt6::Quick
            )
        endforeach()
    endif()
endif()
