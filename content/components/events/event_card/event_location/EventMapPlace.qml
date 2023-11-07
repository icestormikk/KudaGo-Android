import QtQuick 2.15
import QtQuick.Controls
import QtLocation
import QtPositioning
import KudaGo
import '../../../../ui'

Page {
    id: event_place_info_page
    objectName: 'eventPlaceMap'

    background: Rectangle {
        anchors.fill: parent
        color: 'transparent'
    }

    required property var eventLocationData

    function isPlaceDefined() {
        return eventLocationData['place'] !== null
    }

    function getCoordinates() {
        if (isPlaceDefined()) {
            return eventLocationData['place']['coords']
        }
        return eventLocationData['location']['coords']
    }

    Column {
        anchors {
            fill: parent
            margins: 20
        }
        spacing: 10

        Rectangle {
            id: location_info_container
            width: parent.width
            height: 200
            border {
                width: 1
                color: 'gray'
            }
            radius: 4
            clip: true
            color: Constants.mainColor

            Row {
                anchors {
                    fill: parent
                    margins: 10
                }
                spacing: 10

                Icon {
                    id: location_icon
                    anchors.verticalCenter: parent.verticalCenter
                    width: 100
                    height: width
                    iconUrl: Constants.getIcon('Map')
                }

                Column {
                    id: location_full_info
                    width: parent.width - location_icon.width
                    height: location_name.height + (isPlaceDefined() ? location_address.height : 0)
                    anchors.verticalCenter: parent.verticalCenter

                    Label {
                        id: location_name
                        width: parent.width
                        wrapMode: Text.WordWrap
                        text: eventLocationData['location']['name']
                        font {
                            bold: true
                            pointSize: 18
                        }
                        color: Constants.secondaryColor
                    }

                    Label {
                        id: location_address
                        visible: eventLocationData['place']['address'] !== null
                        width: parent.width
                        text: eventLocationData['place']['address'] || ''
                        font {
                            bold: true
                            pointSize: location_name.font.pointSize * 0.8
                        }
                        wrapMode: Text.WordWrap
                        color: location_name.color
                        opacity: 0.5
                    }

                    states: [
                        State {
                            name: "isPlaceDefined"
                            when: isPlaceDefined()
                            PropertyChanges {
                                target: location_name
                                text: eventLocationData['place']['title'].charAt(0).toUpperCase()
                                      + eventLocationData['place']['title'].slice(1)
                            }
                            PropertyChanges {
                                target: location_address
                                visible: true
                                text: [eventLocationData['location']['name'], eventLocationData['place']['address']].join(', ')
                            }
                        },
                        State {
                            name: "isPlaceNotDefined"
                            PropertyChanges {
                                target: location_name
                                text: eventLocationData['location']['name']
                            }
                            PropertyChanges {
                                target: location_address
                                visible: false
                            }
                        }
                    ]
                }
            }
        }

        EventMap {
            height: event_place_info_page.height - location_info_container.height
            coordinates: getCoordinates()
        }
    }
}
