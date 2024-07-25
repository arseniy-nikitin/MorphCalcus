import QtQuick

import Style

Item {
    id: root
    property color color: MStyle.color.accentColor
    property int radius: MStyle.size.radius
    property real shadowDepth: MStyle.shadow.distance

    Rectangle {
        id: area
        anchors.fill: root
        radius: root.radius
        color: root.color
    }

    MVolumetricInnerShadow {
        id: shadow
        anchors.fill: area
        depth: root.shadowDepth
        dropsOnColor: root.color
        source: area
    }
}
