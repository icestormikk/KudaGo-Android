import QtQuick 2.15
import QtQuick.Controls
import KudaGo

ListView {
    id: parameters_block

    required property var items
    required property var swipeContainer

    width: parent.width
    height: 600
    spacing: 8
    model: items
    delegate: Button {
        width: parent.width
        height: parameter_name.height

        Text {
            id: parameter_name
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
            }

            text: `${modelData[1].name}: `
            font {
                pointSize: 18
            }
            color: Constants.secondaryColor
            wrapMode: Text.WordWrap
            width: parent.width / 3
        }

        Text {
            id: parameter_value
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }

            text: modelData[1].onShow()
            font: parameter_name.font
            opacity: 0.6
            color: parameter_name.color
            horizontalAlignment: Text.AlignRight
        }

        background: Rectangle {
            anchors.fill: parent
            color: 'transparent'
        }

        onClicked: {
            swipeContainer.setCurrentIndex(index)
        }
    }
}
