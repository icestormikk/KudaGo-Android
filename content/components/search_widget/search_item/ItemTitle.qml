import QtQuick 2.15
import KudaGo

Item {
    id: item_title

    property alias text: title.text
    property alias textPointSize: title.font.pointSize

    width: parent.width
    height: title.height

    Text {
        id: title
        anchors.centerIn: parent

        color: Constants.secondaryColor
        font {
            bold: true
            pointSize: 20
        }
        text: 'Example Title'
        wrapMode: Text.WrapAnywhere
    }
}
