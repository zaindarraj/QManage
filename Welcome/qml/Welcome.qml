import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {

    ColumnLayout {
        anchors.centerIn: parent

        Text {
            id: welcome
            text: qsTr("Welcome To QManage")
            Layout.alignment: Qt.AlignCenter
        }

        RowLayout {
            Layout.alignment: Qt.AlignCenter

            Button {
                id: navToSignIn
                text: qsTr("Sign In")
                Layout.alignment: Qt.AlignCenter
            }

            Button {
                id: navToSignUp
                text: qsTr("Sign Up")
                Layout.alignment: Qt.AlignCenter
            }
        }
    }
}
