import QtQuick

Item {
    id: root

    property var signalSender: null

    signal clicked()
    signal pressAndHold()

    Connections {
        id: mouseAreaConnection
        target: root.signalSender

        function onClicked(mouse) { processClicked() }
        function onPressAndHold(mouse) { processPressAndHold() }
    }

    function processClicked() {
        root.clicked()
    }

    function processPressAndHold() {
        root.pressAndHold()
    }
}
