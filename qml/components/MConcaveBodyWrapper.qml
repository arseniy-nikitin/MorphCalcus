import QtQuick

import Morph.Style
import Morph.Components

Item {
    id: root

    property real elevation: Style.shadow.elevation
    property real lightOpacity: Style.shadow.onAccentLightOpacity
    property real shadowOpacity: Style.shadow.onAccentShadowOpacity
    property color color: Style.color.accentColor
    property int radius: Style.button.radius

    Rectangle {
        id: body
        anchors.fill: root
        color: root.color
        radius: root.radius
    }

    MVolumetricInnerShadow {
        id: shadow
        anchors.fill: body
        source: body
        elevation: root.elevation
        lightOpacity: root.lightOpacity
        shadowOpacity: root.shadowOpacity
    }
}
