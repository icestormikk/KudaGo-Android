import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import KudaGo
import '..'

ColumnLayout {
    id: calendar_block

    property var selectedDates: [new Date(), new Date()]

    function isDateSelected(date) {
        return selectedDates.some((d) => date.getTime() === d.getTime())
    }
    function isBetweenSelectedDates(date) {
        if (selectedDates.length !== 2) {
            return false
        }
        selectedDates.sort((a, b) => a.getTime() - b.getTime())

        return selectedDates[0].getTime() < date.getTime() && selectedDates[1].getTime() > date.getTime()
    }

    CalendarControls {
        calendarId: grid
    }

    DayOfWeekRow {
        locale: grid.locale
        Layout.fillWidth: true
        delegate: Text {
            text: shortName
            font {
                bold: true
                pointSize: 16
            }

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: Constants.secondaryColor

            required property string shortName
        }
    }

    MonthGrid {
        id: grid
        Layout.fillWidth: true

        month: new Date().getMonth()
        year: new Date().getFullYear()
        locale: Qt.locale("ru")

        delegate: CalendarDelegate {
            calendarId: grid
            isSelected: isDateSelected
        }
    }
}
