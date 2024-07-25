import QtQuick
import QtQuick.Controls

import Style

Item {
    id: root
    property color color: MStyle.color.primaryColor
    property color fontColor: MStyle.color.accentColor
    property string text: ""
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

    Text {
        id: text
        anchors.centerIn: root
        text: root.text
        font.family: MStyle.font.nunitoBold
        font.pixelSize: 24
        color: root.fontColor
    }
}
