qt_add_library(Style STATIC)

set_target_properties(Style PROPERTIES AUTOMOC ON)
target_link_libraries(Style PRIVATE Qt6::Quick)

list(APPEND MODULE_QML_SINGLETON_FILES Style.qml)

set_source_files_properties(${MODULE_QML_SINGLETON_FILES}
    PROPERTIES QT_QML_SINGLETON_TYPE  TRUE
)

qt_add_qml_module(Style
    URI Morph.Style
    VERSION 1.0
    RESOURCE_PREFIX /arseniy.nikitin/imports
    QML_FILES
        ${MODULE_QML_SINGLETON_FILES}
)

add_subdirectory(components)
add_subdirectory(pages)
