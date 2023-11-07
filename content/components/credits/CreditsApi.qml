import QtQuick 2.15
import QtQuick.Controls
import KudaGo
import '../../ui'

Item {
    id: credits_api_block
    width: parent.width
    height: childrenRect.height + 10

    Row {
        anchors {
            left: parent.left
            leftMargin: 10
            right: parent.right
            rightMargin: 10
        }
        spacing: 10

        Column {
            width: parent.width - kudago_logo.width - parent.spacing
            spacing: 4

            Label {
                width: parent.width
                font {
                    weight: 900
                    pointSize: 18
                }
                text: 'KudaGo API'
                color: Constants.secondaryColor
            }
            Label {
                width: parent.width
                font {
                    pointSize: 16
                }
                text: 'Приложение использует данные, получаемые от KudaGo API. Сервис предоставлен сайтом <a href="https://kudago.com/"><b>kudago.com</b></a>.'
                wrapMode: Text.WordWrap
                opacity: 0.8
                onLinkActivated: (link) => {
                    Qt.openUrlExternally(link)
                }
                color: Constants.secondaryColor
            }
        }

        Icon {
            id: kudago_logo
            height: 200
            width: height
            anchors.verticalCenter: parent.verticalCenter
            iconUrl: Constants.getIcon('KudaGoLogo', false)
        }
    }
}
