import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Shapes

Shape {
    id: animatedShape

    ShapePath {
        id: shapePath
        strokeColor: systemTheme.accent
        fillColor: systemTheme.accent
        property int joinStyleIndex: 0

        property variant styles: [ShapePath.BevelJoin, ShapePath.MiterJoin, ShapePath.RoundJoin]

        joinStyle: styles[joinStyleIndex]

        Component.onCompleted: {
            animation.start()
        }

        startX: animatedShape.width / 2
        startY: 0

        PathCurve {
            x: 0
            y: animatedShape.height / 2
        }
        PathCurve {
            x: animatedShape.width / 2
            y: animatedShape.height
        }
        PathLine {
            x: animatedShape.width
            y: animatedShape.height
        }
        PathLine {
            x: animatedShape.width
            y: 0
        }
    }
}
