import QtQuick 2.15
import QtQuick.Controls
import KudaGo
import '../../ui'

Item {
    id: home_section_item
    width: 600
    height: collection_image.height + collection_title.height + collection_description.height

    Column {
        anchors.fill: parent

        Rectangle {
            id: collection_image
            width: parent.width
            height: width
            radius: 10
            color: modelData['bgColor']
            clip: true

            border {
                width: 1
                color: 'lightgray'
            }

            Icon {
                id: logo
                width: parent.width / 2
                height: width
                anchors.centerIn: parent
                iconUrl: Constants.getIcon(modelData['image'], false)
            }
        }

        Label {
            id: collection_title
            text: modelData['title']
            font {
                bold: true
                pointSize: 16
            }
            color: Constants.secondaryColor
        }
        Label {
            id: collection_description
            text: modelData['description']
            font {
                pointSize: 14
            }
            color: Constants.secondaryColor
            opacity: 0.5
            width: parent.width
            wrapMode: Text.WordWrap
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
           pages_stack.push(modelData['pageAddress'])
        }
    }
}
