import QtQuick
import QManage
import Welcome
import Android
import QtQuick.Controls

ApplicationWindow {
    id: rootWindow
    width: 640
    height: 480
    minimumHeight: 480
    minimumWidth: 640
    visible: true
    color: systemTheme.mid
    title: qsTr("QManage")

    SignInViewModel {
        id: signInViewModel
        onSuccessfull: {
            console.log("Hey")
        }
        onError: error => {
                     console.log(error)
                 }
    }

    function getTextColor() {
        if (Qt.platform.os === "android") {
            return Material.primaryTextColor
        } else {
            return systemTheme.text
        }
    }

    Component.onCompleted: {
        if (Qt.platform.os === "android") {
            Material.theme = Material.System
            Material.primary = Material.Teal
            Material.accent = Material.BlueGrey
        }
    }

    SystemPalette {
        id: systemTheme
        colorGroup: SystemPalette.Active
        onColorGroupChanged: {
            mainLoader.sourceComponent = undefined
            mainLoader.sourceComponent = welcome
        }
    }

    SplashScreenController {
        id: splashScreenController
    }

    Loader {
        id: mainLoader
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
        Welcome {
            anchors.fill: parent
        }
    }
}
