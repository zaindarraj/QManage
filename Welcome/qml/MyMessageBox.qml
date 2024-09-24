import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Shapes

Rectangle {
    id: messageBox
    color: Qt.hsla(systemTheme.dark.hslHue, systemTheme.dark.hslSaturation,
                   systemTheme.dark.hslLightness, 0.9)
    border.color: systemTheme.accent
    border.width: 1
    width: text.width + 20
    height: text.height + 20
    radius: 5
    opacity: 0
    property string textMessage

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
        color: systemTheme.text
        text: textMessage
    }
}
