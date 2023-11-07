import QtQuick 2.15

Rectangle {
    id: icon_container

    property alias iconUrl: icon.source
    property alias bgColor: icon_container.color
    property alias iconMargins: icon.anchors.margins

    color: 'transparent'
    radius: 10

    Image {
        id: icon
        anchors {
            fill: parent
        }
        smooth: true

        fillMode: Image.PreserveAspectFit
    }
}
