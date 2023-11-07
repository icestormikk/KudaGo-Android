import QtQuick 2.15
import QtQuick.Controls
import KudaGo

Page {
    id: event_main_info_page
    objectName: 'eventTitleDescription'

    required property string eventTitle
    required property string eventDescription

    background: Rectangle {
        anchors.fill: parent
        color: 'transparent'
    }

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
            id: event_content
            anchors.fill: parent
            spacing: 10

            Item {
                id: event_main_info
                width: event_content.width
                height: event_title.height

                Label {
                    id: event_title
                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                    }

                    width: event_content.width * 0.9
                    text: eventTitle
                    font {
                        bold: true
                        pointSize: 18
                    }
                    wrapMode: Text.WordWrap
                    color: Constants.secondaryColor
                    onLinkActivated: (link) => {
                        Qt.openUrlExternally(link)
                    }
                }
            }

            Text {
                id: event_short_description
                textFormat: Text.RichText
                text: eventDescription
                font.pointSize: 14
                width: event_content.width
                wrapMode: Text.WordWrap
                color: event_title.color
            }
        }
    }
}
