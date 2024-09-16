import QtQuick
import QtQuick.Layouts

import Morph.Style
import Morph.Components

MConcaveBodyWrapper {
    id: root

    // Shadow properties
    property real shadowElevation: Style.shadow.elevation
    property real lightOpacity: Style.shadow.onAccentLightOpacity
    property real shadowOpacity: Style.shadow.onAccentShadowOpacity

    // Body properties
    // property color color: Style.color.primaryColor
    // property int radius: Style.button.radius

    // Image properties
    property string imageSource: ""

    // Title properties
    property string titleText: ""
    property color titleFontColor: Style.color.primaryColor
    property int titlePixelSize: Style.size.mediumTitle

    // Subtitle properties
    property string subtitleText: ""
    property color subtitleFontColor: Style.color.primaryColor
    property int subtitlePixelSize: Style.size.subtitle

    // Content properties
    property string text: ""
    property color fontColor: Style.color.primaryColor
    property int pixelSize: Style.size.mediumTitle

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
            fontFamily: Style.font.nunitoBold
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
                fontFamily: Style.font.nunitoBold
                pixelSize: root.titlePixelSize
            }

            MAlignedText {
                id: subtitle
                Layout.preferredWidth: root.height
                text: root.subtitleText
                color: root.subtitleFontColor
                fontFamily: Style.font.nunitoBold
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










