qt_add_library(Morph::Core STATIC)

set_target_properties(Morph::Core PROPERTIES AUTOMOC ON)
target_link_libraries(Morph::Core PRIVATE Qt6::Quick)

add_subdirectory(input_field)
add_subdirectory(page)

qt_add_qml_module(Morph::Core
    URI Morph.Core
    VERSION 1.0
    RESOURCE_PREFIX /arseniy.nikitin/imports
    SOURCES
        models/input_field/date_input_field.cc
        models/input_field/integer_input_field.cc
)
