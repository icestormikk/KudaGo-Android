import QtQuick 2.15
import QtQuick.Controls.Fusion
import QtQuick.Effects
import KudaGo

Rectangle {
    id: control_container

    property alias size: control_container.width
    property alias bgColor: control_container.color
    property alias url: image.source
    property alias isEnabled: control.enabled

    property bool isRounded: false
    property var onButtonClicked: () => {}

    width: 20
    height: width
    color: 'transparent'
    radius: isRounded ? width / 2 : 0
    opacity: isEnabled ? 1 : 0.5

    Button {
        id: control
        flat: true
        anchors.fill: parent
        onClicked: {
            onButtonClicked()
        }

        contentItem: Image {
            id: image
            source: control.icon.source
        }

        background: MultiEffect {
            source: image
            anchors.fill: control
            visible: control.down
            opacity: 0.5
            shadowEnabled: true
            blurEnabled: true
            blur: 0.5
        }
    }
}
