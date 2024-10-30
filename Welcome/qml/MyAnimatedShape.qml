pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls.Material
import QtQuick.Window
import QtQuick.Shapes

Item {
    id: shapeItem

    property double windowHeight : Window.height
    property double windowWidth : Window.width

    Window.onHeightChanged : {
        windowHeight = Window.height

    }

    Window.onWidthChanged : {
        windowHeight = Window.width

    }



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
            when: shapeItem.windowHeight < shapeItem.windowWidth
            PropertyChanges {
                noMobileLoader{
                    sourceComponent: nonMobile
                }

            }
            PropertyChanges {
                mobileLoader{
                    sourceComponent: undefined
                }

            }
        },

        State {
            name: "Mobile"
            when: shapeItem.windowHeight > shapeItem.windowWidth
            PropertyChanges {
                mobileLoader{
                sourceComponent: mobile
            }
            }

            PropertyChanges {
                noMobileLoader{
                    sourceComponent: undefined

                }

            }
        },

        State {
            name: "Non"
            when: shapeItem.height = 0
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
                strokeColor: shapeItem.primaryColor()
                fillColor: shapeItem.primaryColor()
                property int joinStyleIndex: 0

                property variant styles: [ShapePath.BevelJoin, ShapePath.MiterJoin, ShapePath.RoundJoin]

                joinStyle: styles[joinStyleIndex]

                startX: 0
                startY: shapeItem.height

                PathLine {
                    x: 0
                    y: shapeItem.height * 0.4
                }
                PathCurve {
                    x: shapeItem.width / 2
                    y: 0
                }
                PathCurve {
                    x: shapeItem.width
                    y: shapeItem.height * 0.4
                }
                PathLine {
                    x: shapeItem.width
                    y: shapeItem.height
                }
            }
        }
    }
}
