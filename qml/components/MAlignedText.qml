import QtQuick

import Style

Item {
    id: root

    property string text: ""
    property bool clip: true
    property color color: MStyle.color.accentColor
    property int pixelSize: MStyle.size.largeTitle
    property string fontFamily: MStyle.font.nunitoBold

    height: pixelSize
    visible: text !== ""

    Text {
        id: title
        anchors.centerIn: root
        text: root.text
        clip: root.clip
        color: root.color
        font.family: root.fontFamily
        font.pixelSize: root.pixelSize
    }
}
