import QtQuick 2.15
import QtQuick.Controls
import KudaGo
import '../services/events.js' as EventsTools
import '../ui'
import '../components/events'

Page {
    id: today_events_page
    objectName: Constants.todayEventsPageName

    background: Rectangle {
        anchors.fill: parent
        color: 'transparent'
    }

    property var eventsData
    property string nextPageUrl

    ScrollView {
        id: favourite_events_list
        anchors {
            fill: parent
            margins: 20
        }

        Column {
            anchors.fill: parent

            Row {
                id: collection_titles_block
                width: parent.width
                spacing: 10

                Rectangle {
                    id: collection_icon
                    height: 220
                    width: height
                    radius: 4
                    clip: true
                    color: '#f2c4bf'
                    border {
                        width: 1
                        color: 'lightgray'
                    }

                    Icon {
                        height: parent.height
                        width: height
                        iconUrl: Constants.getIcon('Today', false)
                        iconMargins: 10
                    }
                }

                Column {
                    width: parent.width - collection_icon.width
                    height: parent.height
                    spacing: 2

                    Label {
                        id: today_events_title
                        text: 'События дня'
                        font {
                            bold: true
                            pointSize: 18
                        }
                        color: Constants.secondaryColor
                    }
                    Label {
                        id: today_events_description
                        text: 'Список событий в различных городах России, которые вы можете посетить прямо сегодня. Актуально на <b>' + Qt.formatDate(new Date(), 'dd.MM.yyyy') + '</b>'
                        font {
                            pointSize: 14
                        }
                        opacity: 0.6
                        width: parent.width - 10
                        wrapMode: Text.WordWrap
                        elide: "ElideRight"
                        color: today_events_title.color
                    }
                }
            }

            Item {
                width: parent.width
                height: parent.height - collection_titles_block.height

                EventsList {
                    anchors {
                        topMargin: 40
                    }

                    events: eventsData
                    nextPageLink: nextPageUrl
                }
            }
        }
    }

    Component.onCompleted: {
        EventsTools.getTodayEvents(
            ({events, next, previous}) => {
                eventsData = [...events]
                nextPageUrl = next
            }
        )
    }
}
