import QtQuick 2.15
import QtQuick.Controls
import KudaGo
import '../ui'

Popup {
    id: popup_window
    x: 0
    y: 0
    width: Screen.width
    height: Screen.height
    visible: true

    property string content: content_loader.source
    property alias modalTitle: modal_title.text

    background: Rectangle {
        anchors.fill: parent
        color: Qt.rgba(0, 0, 0, 0.7)
    }

    Rectangle {
        id: wrap
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 20
            right: parent.right
            rightMargin: 20
        }
        height: content_loader.height + modal_header.height + anchors.leftMargin * 2

        color: Constants.mainColor
        radius: 10

        Column {
            id: modal_content
            anchors.fill: parent

            Item {
                id: modal_header
                width: parent.width
                height: 100

                Label {
                    id: modal_title
                    anchors {
                        left: parent.left
                        leftMargin: 10
                        verticalCenter: parent.verticalCenter
                    }
                    text: 'Modal Title'
                    font {
                        bold: true
                        pointSize: 18
                    }
                    color: Constants.secondaryColor
                }

                IconButton {
                    anchors {
                        right: parent.right
                        rightMargin: 10
                        verticalCenter: parent.verticalCenter
                    }
                    size: Math.max(parent.height - 10, 30)
                    url: Constants.getIcon('Close')

                    onButtonClicked: () => {
                        popup_window.close()
                    }
                }
            }

            Loader {
                id: content_loader
                height: content.height
                width: parent.width
                source: content
            }
        }
    }
}
