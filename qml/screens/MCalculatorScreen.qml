import QtQuick

import Components
import Style

Item {
    id: root

    // MImageButton {
    //     anchors.centerIn: root
    //     image: MStyle.image.carretRightSvg
    //     width: 60
    //     height: 60
    // }

    MTextButton {
        anchors.centerIn: parent
        text: "1"
        fontColor: MStyle.color.accentColor
        width: 60
        height: 60
    }

}
