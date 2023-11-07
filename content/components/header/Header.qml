import QtQuick 2.15
import QtQuick.Controls
import KudaGo
import '../../ui'

Item {
    id: header
    width: parent.width
    height: 180

    Item {
        anchors {
            fill: parent
            leftMargin: 40
            rightMargin: 40
            topMargin: 10
            bottomMargin: 10
        }

        Label {
            id: title
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
            }

            text: Constants.applicationTitle
            color: Constants.secondaryColor
            font {
                weight: 600
                pointSize: 30
            }
        }

        IconButton {
            id: settings_button
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
            }

            url: Constants.getIcon('Settings')
            size: Math.min(parent.height, 120)
        }
    }
}
