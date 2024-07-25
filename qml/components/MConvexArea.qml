import QtQuick

import Style

Item {
    id: root
    property color color: MStyle.color.primaryColor
    property int radius: MStyle.size.radius
    property real shadowElevation: MStyle.shadow.distance
    property color laysOnColor: MStyle.color.primaryColor

    MVolumetricDropShadow {
        id: shadow
        anchors.fill: area
        elevation: root.shadowElevation
        dropsOnColor: root.laysOnColor
        source: area
    }

    Rectangle {
        id: area
        anchors.fill: root
        radius: root.radius
        color: root.color
    }
}
