import QtQuick
import QtQuick.Layouts

import Morph.Style
import Morph.Components

MConvexBodyWrapper {
    id: root

    // Shadow properties
    property real shadowElevation: Style.shadow.elevation
    property real lightOpacity: Style.shadow.onPrimaryLightOpacity
    property real shadowOpacity: Style.shadow.onPrimaryShadowOpacity

    // Body properties
    // property color color: Style.color.primaryColor
    // property int radius: Style.button.radius

    // Image properties
    property string imageSource: ""

    // Title properties
    property string titleText: ""
    property color titleFontColor: Style.color.accentColor
    property int titlePixelSize: Style.size.largeTitle

    // Subtitle properties
    property string subtitleText: ""
    property color subtitleFontColor: Style.color.accentColor
    property int subtitlePixelSize: Style.size.subtitle


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
            fontFamily: Style.font.nunitoBold
            pixelSize: root.titlePixelSize
        }

        MAlignedText {
            id: subtitle
            text: root.subtitleText
            color: root.subtitleFontColor
            fontFamily: Style.font.nunitoBold
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
