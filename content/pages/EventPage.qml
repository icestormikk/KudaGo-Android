import QtQuick 2.15
import QtQuick.Controls
import KudaGo
import '../components/events'
import '../ui/buttons'

Page {
    id: event_page
    objectName: Constants.eventPageName

    property var selectedEventData

    background: Rectangle {
        anchors.fill: parent
        color: 'lightgray'
    }

    ScrollView {
        id: event_scroll_view
        anchors {
            fill: parent
        }
        ScrollBar.vertical: ScrollBar { width: 0 }

        Column {
            anchors.fill: parent

            Loader {
                id: card_loader
                width: event_scroll_view.width
            }
        }

        BusyIndicator {
            anchors.centerIn: parent
            width: parent.width / 2
            height: width
            running: card_loader.status !== Loader.Ready
        }
    }

    onSelectedEventDataChanged: {
        const isLoaded = selectedEventData !== undefined

        if (isLoaded) {
            card_loader.setSource('../components/events/event_card/EventCard.qml', {eventData: selectedEventData})
        }
    }
}
