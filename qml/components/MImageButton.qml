import QtQuick
import QtQuick.Controls

import Style

Item {
    id: root
    property color color: MStyle.color.primaryColor
    property string image: ""
    property color laysOnColor: MStyle.color.primaryColor
    property real shadowDistance: MStyle.shadow.distance
    property string shortPress: ""
    property string longPress: ""

    MAbstractButton {
        id: abstractButton
        anchors.fill: root
        color: root.color
        laysOnColor: root.laysOnColor
        shadowDistance: root.shadowDistance
        shortPress: root.shortPress
        longPress: root.longPress
    }

    Image {
        id: image
        anchors.centerIn: root
        source: root.image
    }
}
