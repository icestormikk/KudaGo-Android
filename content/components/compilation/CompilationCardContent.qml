import QtQuick 2.15
import QtQuick.Controls
import KudaGo

Rectangle {
    id: content_block

    color: Constants.mainColor
    clip: true

    Column {
        anchors.fill: parent
        spacing: 80

        Item {
            id: compilation_nav_panel
            width: parent.width - content_block.radius * 2
            height: content_block.radius * 1.5
            anchors.horizontalCenter: parent.horizontalCenter

            ListView {
                id: titles
                anchors {
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }
                height: parent.height / 2
                spacing: 40

                orientation: ListView.Horizontal
                model: [
                    {
                        title: 'Описание',
                        element: 'CompilationInfo.qml',
                        properties: {
                            compilationTitle: compilationData['title'].charAt(0).toUpperCase() + compilationData['title'].slice(1),
                            compilationDescription: compilationData['description']
                        }
                    },
                    {
                        title: `Подборка (${compilationData['items'].length})`,
                        element: 'CompilationElements.qml',
                        properties: {
                            compilationItems: compilationData['items']
                        }
                    }
                ]
                delegate: Label {
                    text: modelData['title']
                    font {
                        bold: true
                        pointSize: 20
                    }
                    color: Constants.secondaryColor
                    opacity: ListView.isCurrentItem ? 1 : 0.5

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            titles.currentIndex = index
                            event_pages_stack.push(modelData['element'], modelData['properties'])
                        }
                    }
                }
            }
        }

        StackView {
            id: event_pages_stack
            width: parent.width
            height: parent.height - compilation_nav_panel.height
            initialItem: CompilationInfo {
                id: event_page
                compilationTitle: compilationData['title'].charAt(0).toUpperCase() + compilationData['title'].slice(1)
                compilationDescription: compilationData['description']
            }
        }
    }

    Rectangle {
        z: -1
        y: parent.height / 2
        height: parent.height / 2
        width: parent.width
        color: Constants.mainColor
    }
}
