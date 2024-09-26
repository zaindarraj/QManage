import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Shapes

Rectangle {
    id: welocmeRootElement
    color: systemTheme.base
    property double finalAnimationWidth: welocmeRootElement.width * 0.5
    property double finalAnimationHeight: welocmeRootElement.height * 0.4

    property double heightUpperLimit: 650
    property double startX: width * 0.5

    states: [
        State {
            name: "Mobile"
            when: welocmeRootElement.height > welocmeRootElement.width
            PropertyChanges {
                target: grid
                columns: 1
            }

            PropertyChanges {
                signInForum {
                    Layout.preferredHeight: parent.height / 2
                    Layout.fillWidth: true
                    Layout.preferredWidth: 1
                }
                animatedShape {
                    Layout.preferredWidth: parent.width
                }
                animation {
                    property: "Layout.preferredHeight"
                    from: 0
                    to: welocmeRootElement.height * 0.3
                }
            }
        },
        State {
            name: "Non-Mobile"
            when: welocmeRootElement.height < welocmeRootElement.width
            PropertyChanges {
                target: grid
                columns: 2
            }
            PropertyChanges {
                animatedShape {
                    Layout.preferredHeight: parent.height
                }
                signInForum {
                    Layout.preferredHeight: parent.height
                    Layout.fillWidth: true
                    Layout.preferredWidth: 1
                }
                animation {
                    property: "Layout.preferredWidth"
                    from: 0
                    to: welocmeRootElement.width / 2
                }
            }
        }
    ]

    GridLayout {
        id: grid
        width: welocmeRootElement.width
        height: welocmeRootElement.height

        SignInForum {
            id: signInForum
            Layout.alignment: Qt.AlignCenter
            Layout.preferredHeight: parent.height * 0.5
            Layout.fillWidth: true
        }
        MyAnimatedShape {
            id: animatedShape
            Layout.alignment: Qt.AlignBottom

            WelcomeLayout {
                anchors.centerIn: parent
            }
        }
    }

    //Animation Controller for the shape
    NumberAnimation {
        id: animation
        target: animatedShape
        running: false
        onToChanged: {
            if (animation.running) {
                console.log("d")
                animation.complete()
            }
            animation.start()
        }
    }

    MyMessageBox {
        id: messageBox
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 5
    }
}
