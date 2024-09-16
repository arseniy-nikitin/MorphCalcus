import QtQuick
import Qt5Compat.GraphicalEffects

import Morph.Style

Item {
    id: root

    property var source: null
    property real elevation: Style.shadow.elevation
    property real lightOpacity: Style.shadow.onPrimaryLightOpacity
    property real shadowOpacity: Style.shadow.onPrimaryShadowOpacity

    // Shadow
    DropShadow {
        id: shadow
        anchors.fill: root
        source: root.source
        opacity: root.shadowOpacity
        horizontalOffset: Style.shadow.offset * root.elevation
        verticalOffset: Style.shadow.offset * root.elevation
        radius: Style.shadow.radius * root.elevation
        color: Style.shadow.shadowColor
        samples: Style.shadow.samples
    }

    // Light
    DropShadow {
        id: light
        anchors.fill: root
        source: root.source
        opacity: root.lightOpacity
        horizontalOffset: -Style.shadow.offset * root.elevation
        verticalOffset: -Style.shadow.offset * root.elevation
        radius: Style.shadow.radius * root.elevation
        color: Style.shadow.lightColor
        samples: Style.shadow.samples
    }
}
