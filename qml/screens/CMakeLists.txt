qt_add_library(Screens STATIC)

set_target_properties(Screens PROPERTIES AUTOMOC ON)
target_link_libraries(Screens PRIVATE Qt6::Quick)

list(APPEND MODULE_QML_FILES
    MCalculatorScreen.qml
    MCreditScreen.qml
    MDebitScreen.qml
)

qt_add_qml_module(Screens
    URI Screens
    VERSION 1.0
    RESOURCE_PREFIX /arseniy.nikitin/imports
    QML_FILES
        ${MODULE_QML_FILES}
)
