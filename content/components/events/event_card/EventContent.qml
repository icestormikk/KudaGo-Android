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
            id: event_nav_panel
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
                        element: 'EventTitleDescription.qml',
                        properties: {
                            eventTitle: eventData['title'].charAt(0).toUpperCase() + eventData['title'].slice(1),
                            eventDescription: eventData['body_text']
                        }
                    },
                    {
                        title: 'Дата и время',
                        element: 'event_dates/EventDates.qml',
                        properties: {
                            eventDates: eventData['dates'].sort((date1, date2) =>
                                new Date(date2.end * 1000).getTime() - new Date(date1.end * 1000).getTime()
                            )
                        }
                    },
                    {
                        title: 'Локация',
                        element: 'event_location/EventMapPlace.qml',
                        properties: {
                            eventLocationData: { location: eventData['location'], place: eventData['place'] }
                        }
                    },
                    {
                        title: 'Доп. информация',
                        element: 'EventAdditionalAttributes.qml',
                        properties: {
                            selectedEventData: eventData
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
            height: parent.height - event_nav_panel.height - parent.spacing * 3
            initialItem: EventTitleDescription {
                id: event_page
                eventTitle: eventData['title'].charAt(0).toUpperCase() + eventData['title'].slice(1)
                eventDescription: eventData['body_text']
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
