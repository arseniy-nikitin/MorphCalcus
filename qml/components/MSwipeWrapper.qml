import QtQuick

MouseArea {
    property real startX: 0

    onPressed: {
        startX = mouseX
    }

    onReleased: {
        if (Math.abs(mouseX - startX) > 100) {
            if (mouseX - startX > 0) {
                swipeRight()
            } else {
                swipeLeft()
            }
        }
    }

    signal swipeRight()
    signal swipeLeft()
}
