import QtQuick

import Style

Item {
    id: root
    property color color: MStyle.color.primaryColor
    property color laysOnColor: MStyle.color.primaryColor
    property real shadowDistance: MStyle.shadow.distance
    property string shortPress: ""
    property string longPress: ""

    signal onInputPressed(string signal)

    MConvexArea {
        id: convexArea
        anchors.fill: root
        color: root.color
        laysOnColor: root.laysOnColor
        shadowElevation: shadowDistance
    }

    MouseArea {
        id: mouseArea
        anchors.fill: root
        property bool held: false
        onPressed: {
            // Animations
            held = true
            if (!onPressAnimation.running && !onReleaseAnimation.running) {
                onPressAnimation.start()
            }
            // Signals
            timerLongSignal.running = true
        }
        onReleased: {
            // Animations
            held = false
            if (!onPressAnimation.running && !onReleaseAnimation.running) {
                onReleaseAnimation.start()
            }
            // Signals
            if (timerLongSignal.running) {
                timerLongSignal.stop()
                if (root.shortPress !== "") {
                    console.log("onInputPressed short signal:", shortPress)
                    root.onInputPressed(shortPress)
                }
            }
        }
    }

    // Animations
    NumberAnimation {
        id: onPressAnimation
        target: convexArea
        property: "shadowElevation"
        to: shadowDistance * MStyle.animation.pressDepth
        duration: MStyle.animation.msOnPress
        easing.type: Easing.OutQuad
        running: false
        onStopped: {
            if (!mouseArea.held) {
                onReleaseAnimation.start()
            }
        }
    }

    NumberAnimation {
        id: onReleaseAnimation
        target: convexArea
        property: "shadowElevation"
        to: shadowDistance
        duration: MStyle.animation.msOnRelease
        easing.type: Easing.InQuad
    }

    // Signals
    Timer {
        id: timerLongSignal
        interval: 250 // TODO: REMOVE MAGIC NUMBER
        running: false
        repeat: false
        onTriggered: {
            if (root.longPress !== "") {
                console.log("onInputPressed long signal:", longPress)
                root.onInputPressed(longPress)
            }
        }
    }
}
