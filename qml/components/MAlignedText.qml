import QtQuick

import Morph.Style

Item {
    id: root

    property string text: ""
    property bool clip: true
    property color color: Style.color.accentColor
    property int pixelSize: Style.size.largeTitle
    property string fontFamily: Style.font.nunitoBold

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
