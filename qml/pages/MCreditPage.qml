import QtQuick
import QtQuick.Layouts

import Morph.Style
import Morph.Components

Rectangle {
    id: root
    color: Style.color.primaryColor
    radius: 12

    // Make wrapper from container and layout
    Item {
        id: container
        anchors.centerIn: root
        height: 728
        width: 288

        ColumnLayout {
            anchors.fill: container
            spacing: 30

            MConcaveBodyWrapper {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            ColumnLayout {
                spacing: 15
                Layout.fillHeight: true

                MAbstractInputField {
                    Layout.fillWidth: true
                    height: 48
                    text: "10000000"
                    imageSource: Style.image.rubBoldSvg
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 15

                    MAbstractInputField {
                        Layout.fillWidth: true
                        height: 48
                        text: "20"
                        titleText: "%"
                    }

                    MAbstractInputField {
                        Layout.fillWidth: true
                        height: 48
                        text: "360"
                        titleText: "M"
                    }
                }

                MAbstractButton {
                    Layout.fillWidth: true
                    height: 48
                    titleText: "Differentiated"
                    titlePixelSize: Style.size.mediumTitle
                }
            }
        }
    }
}
