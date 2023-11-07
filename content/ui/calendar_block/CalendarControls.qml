import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
import KudaGo
import '..'

Item {
    id: navigation_container
    Layout.fillWidth: true
    height: 80

    required property var calendarId

    IconButton {
        id: previous_button
        size: parent.height
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }

        url: Constants.getIcon('Previous')
        onButtonClicked: () => {
            if (calendarId.month === Calendar.January) {
                calendarId.month = Calendar.December
                calendarId.year -= 1
            } else {
                calendarId.month -= 1
            }
        }
    }

    Text {
        id: current_date_label
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }

        text: calendarId.title.charAt(0).toUpperCase() + calendarId.title.slice(1)
        font {
            bold: true
            pointSize: 16
        }
        opacity: 0.5
        color: Constants.secondaryColor
    }

    IconButton {
        id: next_button
        size: parent.height
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }

        url: Constants.getIcon('Next')
        onButtonClicked: () => {
            if (calendarId.month === Calendar.December) {
                calendarId.month = Calendar.January
                calendarId.year += 1
            } else {
                calendarId.month += 1
            }
        }
    }
}
