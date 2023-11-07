import QtQuick 2.15
import QtQuick.Controls
import KudaGo
import '../../ui'

Item {
    id: footer_button_conatainer
    width: button_container.width
    height: button_container.height
    opacity: pages_stack.currentItem.objectName === pageName ? 1 : 0.5

    required property string buttonUrl
    required property string pageName
    required property string iconTitle
    required property string iconLocalizedTitle

    Column {
        id: button_container

        Icon {
            id: footer_button
            anchors.horizontalCenter: parent.horizontalCenter
            iconUrl: Constants.getIcon(iconTitle)
            width: 80
            height: width
        }
        Label {
            id: footer_label
            anchors.horizontalCenter: parent.horizontalCenter
            text: iconLocalizedTitle
            font {
                bold: true
                pointSize: 16
            }
            color: Constants.secondaryColor
        }
    }

    MouseArea {
        width: parent.width
        height: parent.height

        onClicked: {
            pages_stack.push(buttonUrl)
        }
    }
}
