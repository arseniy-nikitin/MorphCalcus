qt_add_library(Components STATIC)

set_target_properties(Components PROPERTIES AUTOMOC ON)
target_link_libraries(Components PRIVATE Qt6::Quick)

list(APPEND MODULE_QML_FILES
    MVolumetricDropShadow.qml
    MVolumetricInnerShadow.qml
    MConvexArea.qml
    MConcaveArea.qml
    MTextInputField.qml
    MImageInputField.qml
    MInputFieldDate.qml
    MAbstractButton.qml
    MTextButton.qml
    MImageButton.qml
    MTextWithSubtitleButton.qml
    MSwipeWrapper.qml
)

qt_add_qml_module(Components
    URI Components
    VERSION 1.0
    RESOURCE_PREFIX /arseniy.nikitin/imports
    QML_FILES
        ${MODULE_QML_FILES}
)
