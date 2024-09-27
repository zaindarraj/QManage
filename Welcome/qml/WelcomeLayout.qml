import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Shapes
import Resources

ColumnLayout {
    id: layout

    Text {
        text: "Q-Manage"
        font.bold: true
        wrapMode: Text.WordWrap
        color: rootWindow.getTextColor()
        font.pixelSize: 22
        Layout.preferredWidth: layout.width
        Layout.alignment: Qt.AlignCenter
        horizontalAlignment: Text.AlignHCenter
    }
    Text {
        text: "Manage Your Time Once and For All"
        wrapMode: Text.WordWrap
        color: rootWindow.getTextColor()
        font.pixelSize: 22
        Layout.preferredWidth: layout.width
        Layout.alignment: Qt.AlignCenter
        horizontalAlignment: Text.AlignHCenter
    }
    RowLayout {
        Layout.alignment: Qt.AlignCenter
        spacing: 10

        ToolButton {
            Layout.preferredHeight: 20
            Layout.preferredWidth: 20
            Layout.alignment: Qt.AlignCenter

            Image {
                smooth: true
                layer.samples: 8
                sourceSize: Qt.size(30, 30)

                layer.enabled: true
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "/insta.png"
            }
        }
        ToolButton {
            Layout.preferredHeight: 20
            Layout.preferredWidth: 20
            Layout.alignment: Qt.AlignCenter

            Image {
                smooth: true
                layer.samples: 8
                sourceSize: Qt.size(30, 30)

                layer.enabled: true
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "/insta.png"
            }
        }
        ToolButton {
            Layout.preferredHeight: 20
            Layout.preferredWidth: 20
            Layout.alignment: Qt.AlignCenter

            Image {
                smooth: true
                layer.samples: 8
                sourceSize: Qt.size(30, 30)

                layer.enabled: true
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "/insta.png"
            }
        }
        ToolButton {
            Layout.preferredHeight: 20
            Layout.preferredWidth: 20
            Layout.alignment: Qt.AlignCenter

            Image {
                smooth: true
                layer.samples: 8
                sourceSize: Qt.size(30, 30)

                layer.enabled: true
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "/insta.png"
            }
        }
    }

    Button {
        text: qsTr("Don't have an account? Sign up")
        flat: true
        Layout.alignment: Qt.AlignCenter
    }
}
