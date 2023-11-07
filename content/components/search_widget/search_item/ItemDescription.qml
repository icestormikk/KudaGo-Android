import QtQuick 2.15
import KudaGo

Text {
    id: search_item_description

    required property var container
    property alias textPointSize: search_item_description.font.pointSize
    property alias description: search_item_description.text

    width: container.width
    color: Constants.secondaryColor
    opacity: 0.5
    font {
        pointSize: 16
    }
    text: 'Example Description'
    wrapMode: Text.Wrap
}
