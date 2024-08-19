qt_add_library(Style STATIC)

set_target_properties(Style PROPERTIES AUTOMOC ON)
target_link_libraries(Style PRIVATE Qt6::Quick)

list(APPEND MODULE_QML_FILES MStyle.qml)
list(APPEND MODULE_RESOURCES
    fonts/Nunito-Bold.ttf
    fonts/Nunito-ExtraBold.ttf

    images/Backspace.svg
    images/CarretRight.svg
    images/RUB-Bold.svg
    images/RUB-ExtraBold.svg
    images/BalanceRefreshFreqOnce.svg
    images/BalanceRefreshFreqMonth.svg
    images/BalanceRefreshFreqQuartal.svg
    images/BalanceRefreshFreqHalf.svg
    images/BalanceRefreshFreqYear.svg
)

set_source_files_properties(${MODULE_QML_FILES} PROPERTIES
    QT_QML_SINGLETON_TYPE  TRUE
)

qt_add_qml_module(Style
    URI Style
    VERSION 1.0
    RESOURCE_PREFIX /arseniy.nikitin/imports
    QML_FILES
        ${MODULE_QML_FILES}
    RESOURCES
        ${MODULE_RESOURCES}
)
