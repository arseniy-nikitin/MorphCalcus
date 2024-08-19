import QtQuick

import Style

Item {
    id: root

    property real elevation: MStyle.shadow.elevation
    property real lightOpacity: MStyle.shadow.onAccentLightOpacity
    property real shadowOpacity: MStyle.shadow.onAccentShadowOpacity
    property color color: MStyle.color.accentColor
    property int radius: MStyle.button.radius

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
