import QtQuick
import QtQuick.Layouts

import Components
import Style

Rectangle {
    id: root
    color: MStyle.color.primaryColor
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
                    text: "1000000"
                    imageSource: MStyle.image.rubBoldSvg
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 15

                    MAbstractInputField {
                        Layout.fillWidth: true
                        height: 48
                        text: "20"
                        titleText: "%"
                        subtitleText: "prof"
                    }

                    MAbstractInputField {
                        Layout.fillWidth: true
                        height: 48
                        text: "15"
                        titleText: "%"
                        subtitleText: "tax"
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 15

                    MAbstractInputField {
                        Layout.fillWidth: true
                        height: 48
                        text: "01.01.2025"
                    }

                    MAbstractInputField {
                        Layout.fillWidth: true
                        height: 48
                        text: "120"
                        titleText: "M"
                    }
                }


                RowLayout {
                    Layout.fillWidth: true
                    spacing: 15

                    MAbstractButton {
                        Layout.fillWidth: true
                        height: 48
                        titleText: "Capitalization"
                        titlePixelSize: MStyle.size.mediumTitle
                    }

                    MAbstractButton {
                        width: 48
                        height: 48
                        imageSource: MStyle.image.balanceRefreshFreqMonthSvg
                    }
                }
            }
        }
    }
}
