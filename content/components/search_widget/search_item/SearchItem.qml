import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import KudaGo
import '../../../ui'
import '../../../ui/buttons'

Rectangle {
    id: search_item

    property alias title: search_item_title.text
    property alias description: search_item_description.text

    required property Component content

    color: Constants.mainColor

    ScrollView {
        id: item_view
        anchors {
            fill: parent
            margins: 40
        }

        Column {
            id: search_item_container
            anchors {
                fill: parent
                horizontalCenter: parent.horizontalCenter
            }
            spacing: 40

            ItemTitle {
                id: search_item_title
                textPointSize: 24
            }

            ItemDescription {
                id: search_item_description
                container: search_item_container
                textPointSize: search_item_title.textPointSize * 0.8
            }

            Loader {
                id: content_loader
                width: parent.width
                height: content.height
                sourceComponent: content
            }
        }
    }
}
