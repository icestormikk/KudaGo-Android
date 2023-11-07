import QtQuick 2.15
import QtQuick.Controls

Button {
    id: loading_button
    width: parent.width
    height: parent.height
    enabled: !isLoading

    property alias labelText: label.text
    property alias labelColor: label.color

    property bool isLoading: false

    background: Rectangle {
        id: button_background
        anchors.fill: parent
        radius: isLoading ? 0 : loading_button.height / 2
        clip: true
        color: isLoading ? 'transparent' : 'lightgreen'

        Row {
            anchors.centerIn: parent

            BusyIndicator {
                visible: isLoading
                running: isLoading
                height: loading_button.height
                width: height
            }

            Text {
                id: label
                visible: !isLoading
                anchors.verticalCenter: parent.verticalCenter
                text: 'Загрузить'
                font {
                    pointSize: 16
                    bold: true
                }
            }
        }

        Behavior on radius {
            NumberAnimation { duration: 100 }
        }
    }
}
