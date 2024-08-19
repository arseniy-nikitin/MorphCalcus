import QtQuick

MouseArea {
    id: root

    property real startX: 0

    signal swipeRight()
    signal swipeLeft()

    onPressed: {
        startX = mouseX
    }

    onReleased: {
        // TODO: Remove Magic Number "100"
        if (Math.abs(mouseX - root.startX) > 100) {
            if (mouseX - root.startX > 0) {
                console.log("Swipe Right")
                root.swipeRight()
            } else {
                console.log("Swipe Left")
                root.swipeLeft()
            }
        }
    }
}
