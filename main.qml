import QtQuick
import QtQuick.Controls

import Screens
import Components
import Style

Window {
    id: root
    visible: true
    minimumWidth: 360
    minimumHeight: 800
    title: "Morph"

    MSwipeWrapper {
        anchors.fill: parent
        property int currentIndex: 0
        property var screens: [calculatorScreen, creditScreen, debitScreen]

        onSwipeRight: {
            currentIndex = (currentIndex - 1 + screens.length) % screens.length
            stackView.replace(screens[currentIndex])
        }

        onSwipeLeft: {
            currentIndex = (currentIndex + 1) % screens.length
            stackView.replace(screens[currentIndex])
        }

        StackView {
            id: stackView
            anchors.fill: parent
            replaceEnter: null
            replaceExit: null
            initialItem: calculatorScreen

            Component {
                id: calculatorScreen
                MCalculatorScreen {}
            }

            Component {
                id: creditScreen
                MCreditScreen {}
            }

            Component {
                id: debitScreen
                MDebitScreen {}
            }
        }
    }
}

// StackView {
//     id: stackView
//     anchors.fill: parent

//     // Define your pages here
//     Component {
//         id: page1
//         Rectangle {
//             color: "lightblue"
//             width: parent.width
//             height: parent.height
//             Text {
//                 text: "Page 1"
//                 anchors.centerIn: parent
//             }
//         }
//     }

//     Component {
//         id: page2
//         Rectangle {
//             color: "lightgreen"
//             width: parent.width
//             height: parent.height
//             Text {
//                 text: "Page 2"
//                 anchors.centerIn: parent
//             }
//         }
//     }

//     Component {
//         id: page3
//         Rectangle {
//             color: "lightyellow"
//             width: parent.width
//             height: parent.height
//             Text {
//                 text: "Page 3"
//                 anchors.centerIn: parent
//             }
//         }
//     }

//     initialItem: page1
// }

// MSwipeWrapper {
//     anchors.fill: parent

//     onSwipeRight: {
//         if (stackView.currentIndex > 0) {
//             stackView.pop()
//         } else {
//             stackView.push(stackView.count - 1)
//         }
//     }

//     onSwipeLeft: {
//         if (stackView.currentIndex < stackView.count - 1) {
//             stackView.push(stackView.currentIndex + 1)
//         } else {
//             stackView.push(0)
//         }
//     }
// }
