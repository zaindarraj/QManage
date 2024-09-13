import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Shapes

Rectangle {
    id: welocmeRootElement
    color: systemTheme.mid
    property double finalAnimationWidth: welocmeRootElement.width * 0.5

    onWidthChanged: {
        animation.stop()
        animation.start()
    }

    states: [
        State {
            name: "ShortSHeight"
            when: welocmeRootElement.height < 500
            PropertyChanges {
                target: layout
                height: animatedShape.height * 0.3
            }
        },
        State {
            name: "LongHeight"
            when: welocmeRootElement.height >= 500
            PropertyChanges {
                target: layout
                height: animatedShape.height * 0.15
            }
        }
    ]

    property double startX: width * 0.5

    RowLayout {
        anchors.fill: parent

        SignInForum {
            Layout.alignment: Qt.AlignCenter
            spacing: 5
        }
        MyAnimatedShape {
            id: animatedShape
            Layout.preferredHeight: welocmeRootElement.height

            Layout.preferredWidth: 0
            Layout.alignment: Qt.AlignRight
            WelcomeLayout {
                id: layout
                width: animatedShape.width * 0.4
                anchors.centerIn: parent
            }
        }
    }

    //Animation Controller for the shape
    NumberAnimation {
        id: animation
        targets: [animatedShape]
        property: "Layout.preferredWidth"
        duration: 500
        to: finalAnimationWidth
        running: true
    }
}
