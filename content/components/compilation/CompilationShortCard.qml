import QtQuick 2.15
import KudaGo
import '../../ui'

Rectangle {
    id: compilation_item
    width: parent.width
    height: Math.max(compilation_icon.height, title.height) + compilation_block.anchors.margins * 2 + 20

    color: Constants.mainColor
    radius: 6
    clip: true

    Row {
        id: compilation_block
        anchors {
            fill: parent
            margins: 10
        }
        spacing: 10

        Icon {
            id: compilation_icon
            iconUrl: Constants.getIcon('Tickets', false)
            height: 100
            width: height
        }

        Text {
            id: title
            anchors.verticalCenter: parent.verticalCenter
            text: modelData['title'].charAt(0).toUpperCase() + modelData['title'].slice(1)
            font {
                bold: true
                pointSize: 16
            }
            wrapMode: Text.WordWrap
            elide: Text.ElideRight
            width: compilation_block.width - compilation_icon.width - compilation_block.anchors.margins * 2
            color: Constants.secondaryColor
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            pages_stack.push('../../pages/CompilationPage.qml', {compilationId: modelData['id']})
        }
    }
}
