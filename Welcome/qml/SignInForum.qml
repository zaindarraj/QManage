import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Shapes
import Session 1.0

Item {

    ColumnLayout {
        id: column
        spacing: 10
        anchors.centerIn: parent

        width: parent.width * 0.8

        Label {
            text: qsTr("Sign in")
            font.pixelSize: 21
            Layout.alignment: Qt.AlignCenter
        }

        TextField {
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: parent.width
            placeholderText: qsTr("Email")
            horizontalAlignment: Text.AlignLeft //keep textfield's label in place if language input is RTL
            text: signInViewModel.email
            onTextEdited: {
                signInViewModel.setEmail(text)
            }
        }
        TextField {
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: parent.width
            horizontalAlignment: Text.AlignLeft //keep textfield's label in place if language input is RTL

            placeholderText: qsTr("Password")
            echoMode: TextField.Password
            text: signInViewModel.password
            onTextEdited: {
                signInViewModel.setPassword(text)
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
                if (signInViewModel.email === ""
                        || signInViewModel.password === "") {
                    messageBox.textMessage = "Please fill all fields"
                    messageBox.startAnimation()
                } else {
                    signInViewModel.signIn()
                }
            }
        }
    }
}
