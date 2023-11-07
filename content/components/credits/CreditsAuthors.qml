import QtQuick 2.15
import QtQuick.Controls
import KudaGo
import '../../ui'

Column {
    anchors {
        left: parent.left
        leftMargin: 10
        right: parent.right
        rightMargin: 10
    }
    height: 500

    Item {
        width: parent.width
        height: 250

        Icon {
            id: designer_icon
            width: 240
            height: width
            iconUrl: Constants.getIcon('Designer', false)
            anchors {
                left: parent.left
                top: parent.top
                topMargin: 10
            }
        }
        Icon {
            width: 180
            height: width
            iconUrl: Constants.getIcon('GraphicDesign', false)
            x: designer_icon.width
            y: designer_icon.height - height
            opacity: 0.6
        }

        Column {
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
            }

            Label {
                id: title
                text: 'Графический дизайнер'
                font {
                    weight: 900
                    pointSize: 22
                }
                horizontalAlignment: "AlignRight"
                opacity: 0.8
                color: Constants.secondaryColor
                width: parent.width
                wrapMode: Text.WordWrap
            }
            Label {
                id: value
                text: 'Darya Bondarenko'
                font {
                    weight: 600
                    pointSize: 18
                }
                horizontalAlignment: "AlignRight"
                color: Constants.secondaryColor
                opacity: 0.5
            }
        }
    }

    Item {
        width: parent.width
        height: 250

        Icon {
            id: programmer_icon
            width: 240
            height: width
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }

            iconUrl: Constants.getIcon('Programmer', false)
        }
        Icon {
            width: 180
            height: width
            iconUrl: Constants.getIcon('Code', false)
            anchors {
                right: programmer_icon.left
                rightMargin: -10
                bottom: programmer_icon.bottom
            }

            opacity: 0.6
        }

        Column {
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
            }

            Label {
                text: 'Разработчик'
                font: title.font
                opacity: title.opacity
                horizontalAlignment: "AlignLeft"
                color: Constants.secondaryColor
            }
            Label {
                text: 'Pavel Zhigalov'
                font: value.font
                opacity: value.opacity
                horizontalAlignment: "AlignLeft"
                color: Constants.secondaryColor
            }
        }
    }
}
