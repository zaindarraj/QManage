import QtQuick
import QManage
import Welcome
import Android

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QManage")

    SplashScreenController {
        id: splashScreenController
    }

    Loader {
        anchors.fill: parent
        sourceComponent: welcome
        asynchronous: true
        visible: status == Loader.Ready
        onLoaded: {
            if (Qt.platform.os == "android") {
                splashScreenController.removeSplashScreen()
            }
        }
    }
    Component {
        id: welcome
        Welcome {
            anchors.centerIn: parent
        }
    }
}
