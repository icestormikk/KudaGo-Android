import QtQuick 2.15
import QtQuick.Controls
import KudaGo

Label {
    id: day_label
    width: parent.width / 7
    height: width

    required property var calendarId
    property var isSelected: (date) => {}

    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    opacity: model.month === grid.month ? 1 : 0.3
    color: model.today ? 'green' : (isSelected(model.date) ? 'white' : Constants.secondaryColor)
    text: calendarId.locale.toString(model.date, "dd")
    font {
        bold: model.today || isSelected(model.date)
        pointSize: 14
    }
    background: Rectangle {
        id: day_bg
        color: isSelected(model.date) ? '#59c260' : (isBetweenSelectedDates(model.date) ? 'lightgreen' : 'transparent')
        border {
            width: model.today ? 1 : 0
            color: '#59c260'
        }

        radius: 4
        clip: true
    }
    required property var model

    MouseArea {
        anchors.fill: parent
        onClicked:  {
            if (calendar_block.selectedDates.length === 2) {
                calendar_block.selectedDates = []
            }

            calendar_block.selectedDates = [...calendar_block.selectedDates, model.date]
        }
    }
}
