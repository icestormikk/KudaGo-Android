import QtQuick 2.15
import QtQuick.Controls
import KudaGo
import '../components/events'
import '../components/search_widget'
import '../components'

Page {
    id: search_page
    objectName: Constants.searchPageName

    background: Rectangle {
        anchors.fill: parent
        color: 'transparent'
    }

    header: Item {
        id: search_header
        width: parent.width
        height: 180

        ClosedSearchList {
            anchors {
                fill: parent
                margins: 20
            }

            onClick: () => {
                popup_window.content = Qt.resolvedUrl('../components/search_widget/SearchWidget.qml')
                popup_window.modalTitle = 'Поиск событий'
                popup_window.open()
            }
        }

        Behavior on height {
            NumberAnimation { duration: 500 }
        }
    }

    EventsList {
        anchors.leftMargin: 10
        anchors.rightMargin: 10

        events: EventsStore.events.items
        nextPageLink: EventsStore.next
    }
}
