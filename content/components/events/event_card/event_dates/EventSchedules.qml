import QtQuick 2.15
import QtQuick.Controls
import KudaGo
import '../../../../services/helpers/date_helpers.js' as DateTools

Item {
    id: event_schedules
    width: parent.width - schedules_container.anchors.leftMargin
    height: schedules_container.childrenRect.height

    required property var eventSchedules
    property alias containerLeftMargin: schedules_container.anchors.leftMargin

    Column {
        id: schedules_container
        anchors {
            left: parent.left
            leftMargin: 0
            right: parent.right
        }

        Repeater {
            id: schedules
            width: parent.width
            model: Object
                .entries(DateTools.getBeautifiedSchedule(eventSchedules))
                .map(([key, value]) => {
                    return {day: key, times: value}
                })
            delegate: Label {
                text: `<b>${modelData['day']}: </b><span>${modelData['times'].join(', ')}</span>`
                wrapMode: Text.WordWrap
                width: schedules.width
                color: Constants.secondaryColor
                font {
                    pointSize: 14
                }
            }
        }
    }
}
