import QtQuick 2.15
import QtQuick.Controls
import KudaGo

Page {
    id: compilation_info_page
    objectName: 'compilationInfoPage'

    background: Rectangle {
        anchors.fill: parent
        color: 'transparent'
    }

    required property string compilationTitle
    required property string compilationDescription

    ScrollView {
        anchors {
            top: parent.top
            topMargin: 20
            right: parent.right
            rightMargin: 20
            left: parent.left
            leftMargin: 20
        }
        height: event_pages_stack.height

        Column {
            id: compilation_content
            anchors.fill: parent
            spacing: 10

            Item {
                id: compilation_main_info
                width: compilation_content.width
                height: title.height

                Label {
                    id: title
                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                    }

                    width: compilation_content.width * 0.9
                    text: compilationTitle
                    font {
                        bold: true
                        pointSize: 18
                    }
                    wrapMode: Text.WordWrap
                    color: Constants.secondaryColor
                }
            }

            Text {
                id: compilation_description
                textFormat: Text.RichText
                text: compilationDescription
                font.pointSize: 14
                width: compilation_content.width
                wrapMode: Text.WordWrap
                color: title.color
            }
        }
    }
}
