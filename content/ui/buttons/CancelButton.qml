import QtQuick 2.15
import KudaGo
import '..'

IconButton {
    id: cancel_button

    property alias onClicked: cancel_button.onButtonClicked
    property bool isLight: false

    anchors {
        right: parent.right
        verticalCenter: parent.verticalCenter
    }

    size: parent.height - 10
    url: Constants.getIcon(`Close${isLight ? '_Dark' : ''}`, false)
}
