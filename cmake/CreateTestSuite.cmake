function(create_test_suite NAME)
    set(oneValueArgs EXECUTABLE INCLUDE_DIR)
    set(multiValueArgs COMPILE_OPTIONS LINKING_OPTIONS LINKED_LIBS)
    cmake_parse_arguments(ARG "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    if(NOT ARG_EXECUTABLE)
        message(FATAL_ERROR "EXECUTABLE argument is required for create_test_suite")
    endif()
    if(NOT ARG_INCLUDE_DIR)
        message(FATAL_ERROR "INCLUDE_DIR argument is required for create_test_suite")
    endif()

    add_executable(${NAME} ${ARG_EXECUTABLE})
    target_include_directories(${NAME} PRIVATE ${ARG_INCLUDE_DIR})

    if(ARG_COMPILE_OPTIONS)
        target_compile_options(${NAME} PRIVATE ${ARG_COMPILE_OPTIONS})
    endif()
    if(ARG_LINKING_OPTIONS)
        target_link_libraries(${NAME} PRIVATE ${ARG_LINKING_OPTIONS})
    endif()

    target_link_libraries(${NAME} PRIVATE ${ARG_LINKED_LIBS})

    add_test(NAME ${NAME} COMMAND ${NAME})
endfunction()
