import QtQuick
import QtQuick.Layouts

import Style

MConvexBodyWrapper {
    id: root

    // Shadow properties
    property real shadowElevation: MStyle.shadow.elevation
    property real lightOpacity: MStyle.shadow.onPrimaryLightOpacity
    property real shadowOpacity: MStyle.shadow.onPrimaryShadowOpacity

    // Body properties
    // property color color: MStyle.color.primaryColor
    // property int radius: MStyle.button.radius

    // Image properties
    property string imageSource: ""

    // Title properties
    property string titleText: ""
    property color titleFontColor: MStyle.color.accentColor
    property int titlePixelSize: MStyle.size.largeTitle

    // Subtitle properties
    property string subtitleText: ""
    property color subtitleFontColor: MStyle.color.accentColor
    property int subtitlePixelSize: MStyle.size.subtitle


    signal clicked()
    signal pressAndHold()

    ColumnLayout {
        anchors.centerIn: root
        spacing: 0

        MAlignedImage {
            id: image
            source: root.imageSource
        }

        MAlignedText {
            id: title
            text: root.titleText
            color: root.titleFontColor
            fontFamily: MStyle.font.nunitoBold
            pixelSize: root.titlePixelSize
        }

        MAlignedText {
            id: subtitle
            text: root.subtitleText
            color: root.subtitleFontColor
            fontFamily: MStyle.font.nunitoBold
            pixelSize: root.subtitlePixelSize
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: root
        pressAndHoldInterval: 250

        MButtonSignalsHandler {
            signalSender: mouseArea
            onClicked: { root.clicked() }
            onPressAndHold: { root.pressAndHold() }
        }

        MButtonAnimationHandler {
            signalSender: mouseArea
            target: root
            property: "elevation"
        }
    }
}
