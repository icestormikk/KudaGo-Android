import QtQuick 2.15
import QtQuick.Controls
import KudaGo
import '../../../ui'

Page {
    id: event_additional_attributes_page
    objectName: 'eventAdditionalAttributes'

    property var selectedEventData: EventsStore.selectedEvent

    background: Rectangle {
        anchors.fill: parent
        color: 'transparent'
    }

    function getStaticAdditionalAttributes() {
        if (!selectedEventData) {
            return []
        }

        return [
            {
                id: 'price',
                title: 'Стоимость',
                icon: Constants.getIcon('Cost'),
                value: selectedEventData['price'] || 'Бесплатно'
            },
            {
                id: 'age',
                title: 'Возрастное органичение',
                icon: Constants.getIcon('Age'),
                value: selectedEventData['age_restriction'] || 0
            },
            {
                id: 'site',
                title: 'Ссылка на сайт',
                icon: Constants.getIcon('Link'),
                value: selectedEventData['site_url'] || 'Отсутствует'
            }
        ]
    }

    Column {
        id: attributes_container
        anchors {
            fill: parent
            margins: 20
        }
        spacing: 40

        Repeater {
            id: event_attributes

            model: getStaticAdditionalAttributes()
            delegate: Item {
                id: attribute
                width: attributes_container.width
                height: Math.max(value.height, 30)

                Row {
                    anchors.fill: parent
                    spacing: 20

                    Icon {
                        id: attribute_icon
                        anchors.verticalCenter: parent.verticalCenter
                        width: 100
                        height: width
                        iconUrl: modelData['icon']
                    }
                    Column {
                        id: attribute_value
                        anchors.verticalCenter: parent.verticalCenter
                        width: attribute.width - (attribute_icon.width + parent.spacing)
                        height: parent.height

                        Label {
                            id: value
                            text: `<b>${modelData['title']}: </b>${modelData['id'] === 'site' ? `<a href='${modelData['value']}'>${modelData['value']}</a>` : `<span>${modelData['value']}</span>`}`
                            font {
                                pointSize: 16
                            }
                            width: parent.width
                            wrapMode: Text.WordWrap
                            onLinkActivated: (link) => Qt.openUrlExternally(link)
                            color: Constants.secondaryColor
                        }
                    }
                }
            }
        }
    }
}
