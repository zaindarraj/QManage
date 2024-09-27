import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Shapes
import Session 1.0

Item {
    property string email
    property string password

    ColumnLayout {
        id: column
        spacing: 10
        anchors.centerIn: parent

        width: parent.width * 0.8
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
            color: rootWindow.getTextColor()
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
}
