import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Shapes

ColumnLayout {
    id: layout

    Text {
        text: "QManage"
        font.bold: true
        Layout.preferredHeight: layout.height * 0.2
        wrapMode: Text.WordWrap
        color: systemTheme.text
        fontSizeMode: Text.Fit
        minimumPixelSize: 10
        font.pixelSize: 22
        Layout.preferredWidth: layout.width
        Layout.alignment: Qt.AlignCenter
        horizontalAlignment: Text.AlignHCenter
    }
    Text {
        text: "Manage Your Time Once and For All"
        Layout.preferredHeight: layout.height * 0.2
        wrapMode: Text.WordWrap
        color: systemTheme.text
        fontSizeMode: Text.Fit
        minimumPixelSize: 13
        font.pixelSize: 22
        Layout.preferredWidth: layout.width
        Layout.alignment: Qt.AlignCenter
        horizontalAlignment: Text.AlignHCenter
    }
    Button {
        text: "Don't Have a account ?"
        Layout.alignment: Qt.AlignCenter
    }
}
