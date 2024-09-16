import QtQuick
import QtQuick.Controls

import Morph.Pages
import Morph.Components

Window {
    id: root
    visible: true
    minimumWidth: 360
    minimumHeight: 800
    color: "transparent"
    title: "Morph"

    MSwipeWrapper {
        anchors.fill: parent
        property int currentIndex: 0
        property var pages: [calculatorPage, creditPage, debitPage]

        onSwipeRight: {
            currentIndex = (currentIndex - 1 + pages.length) % pages.length
            stackView.replace(pages[currentIndex])
        }

        onSwipeLeft: {
            currentIndex = (currentIndex + 1) % pages.length
            stackView.replace(pages[currentIndex])
        }

        StackView {
            id: stackView
            anchors.fill: parent
            replaceEnter: null
            replaceExit: null
            initialItem: calculatorPage

            Component {
                id: calculatorPage
                MCalculatorPage {}
            }

            Component {
                id: creditPage
                MCreditPage {}
            }

            Component {
                id: debitPage
                MDebitPage {}
            }
        }
    }
}
