import QtQuick 2.15
import KudaGo
import '../../ui'
import '../../services/events.js' as EventsTools

Rectangle {
    id: event_short_info
    width: events_list.width
    height: Math.max(title.height + event_publication_date.height + info_row_block.anchors.margins * 2, event_icon.height)
    color: Constants.mainColor
    radius: 6
    clip: true

    Row {
        id: info_row_block
        anchors {
            fill: parent
            margins: 10
        }
        spacing: 10

        Icon {
            id: event_icon
            iconUrl: Constants.getIcon(modelData['is_free'] ? 'Ticket_Free' : 'Ticket', false)
            height: 100
            width: height
        }

        Column {
            id: event_info
            width: event_short_info.width - event_icon.width
            height: event_short_info.height
            spacing: 2

            Text {
                id: title
                text: modelData['title'].charAt(0).toUpperCase() + modelData['title'].slice(1)
                font {
                    bold: true
                    pointSize: 16
                }
                wrapMode: Text.WordWrap
                elide: Text.ElideRight
                width: event_info.width - info_row_block.anchors.margins * 2
                color: Constants.secondaryColor
            }
            Text {
                id: event_publication_date
                text: modelData['short_title'] || modelData['description']
                font {
                    pointSize: title.font.pointSize * 0.8
                }
                opacity: 0.6
                wrapMode: modelData['short_title'] ? title.wrapMode : Text.NoWrap
                elide: title.elide
                width: title.width - 10
                color: title.color
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (pages_stack.currentItem.objectName === Constants.favouriteEventsPageName) {
                pages_stack.push(
                    '../../pages/EventPage.qml',
                    { selectedEventData: EventsStore.events.favouriteItems[index] }
                )

                EventsTools.getEventById(
                    modelData['id'],
                    (response) => {
                        events_service.updateFavouriteEventById(modelData['id'], {data: response})
                    }
                )
                return
            }

            EventsTools.getEventById(
                modelData['id'],
                (response) => {
                    EventsStore.selectedEvent = response
                    pages_stack.push('../../pages/EventPage.qml', { selectedEventData: EventsStore.selectedEvent })
                }
            )
        }
    }
}
