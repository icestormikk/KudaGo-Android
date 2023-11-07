import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import KudaGo
import '../../ui'

Rectangle {
    id: block

    property alias title: header.text
    property alias headerColor: block_header.color
    property alias contentUrl: block_content.source
    property alias contentColor: block.color

    property bool isOpened: false
    property string iconTitle

    width: parent.width
    height: block_header.height
    clip: true
    color: '#64CCC5'

    Column {
        anchors.fill: parent

        Rectangle {
            id: block_header
            width: parent.width
            height: 40
            color: '#2E97A7'

            Row {
               anchors {
                   left: parent.left
                   leftMargin: 10
                   verticalCenter: parent.verticalCenter
               }
               spacing: 10

               Icon {
                   id: logo
                   width: block_header.height - 10
                   height: logo.width
                   iconUrl: Constants.getIcon(iconTitle)
               }

               Text {
                   id: header
                   anchors {
                       verticalCenter: parent.verticalCenter
                   }

                   font {
                       weight: 400
                       pointSize: 12
                       bold: true
                   }
                   color: 'black'
               }
            }

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    isOpened = !isOpened
                }
            }
        }

        Loader {
            id: block_content
            width: parent.width
            height: block_content.source.height
            source: ''
        }
    }

    states: [
        State {
            name: "isOpened"
            when: isOpened
            PropertyChanges {
                target: block
                height: block_header.height + block_content.height
            }
        },
        State {
            name: "isClosed"
            when: !isOpened
            PropertyChanges {
                target: block
                height: block_header.height
            }
        }
    ]
    Behavior on height {
        NumberAnimation { duration: 100 }
    }
}
