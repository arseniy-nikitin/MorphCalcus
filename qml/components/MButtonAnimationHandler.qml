import QtQuick

import Morph.Style

Item {
    id: root

    property var signalSender: null
    property var target: null
    property string property: ""

    Connections {
        id: mouseAreaConnection
        target: root.signalSender

        function onPressed(mouse) { processPressed() }
        function onReleased(mouse) { processReleased() }
    }

    QtObject { id: state; property bool held_}

    function processPressed() {
        state.held_ = true
        if (!onPressAnimation.running && !onReleaseAnimation.running) {
            onPressAnimation.start()
        }
    }

    function processReleased() {
        state.held_ = false
        if (!onPressAnimation.running && !onReleaseAnimation.running) {
            onReleaseAnimation.start()
        }
    }

    NumberAnimation {
        id: onPressAnimation
        target: root.target
        property: root.property
        to: Style.button.animation.pressElevation
        duration: Style.button.animation.msOnPress
        easing.type: Easing.OutQuad
        onStopped: {
            if (!state.held_) {
                onReleaseAnimation.start()
            }
        }
    }

    NumberAnimation {
        id: onReleaseAnimation
        target: root.target
        property: root.property
        to: Style.button.animation.releaseElevation
        duration: Style.button.animation.msOnRelease
        easing.type: Easing.InQuad
    }
}
