qt_add_library(Resources STATIC)

set_target_properties(Resources PROPERTIES AUTOMOC ON)
target_link_libraries(Resources PRIVATE Qt6::Quick)

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

qt_add_qml_module(Resources
    URI Resources
    VERSION 1.0
    RESOURCE_PREFIX /arseniy.nikitin/imports
    RESOURCES
        ${MODULE_RESOURCES}
)
