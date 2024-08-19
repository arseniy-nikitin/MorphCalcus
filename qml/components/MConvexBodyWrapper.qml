import QtQuick

import Style

Item {
    id: root

    property real elevation: MStyle.shadow.elevation
    property real lightOpacity: MStyle.shadow.onPrimaryLightOpacity
    property real shadowOpacity: MStyle.shadow.onPrimaryShadowOpacity
    property color color: MStyle.color.primaryColor
    property int radius: MStyle.button.radius

    MVolumetricDropShadow {
        id: shadow
        anchors.fill: body
        source: body
        elevation: root.elevation
        lightOpacity: root.lightOpacity
        shadowOpacity: root.shadowOpacity
    }

    Rectangle {
        id: body
        anchors.fill: root
        color: root.color
        radius: root.radius
    }
}
