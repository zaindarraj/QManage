import QtQuick
import QManage
import Welcome
import Android

Window {
    id: rootWindow
    width: 640
    height: 480
    minimumHeight: height
    minimumWidth: width
    visible: true
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
