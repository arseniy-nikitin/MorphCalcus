import QtQuick
import QtQuick.Layouts

import Morph.Style
import Morph.Components

ColumnLayout {
    id: root

    spacing: 15

    property int cellWidth: Style.size.largeItem
    property int cellHeight: Style.size.largeItem

    RowLayout {
        spacing: 15

        MAbstractButton {
            width: root.cellWidth
            height: root.cellHeight
            titleText: "x"
        }

        MAbstractButton {
            width: root.cellWidth
            height: root.cellHeight
            imageSource: Style.image.carretRightSvg
        }

        MAbstractButton {
            width: root.cellWidth
            height: root.cellHeight
            imageSource: Style.image.backspaceSvg
        }

        MAbstractButton {
            width: root.cellWidth
            height: root.cellHeight
            titleText: "÷"
        }
    }

    RowLayout {
        spacing: 15

        MAbstractButton {
            width: root.cellWidth
            height: root.cellHeight
            titleText: "7"
            subtitleText: "sqrt"
        }

        MAbstractButton {
            width: root.cellWidth
            height: root.cellHeight
            titleText: "8"
            subtitleText: "pow"
        }

        MAbstractButton {
            width: root.cellWidth
            height: root.cellHeight
            titleText: "9"
            subtitleText: "fact"
        }

        MAbstractButton {
            width: root.cellWidth
            height: root.cellHeight
            titleText: "×"
        }
    }

    RowLayout {
        spacing: 15

        MAbstractButton {
            width: root.cellWidth
            height: root.cellHeight
            titleText: "4"
            subtitleText: "asin"
        }

        MAbstractButton {
            width: root.cellWidth
            height: root.cellHeight
            titleText: "5"
            subtitleText: "acos"
        }

        MAbstractButton {
            width: root.cellWidth
            height: root.cellHeight
            titleText: "6"
            subtitleText: "atan"
        }

        MAbstractButton {
            width: root.cellWidth
            height: root.cellHeight
            titleText: "-"
        }
    }

    RowLayout {
        spacing: 15

        MAbstractButton {
            width: root.cellWidth
            height: root.cellHeight
            titleText: "1"
            subtitleText: "sin"
        }

        MAbstractButton {
            width: root.cellWidth
            height: root.cellHeight
            titleText: "2"
            subtitleText: "cos"
        }

        MAbstractButton {
            width: root.cellWidth
            height: root.cellHeight
            titleText: "3"
            subtitleText: "tan"
        }

        MAbstractButton {
            width: root.cellWidth
            height: root.cellHeight
            titleText: "+"
        }
    }

    RowLayout {
        spacing: 15

        MAbstractButton {
            width: root.cellWidth
            height: root.cellHeight
            titleText: "( )"
            subtitleText: "mod"
        }

        MAbstractButton {
            width: root.cellWidth
            height: root.cellHeight
            titleText: "0"
            subtitleText: "log"
        }

        MAbstractButton {
            width: root.cellWidth
            height: root.cellHeight
            titleText: "."
            subtitleText: "ln"
        }

        MAbstractButton {
            width: root.cellWidth
            height: root.cellHeight
            titleText: "="
        }
    }
}
