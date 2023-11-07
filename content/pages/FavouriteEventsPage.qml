import QtQuick 2.15
import QtQuick.Controls
import KudaGo
import '../components/events'

Page {
    id: favourite_events_page
    objectName: Constants.favouriteEventsPageName

    background: Rectangle {
        anchors.fill: parent
        color: 'transparent'
    }

    ScrollView {
        id: favourite_events_list
        anchors {
            fill: parent
            margins: 10
        }

        Column {
            anchors.fill: parent

            Label {
                id: page_title
                text: 'Избранные мероприятия'
                anchors.leftMargin: 10
                font {
                    weight: 800
                    pointSize: 20
                }
                wrapMode: Text.WordWrap
                width: parent.width
                elide: "ElideRight"
                color: Constants.secondaryColor
            }
            Label {
                id: page_description
                text: 'Список всех мероприятий, которые Вы когда-то сохранили'
                font {
                    pointSize: 16
                }
                wrapMode: Text.WordWrap
                width: parent.width
                elide: "ElideRight"
                opacity: 0.5
                color: page_title.color
            }

            Item {
                width: parent.width
                height: parent.height - page_title.height - page_description.height

                EventsList {
                    anchors {
                        topMargin: 10
                    }

                    events: EventsStore.events.favouriteItems
                }
            }
        }
    }
}
