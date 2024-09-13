import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Shapes

ColumnLayout {
    Layout.preferredWidth: parent.width * 0.5
    Text {
        text: qsTr("Sign in")
        color: systemTheme.text
        font.pixelSize: 21
        Layout.alignment: Qt.AlignCenter
    }

    TextField {
        Layout.alignment: Qt.AlignCenter
        Layout.preferredWidth: parent.width * 0.7
    }
    TextField {
        Layout.alignment: Qt.AlignCenter
        Layout.preferredWidth: parent.width * 0.7
    }

    Button {
        text: qsTr("Sign In")
        Layout.alignment: Qt.AlignCenter
        Layout.preferredWidth: parent.width * 0.35
    }
}
