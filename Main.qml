import QtQuick
import QManage
import Welcome

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QManage")

    Welcome {
        anchors.centerIn: parent
    }
}
