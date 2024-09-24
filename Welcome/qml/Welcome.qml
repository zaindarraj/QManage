import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Shapes

Rectangle {
    id: welocmeRootElement
    color: systemTheme.mid
    property double finalAnimationWidth: welocmeRootElement.width * 0.5
    property double heightUpperLimit: 650

    onWidthChanged: {
        animation.stop()
        animation.start()
    }

    states: [
        State {
            name: "ShortSHeight"
            when: welocmeRootElement.height < heightUpperLimit
            PropertyChanges {
                target: layout
                height: animatedShape.height * 0.24
            }
        },
        State {
            name: "LongHeight"
            when: welocmeRootElement.height >= heightUpperLimit
            PropertyChanges {
                target: layout
                height: animatedShape.height * 0.15
            }
        }
    ]

    property double startX: width * 0.5

    RowLayout {
        anchors.fill: parent

        Item {
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: parent.width * 0.5

            SignInForum {
                spacing: 5
                anchors.centerIn: parent
                width: parent.width * 0.7
            }
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

    Button {
        text: qsTr("Don't have an account? Sign up")
        flat: true
        anchors.bottom: parent.bottom
    }

    MyMessageBox {
        id: messageBox
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 5
    }
}
