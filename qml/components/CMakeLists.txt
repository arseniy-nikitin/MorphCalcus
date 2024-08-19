qt_add_library(Components STATIC)

set_target_properties(Components PROPERTIES AUTOMOC ON)
target_link_libraries(Components PRIVATE Qt6::Quick)

list(APPEND MODULE_QML_FILES
    MSwipeWrapper.qml
    MVolumetricDropShadow.qml
    MVolumetricInnerShadow.qml
    MAbstractButton.qml
    MAbstractInputField.qml
    MCalculatorKeyboard.qml
    MNumericKeyboard.qml

    MButtonSignalsHandler.qml
    MButtonAnimationHandler.qml
    MConvexBodyWrapper.qml
    MConcaveBodyWrapper.qml
    MAlignedText.qml
    MAlignedImage.qml
)

qt_add_qml_module(Components
    URI Components
    VERSION 1.0
    RESOURCE_PREFIX /arseniy.nikitin/imports
    QML_FILES ${MODULE_QML_FILES}
)
