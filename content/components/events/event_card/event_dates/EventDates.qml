import QtQuick 2.15
import QtQuick.Controls
import Qt.labs.qmlmodels
import KudaGo
import '../../../../ui'
import '../../../../services/helpers/date_helpers.js' as DateTools

Page {
    id: event_schedule
    objectName: 'eventSchedule'

    background: Rectangle {
        anchors.fill: parent
        color: 'transparent'
    }

    required property var eventDates

    ListView {
        id: event_list_dates
        anchors {
            top: parent.top
            topMargin: 20
            right: parent.right
            rightMargin: 20
            left: parent.left
            leftMargin: 20
        }
        height: event_pages_stack.height
        clip: true
        spacing: 6

        model: eventDates
        delegate: Column {
            width: event_list_dates.width
            height: start_end_dates_container.height + schedules.height
            opacity: modelData['end'] * 1000 < new Date().getTime() ? 0.3 : 1

            function getFormatedDateTime(datetime) {
                const isSchedulesExist = (modelData['schedules'] !== undefined) && modelData['schedules'].length > 0
                const format = 'dd.MM.yyyy' + (!isSchedulesExist ? ' - HH:mm' : '')

                return Qt.formatDateTime(datetime, format)
            }

            Row {
                id: start_end_dates_container
                width: parent.width
                height: Math.max(start_end_dates.height, date_icon.height) + 10
                spacing: 6

                Icon {
                    id: date_icon
                    anchors.verticalCenter: parent.verticalCenter

                    iconUrl: Constants.getIcon('Time')
                    width: 80
                    height: width
                }

                Label {
                    id: start_end_dates
                    anchors.verticalCenter: parent.verticalCenter
                    text: `<b>С</b> ${getFormatedDateTime(new Date(modelData['start'] * 1000))} <b>до</b> ${getFormatedDateTime(new Date(modelData['end'] * 1000))}`
                    wrapMode: Text.WordWrap
                    width: parent.width - parent.spacing
                    color: Constants.secondaryColor
                    font {
                        pointSize: 16
                    }
                }
            }

            EventSchedules {
                id: schedules
                eventSchedules: modelData['schedules'] || []
                containerLeftMargin: date_icon.width + start_end_dates_container.spacing
            }
        }
    }
}
