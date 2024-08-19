import QtQuick
import Qt5Compat.GraphicalEffects

import Style

Item {
    id: root

    property var source: null
    property real elevation: MStyle.shadow.elevation
    property real lightOpacity: MStyle.shadow.onPrimaryLightOpacity
    property real shadowOpacity: MStyle.shadow.onPrimaryShadowOpacity

    // Shadow
    DropShadow {
        id: shadow
        anchors.fill: root
        source: root.source
        opacity: root.shadowOpacity
        horizontalOffset: MStyle.shadow.offset * root.elevation
        verticalOffset: MStyle.shadow.offset * root.elevation
        radius: MStyle.shadow.radius * root.elevation
        color: MStyle.shadow.shadowColor
        samples: MStyle.shadow.samples
    }

    // Light
    DropShadow {
        id: light
        anchors.fill: root
        source: root.source
        opacity: root.lightOpacity
        horizontalOffset: -MStyle.shadow.offset * root.elevation
        verticalOffset: -MStyle.shadow.offset * root.elevation
        radius: MStyle.shadow.radius * root.elevation
        color: MStyle.shadow.lightColor
        samples: MStyle.shadow.samples
    }
}
