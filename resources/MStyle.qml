pragma Singleton
import QtQuick

Item {
    readonly property alias font: font_
    Item {
        id: font_

        FontLoader {
            id: nunitoBoldLoader
            source: "qrc:/arseniy.nikitin/imports/Style/fonts/Nunito-Bold.ttf"
        }

        FontLoader {
            id: nunitoExtraBoldLoader
            source: "qrc:/arseniy.nikitin/imports/Style/fonts/Nunito-ExtraBold.ttf"
        }

        // Application fonts
        readonly property string nunitoBold: nunitoBoldLoader.name
        readonly property string nunitoExtraBold: nunitoExtraBoldLoader.name
    }

    readonly property alias image: image_
    Item {
        id: image_

        // Application images
        readonly property string backspaceSvg: "qrc:/arseniy.nikitin/imports/Style/images/Backspace.svg"
        readonly property string carretRightSvg: "qrc:/arseniy.nikitin/imports/Style/images/CarretRight.svg"
        readonly property string rubBoldSvg: "qrc:/arseniy.nikitin/imports/Style/images/RUB-Bold.svg"
        readonly property string rubExtraBoldSvg: "qrc:/arseniy.nikitin/imports/Style/images/RUB-ExtraBold.svg"
    }

    readonly property alias color: color_
    Item {
        id: color_

        // Application colors
        readonly property color primaryColor: "#E8E8E8"
        readonly property color accentColor: "#FF6800"
    }

    readonly property alias size: size_
    Item {
        id: size_

        readonly property int inputFieldHeight: 48

        readonly property int inputButtonSize: 60
        readonly property int radius: inputButtonSize * 0.25
        readonly property int auxiliaryButtonSize: 24
    }

    readonly property alias animation: animation_
    Item {
        id: animation_

        // Animations duration
        readonly property int msOnPress: 50
        readonly property int msOnRelease: 100

        // Depth of the buttons press
        readonly property real pressDepth: 0.3 // From 1 to 0, lower - deeper
    }

    readonly property alias shadow: shadow_
    Item {
        id: shadow_

        // Shadow colors
        readonly property color dropShadowColor: "#000000"
        readonly property color backShadowColor: "#FFFFFF"

        // Shadow opacity
        readonly property real onPrimaryBackShadowOpacity: 1.0
        readonly property real onPrimaryDropShadowOpacity: 0.25
        readonly property real onAccentBackShadowOpacity: 0.5
        readonly property real onAccentDropShadowOpacity: 0.25

        // Shadow parameters
        readonly property int offset: 3
        readonly property int radius: 12
        readonly property int distance: 1 // Multiplies offset and radius
        readonly property int samples: 15 // If cause performance issues set down to 10
    }
}
