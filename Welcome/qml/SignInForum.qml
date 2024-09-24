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
            messageBox.textMessage = "Signed Inssssssss."
            messageBox.startAnimation()
        }
        onErrorOccured: message => {
                            messageBox.textMessage = message

                            messageBox.startAnimation()
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
            sessionController.signIn(email, password)
        }
    }
}
