import QtQuick 2.15
import QtQuick.Controls
import KudaGo
import '../../services/events.js' as EventsTools
import '../../components'
import '../../ui/buttons'
import '../../ui'

Item {
    id: events_list_container
    anchors.fill: parent

    required property var events

    readonly property bool isLoading: !Boolean(events)

    property var selectedEvent
    property string nextPageLink

    ScrollView {
        id: view
        anchors {
            fill: parent
            leftMargin: 20
            rightMargin: 20
            bottomMargin: 10
        }
        visible: events && events.length > 0

        Column {
            width: view.width
            height: view.height
            spacing: 20

            Item {
                visible: isLoading
                width: parent.width
                height: parent.height

                BusyIndicator {
                    anchors.centerIn: parent
                    running: isLoading
                }
            }

            Repeater {
                id: events_list
                visible: !isLoading
                width: parent.width
                height: parent.height - load_more_button.height

                model: events
                delegate: EventShortCard {}
            }

            Item {
                id: load_more_button
                width: parent.width
                height: 100

                LoadingButton {
                    id: load_button
                    visible: Boolean(nextPageLink)

                    onClicked: {
                        load_button.isLoading = true
                        EventsTools.appendEvents(String(nextPageLink), () => { load_button.isLoading = false })
                    }
                }
            }
        }
    }

    Item {
        anchors.fill: parent
        visible: !(events && events.length > 0)

        Column {
            anchors.centerIn: parent

            Label {
                text: 'Не найдено ни одного события :('
                font {
                    bold: true
                    pointSize: 20
                }
                width: parent.width
                wrapMode: Text.WordWrap
                horizontalAlignment: "AlignHCenter"
                color: Constants.secondaryColor
            }
        }
    }
}
