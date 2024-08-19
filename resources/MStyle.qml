pragma Singleton
import QtQuick

Item {

    // Global colors
    readonly property alias color: color_
    Item {
        id: color_

        // Colors
        readonly property color primaryColor: "#E8E8E8"
        readonly property color accentColor: "#FF5722"
    }

    // Global sizes
    readonly property alias size: size_
    Item {
        id: size_

        // Item sizes
        readonly property int tinyItem: 24
        readonly property int smallItem: 36
        readonly property int mediumItem: 48
        readonly property int largeItem: 60

        // Title font sizes
        readonly property int tinyTitle: 14
        readonly property int smallTitle: 14
        readonly property int mediumTitle: 20
        readonly property int largeTitle: 24

        // Subtitle font sizes
        readonly property int subtitle: 12
    }

    // Global fonts
    readonly property alias font: font_
    Item {
        id: font_

        // Fonts
        readonly property string nunitoBold: nunitoBoldLoader.name
        readonly property string nunitoExtraBold: nunitoExtraBoldLoader.name

        // Loaders
        FontLoader {
            id: nunitoBoldLoader
            source: "qrc:/arseniy.nikitin/imports/Style/fonts/Nunito-Bold.ttf"
        }

        FontLoader {
            id: nunitoExtraBoldLoader
            source: "qrc:/arseniy.nikitin/imports/Style/fonts/Nunito-ExtraBold.ttf"
        }
    }

    // Global images
    readonly property alias image: image_
    Item {
        id: image_

        // svg
        readonly property string backspaceSvg: "qrc:/arseniy.nikitin/imports/Style/images/Backspace.svg"
        readonly property string carretRightSvg: "qrc:/arseniy.nikitin/imports/Style/images/CarretRight.svg"
        readonly property string rubBoldSvg: "qrc:/arseniy.nikitin/imports/Style/images/RUB-Bold.svg"
        readonly property string rubExtraBoldSvg: "qrc:/arseniy.nikitin/imports/Style/images/RUB-ExtraBold.svg"
        readonly property string balanceRefreshFreqOnceSvg: "qrc:/arseniy.nikitin/imports/Style/images/BalanceRefreshFreqOnce.svg"
        readonly property string balanceRefreshFreqMonthSvg: "qrc:/arseniy.nikitin/imports/Style/images/BalanceRefreshFreqMonth.svg"
        readonly property string balanceRefreshFreqQuartalSvg: "qrc:/arseniy.nikitin/imports/Style/images/BalanceRefreshFreqQuartal.svg"
        readonly property string balanceRefreshFreqHalfSvg: "qrc:/arseniy.nikitin/imports/Style/images/BalanceRefreshFreqHalf.svg"
        readonly property string balanceRefreshFreqYearSvg: "qrc:/arseniy.nikitin/imports/Style/images/BalanceRefreshFreqYear.svg"
    }

    // Global shadows properties
    readonly property alias shadow: shadow_
    Item {
        id: shadow_

        // Colors
        readonly property color lightColor: "#FFFFFF"
        readonly property color shadowColor: "#000000"

        // Parameters
        readonly property int offset: 3
        readonly property int radius: 12

        // Determines elevation of an object above the surface
        // by multiplying offset and radius of shadow
        readonly property real elevation: 1

        // Opacity (depends on the color that the shadow lays on)
        readonly property real onPrimaryLightOpacity: 1.0
        readonly property real onPrimaryShadowOpacity: 0.25
        readonly property real onAccentLightOpacity: 0.5
        readonly property real onAccentShadowOpacity: 0.25

        // Detalisation of shadow
        // If cause performance issues set down to 10
        readonly property int samples: 15
    }

    // Global buttons properties
    readonly property alias button: button_
    Item {
        id: button_

        // Parameters
        readonly property int inputButtonSize: 60
        readonly property int radius: inputButtonSize * 0.25

        // Logic
        readonly property int msOnLongPress: 250

        // Animations
        readonly property alias animation: animation_
        Item {
            id: animation_

            // Animations duration
            readonly property int msOnPress: 50
            readonly property int msOnRelease: 100

            // From 1 to 0, lower - deeper
            // Determines elevation of pressed button above
            // the surface by multiplying elevation
            readonly property real releaseElevation: 1
            readonly property real pressElevation: 0.3
        }
    }
}
