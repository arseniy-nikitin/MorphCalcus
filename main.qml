import QtQuick
import QtQuick.Controls

import Screens
import Style

Window {
    id: root
    visible: true
    minimumWidth: 360
    minimumHeight: 800
    title: "Morph"

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: MCalculatorScreen {}
    }

    Flickable {
        anchors.fill: parent
        interactive: true
        flickableDirection: Flickable.HorizontalFlick

        onFlickStarted: {
            if (horizontalVelocity > 0) {
                // Swipe right
                console.log("swipe right!")
                stackView.pop()
            } else if (horizontalVelocity < 0) {
                // Swipe left
                console.log("swipe left!")
                if (stackView.depth === 0) {
                    stackView.push(Qt.resolvedUrl("qrc:/arseniy.nikitin/imports/Screens/screens/MCreditScreen.qml"))
                } else if (stackView.depth === 1) {
                    stackView.push(Qt.resolvedUrl("qrc:/arseniy.nikitin/imports/Screens/screens/MDebitScreen.qml"))
                } else {
                    stackView.push(Qt.resolvedUrl("qrc:/arseniy.nikitin/imports/Screens/screens/MCalculatorScreen.qml"))
                }
            }
        }
    }
}
