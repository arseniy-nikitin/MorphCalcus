import QtQuick
import Qt5Compat.GraphicalEffects

import Style

Item {
    id: root
    property var source: null
    property real depth: MStyle.shadow.distance
    property color dropsOnColor: MStyle.color.accentColor
    property int samples: MStyle.shadow.samples

    // Drop shadow
    InnerShadow {
        id: dropShadow
        anchors.fill: root
        source: root.source
        samples: root.samples
        horizontalOffset: MStyle.shadow.offset * root.depth
        verticalOffset: MStyle.shadow.offset * root.depth
        radius: MStyle.shadow.radius * root.depth
        color: MStyle.shadow.dropShadowColor
        opacity: dropsOnColor === MStyle.color.primaryColor
                 ? MStyle.shadow.onPrimaryDropShadowOpacity
                 : MStyle.shadow.onAccentDropShadowOpacity
    }

    // Back shadow
    InnerShadow {
        id: backShadow
        anchors.fill: root
        source: root.source
        samples: root.samples
        horizontalOffset: -MStyle.shadow.offset * root.depth
        verticalOffset: -MStyle.shadow.offset * root.depth
        radius: MStyle.shadow.radius * root.depth
        color: MStyle.shadow.backShadowColor
        opacity: dropsOnColor === MStyle.color.primaryColor
                 ? MStyle.shadow.onPrimaryBackShadowOpacity
                 : MStyle.shadow.onAccentBackShadowOpacity
    }
}
