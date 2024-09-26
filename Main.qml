import QtQuick
import QManage
import Welcome
import Android
import QtQuick.Controls

Window {
    id: rootWindow
    width: 640
    height: 480
    minimumHeight: 480
    minimumWidth: 640
    visible: true
    color: systemTheme.mid
    title: qsTr("QManage")
    Component.onCompleted: {
        if (Qt.platform.os === "android") {
            Material.accent = Material.Teal
        }
    }

    SystemPalette {
        id: systemTheme
        colorGroup: SystemPalette.Active
    }

    SplashScreenController {
        id: splashScreenController
    }

    Loader {
        anchors.fill: parent
        sourceComponent: welcome
        asynchronous: true
        visible: status == Loader.Ready
        onLoaded: {
            if (Qt.platform.os === "android") {
                splashScreenController.removeSplashScreen()
            }
        }
    }
    Component {
        id: welcome
        Welcome {}
    }
}
