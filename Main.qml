import QtQuick
import QManage
import Welcome
import Android

Window {
    id: rootWindow
    width: 640
    height: 480
    minimumHeight: 480
    minimumWidth: 640
    visible: true
    color: systemTheme.mid
    title: qsTr("QManage")

    SystemPalette {
        id: systemTheme
        colorGroup: SystemPalette.Active
    }

    SplashScreenController {
        id: splashScreenController
    }

    Loader {
        width: rootWindow.width
        height: rootWindow.height
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
