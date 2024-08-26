cmake_minimum_required(VERSION 3.21.1)

project(MorphCalcus VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 COMPONENTS Quick REQUIRED)

qt_add_executable(appMorphCalcus
    main.cc
)

qt_add_qml_module(appMorphCalcus
    URI Morph
    VERSION 1.0
    RESOURCE_PREFIX /arseniy.nikitin/imports
    QML_FILES main.qml
)

add_subdirectory(qml/components)
add_subdirectory(qml/pages)
add_subdirectory(models)
add_subdirectory(resources)

target_link_libraries(appMorphCalcus PRIVATE Qt6::Quick Componentsplugin Pagesplugin Styleplugin)

set_target_properties(appMorphCalcus PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER arseniy.nikitin.morphcalcus.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

install(TARGETS appMorphCalcus
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
