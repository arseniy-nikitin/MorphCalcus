qt_add_library(Pages STATIC)

set_target_properties(Pages PROPERTIES AUTOMOC ON)
target_link_libraries(Pages PRIVATE Qt6::Quick)

list(APPEND MODULE_QML_FILES
    MCalculatorPage.qml
    MCreditPage.qml
    MDebitPage.qml
)

qt_add_qml_module(Pages
    URI Morph.Pages
    VERSION 1.0
    RESOURCE_PREFIX /arseniy.nikitin/imports
    QML_FILES ${MODULE_QML_FILES}
)
