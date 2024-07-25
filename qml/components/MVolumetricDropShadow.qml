import QtQuick
import Qt5Compat.GraphicalEffects

import Style

Item {
    id: root
    property var source: null
    property real elevation: MStyle.shadow.distance
    property color dropsOnColor: MStyle.color.primaryColor
    property int samples: MStyle.shadow.samples

    // Drop shadow
    DropShadow {
        id: dropShadow
        anchors.fill: root
        source: root.source
        samples: root.samples
        horizontalOffset: MStyle.shadow.offset * root.elevation
        verticalOffset: MStyle.shadow.offset * root.elevation
        radius: MStyle.shadow.radius * root.elevation
        color: MStyle.shadow.dropShadowColor
        opacity: dropsOnColor === MStyle.color.primaryColor
                 ? MStyle.shadow.onPrimaryDropShadowOpacity
                 : MStyle.shadow.onAccentDropShadowOpacity
    }

    // Back shadow
    DropShadow {
        id: backShadow
        anchors.fill: root
        source: root.source
        samples: root.samples
        horizontalOffset: -MStyle.shadow.offset * root.elevation
        verticalOffset: -MStyle.shadow.offset * root.elevation
        radius: MStyle.shadow.radius * root.elevation
        color: MStyle.shadow.backShadowColor
        opacity: dropsOnColor === MStyle.color.primaryColor
                 ? MStyle.shadow.onPrimaryBackShadowOpacity
                 : MStyle.shadow.onAccentBackShadowOpacity
    }
}
