import QtQuick

import Morph.Style
import Morph.Components

Item {
    id: root

    property real elevation: Style.shadow.elevation
    property real lightOpacity: Style.shadow.onPrimaryLightOpacity
    property real shadowOpacity: Style.shadow.onPrimaryShadowOpacity
    property color color: Style.color.primaryColor
    property int radius: Style.button.radius

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
