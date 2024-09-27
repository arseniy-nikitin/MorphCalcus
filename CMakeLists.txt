cmake_minimum_required(VERSION 3.21.1)
project(MorphCalcus VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 COMPONENTS Quick REQUIRED)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(BuildOptions)

include_directories(include)

option(TESTING_ENABLE ON)
option(COVERAGE_ENABLE OFF)
option(SANITIZERS_ENABLE OFF)

set(BUILD_COMPILE_OPTIONS)
set(BUILD_LINKING_OPTIONS)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    list(APPEND BUILD_COMPILE_OPTIONS
        ${DEBUG_COMPILE_OPTIONS}
    )
elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
    list(APPEND BUILD_COMPILE_OPTIONS
        ${RELEASE_COMPILE_OPTIONS}
    )
endif()

list(APPEND BUILD_COMPILE_OPTIONS
    ${WARNING_OPTIONS}
)

if(TESTING_ENABLE)
    include(CTest)
    add_subdirectory(external/googletest)
    add_subdirectory(tests)
endif()

add_subdirectory(src)
add_subdirectory(qml)
add_subdirectory(resources)

qt_add_executable(appMorphCalcus main.cc)
target_compile_options(appMorphCalcus PRIVATE ${BUILD_COMPILE_OPTIONS})
target_link_libraries(appMorphCalcus PRIVATE ${BUILD_LINKING_OPTIONS})

qt_add_qml_module(appMorphCalcus
    URI Morph
    VERSION 1.0
    RESOURCE_PREFIX /arseniy.nikitin/imports
    QML_FILES qml/main.qml
)

target_link_libraries(appMorphCalcus PRIVATE
    Qt6::Quick
    Styleplugin
    Componentsplugin
    Pagesplugin
    Resourcesplugin
    Morph::Core
)

set_target_properties(appMorphCalcus PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER arseniy.nikitin.morphcalcus.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

install(TARGETS appMorphCalcus
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
