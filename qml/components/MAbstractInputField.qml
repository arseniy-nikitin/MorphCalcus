import QtQuick
import QtQuick.Layouts

import Style

MConcaveBodyWrapper {
    id: root

    // Shadow properties
    property real shadowElevation: MStyle.shadow.elevation
    property real lightOpacity: MStyle.shadow.onAccentLightOpacity
    property real shadowOpacity: MStyle.shadow.onAccentShadowOpacity

    // Body properties
    // property color color: MStyle.color.primaryColor
    // property int radius: MStyle.button.radius

    // Image properties
    property string imageSource: ""

    // Title properties
    property string titleText: ""
    property color titleFontColor: MStyle.color.primaryColor
    property int titlePixelSize: MStyle.size.mediumTitle

    // Subtitle properties
    property string subtitleText: ""
    property color subtitleFontColor: MStyle.color.primaryColor
    property int subtitlePixelSize: MStyle.size.subtitle

    // Content properties
    property string text: ""
    property color fontColor: MStyle.color.primaryColor
    property int pixelSize: MStyle.size.mediumTitle

    signal clicked()

    RowLayout {
        anchors.fill: root
        spacing: 0

        MAlignedText {
            id: content
            Layout.fillWidth: true
            Layout.leftMargin: root.height * 0.25
            text: root.text
            color: root.fontColor
            fontFamily: MStyle.font.nunitoBold
            pixelSize: root.pixelSize
        }

        ColumnLayout {
            spacing: 0

            MAlignedImage {
                id: image
                Layout.preferredWidth: root.height
                source: root.imageSource
            }

            MAlignedText {
                id: title
                Layout.preferredWidth: root.height
                text: root.titleText
                color: root.titleFontColor
                fontFamily: MStyle.font.nunitoBold
                pixelSize: root.titlePixelSize
            }

            MAlignedText {
                id: subtitle
                Layout.preferredWidth: root.height
                text: root.subtitleText
                color: root.subtitleFontColor
                fontFamily: MStyle.font.nunitoBold
                pixelSize: root.subtitlePixelSize
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: root

        onClicked: { root.clicked() }
    }
}










