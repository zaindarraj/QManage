pragma ComponentBehavior: Bound
import QtQuick


Item {
    id: rootButton
    required property string text
    signal buttonClicked()



Loader{
    id: crossPlatformButtonLoader
    sourceComponent : Qt.platform.os  == "android" ? androidButton : desktopButton
}

Component{
    id: androidButton
    AndroidButton{
        text :rootButton.text
        onClicked : rootButton.buttonClicked
    }
}

Component{
        id: desktopButton
        DesktopButton{
            text :rootButton.text
            onClicked : rootButton.buttonClicked

        }
    }

}
