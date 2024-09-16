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

            MCalculatorKeyboard {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }
}
