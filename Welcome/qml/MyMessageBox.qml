import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material
import QtQuick.Controls
import QtQuick.Shapes

Rectangle {
    id: messageBox
    color: Qt.platform.os == "android" ? Material.background: Qt.hsla(systemTheme.dark.hslHue, systemTheme.dark.hslSaturation,
                   systemTheme.dark.hslLightness, 0.9)
    border.color: getAccent()
    border.width: 1
    width: text.width + 20
    height: text.height + 20
    radius: 5
    opacity: 0
    property string textMessage

    function getColorWithAlpha(alpha) {
        if (Qt.platform.os === "android") {
            return Qt.hsla(Material.backgroundDimColor.hslHue,
                           Material.backgroundDimColor.hslSaturation,
                           Material.backgroundDimColor.hslLightness, 0.9)
        }
        return Qt.hsla(systemTheme.dark.hslHue, systemTheme.dark.hslSaturation,
                       systemTheme.dark.hslLightness, 0.9)
    }

    function getAccent() {
        if (Qt.platform.os === "android") {
            return Material.accent
        }
        return systemTheme.accent
    }

    function startAnimation() {
        if (messageAnimation.running) {
            messageAnimation.complete()
        }
        messageAnimation.start()
    }

    SequentialAnimation {
        id: messageAnimation
        running: false

        OpacityAnimator {
            target: messageBox
            to: 1
            duration: 500
        }

        PauseAnimation {
            duration: 2000
        }
        OpacityAnimator {
            target: messageBox
            from: 1
            to: 0
            duration: 500
        }
    }

    Text {
        id: text
        anchors.centerIn: parent
        color: Qt.platform.os == "android" ?  Material.accent: systemTheme.accent
        text: messageBox.textMessage
    }
}
