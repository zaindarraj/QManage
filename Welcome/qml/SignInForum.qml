import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Shapes
import Session 1.0

ColumnLayout {
    property string email
    property string password

    SessionController {
        id: sessionController
        onSessionReady: {
            textMessage.text = "Signed Inssssssss."
            animation.start()
        }
    }

    Text {
        text: qsTr("Sign in")
        color: systemTheme.text
        font.pixelSize: 21
        Layout.alignment: Qt.AlignCenter
    }

    TextField {
        Layout.alignment: Qt.AlignCenter
        Layout.preferredWidth: parent.width
        placeholderText: qsTr("Email")
        onTextChanged: {
            email = text
        }
    }
    TextField {
        Layout.alignment: Qt.AlignCenter
        Layout.preferredWidth: parent.width
        placeholderText: qsTr("Password")
        echoMode: TextField.Password
        onTextChanged: {
            password = text
        }
    }

    Button {
        text: qsTr("Forgot password ? Reset.")
        flat: true
    }

    Button {
        text: qsTr("Sign In")
        Layout.alignment: Qt.AlignCenter
        Layout.preferredWidth: parent.width * 0.35
        onClicked: {
            sessionController.signIn("dddc@lgmail.co", "123456789.")
        }
    }
    PaddedRectangle {
        id: messageBox
        color: systemTheme.dark
        Layout.alignment: Qt.AlignCenter
        Layout.preferredWidth: textMessage.width + 20
        Layout.preferredHeight: textMessage.height + 20
        border.color: systemTheme.accent
        border.width: 1
        radius: 5
        opacity: 0

        SequentialAnimation {
            id: animation
            running: false

            OpacityAnimator {
                target: messageBox
                to: 1
                duration: 500
            }

            PauseAnimation {
                duration: 2000
            }
            OpacityAnimator {
                target: messageBox
                from: 1
                to: 0
                duration: 500
            }
        }

        Text {
            id: textMessage
            anchors.centerIn: parent
            color: systemTheme.text
        }
    }
}
