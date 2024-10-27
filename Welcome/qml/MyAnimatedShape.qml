pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls.Material

import QtQuick.Shapes

Item {
    id: shapeItem


    function primaryColor() {

        if (Qt.platform.os === "android") {
            return Material.primary
        } else {
            return systemTheme.accent
        }
    }

    states: [
        State {
            name: "Non-Mobile"
            when: welocmeRootElement.height < welocmeRootElement.width
            PropertyChanges {
                target: noMobileLoader
                sourceComponent: nonMobile
            }
            PropertyChanges {
                target: mobileLoader
                sourceComponent: undefined
            }
        },

        State {
            name: "Mobile"
            when: welocmeRootElement.height > welocmeRootElement.width
            PropertyChanges {
                target: mobileLoader
                sourceComponent: mobile
            }
            PropertyChanges {
                target: noMobileLoader
                sourceComponent: undefined
            }
        },

        State {
            name: "Non"
            when: animatedShape.height = 0
        }
    ]

    Loader {
        id: noMobileLoader
        property double widthC: shapeItem.width
        property double heightC: shapeItem.height
        anchors.fill: shapeItem
        sourceComponent: nonMobile
    }

    Loader {
        id: mobileLoader
        anchors.fill: shapeItem
    }

    Component {
        id: nonMobile

        Shape {
            id: mainShape

            ShapePath {
                id: shapePath
                strokeColor: shapeItem.primaryColor()
                fillColor: shapeItem.primaryColor()
                property int joinStyleIndex: 0

                property variant styles: [ShapePath.BevelJoin, ShapePath.MiterJoin, ShapePath.RoundJoin]

                joinStyle: styles[joinStyleIndex]

                startX: shapeItem.width / 2
                startY: 0

                PathCurve {
                    x: 0
                    y: shapeItem.height/ 2
                }
                PathCurve {
                    x: shapeItem.width / 2
                    y: shapeItem.height
                }
                PathLine {
                    x:shapeItem.width
                    y: shapeItem.height
                }
                PathLine {
                    x:shapeItem.width
                    y: 0
                }
            }
        }
    }

    Component {
        id: mobile
        Shape {

            ShapePath {
                id: mobileShape
                strokeColor: primaryColor()
                fillColor: primaryColor()
                property int joinStyleIndex: 0

                property variant styles: [ShapePath.BevelJoin, ShapePath.MiterJoin, ShapePath.RoundJoin]

                joinStyle: styles[joinStyleIndex]

                startX: 0
                startY: shapeItem.animatedShapeHeight

                PathLine {
                    x: 0
                    y: animatedShape.height * 0.4
                }
                PathCurve {
                    x: animatedShape.width / 2
                    y: 0
                }
                PathCurve {
                    x: animatedShape.width
                    y: animatedShape.height * 0.4
                }
                PathLine {
                    x: animatedShape.width
                    y: animatedShape.height
                }
            }
        }
    }
}
