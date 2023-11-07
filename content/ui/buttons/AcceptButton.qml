import QtQuick 2.15
import QtQuick.Controls

Button {
    id: accept_button
    width: parent.width
    height: parent.height

    property alias labelText: label.text
    property alias labelColor: label.color

    contentItem: Text {
        id: label
        text: 'Применить'
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font {
            pointSize: 12
            bold: true
        }
    }

    background: Rectangle {
        anchors.fill: parent
        radius: accept_button.height / 2
        clip: true
        color: 'lightgreen'
    }
}
