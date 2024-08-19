import QtQuick

import Style

Item {
    id: root

    visible: source !== ""

    property string source: ""

    Image {
        id: image
        anchors.centerIn: root
        source: root.source
    }
}
