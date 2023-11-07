import QtQuick 2.15
import QtQuick.Controls
import KudaGo
import '../../ui'

Item {
    id: home_page_section
    width: parent.width
    height: 900

    function getStaticEventCollections() {
        return [
            {
                title: 'События дня',
                description: 'Узнайте какие меропрятия проходят прямо сейчас',
                image: 'Today',
                bgColor: '#f2c4bf',
                pageAddress: Qt.resolvedUrl('../../pages/TodayEventsPage.qml')
            },
            {
                title: 'Новости',
                description: 'Вести об интересных местах и событиях',
                image: 'News_Colored',
                bgColor: 'white',
                pageAddress: Qt.resolvedUrl('../../pages/NewsPage.qml')
            },
            {
                title: 'Подборки',
                description: 'События, места, фильмы - всё, что редакция KudaGo посчитала интересным',
                image: 'Group',
                bgColor: '#f2f0b6',
                pageAddress: Qt.resolvedUrl('../../pages/CompilationsPage.qml')
            }
        ]
    }

    function getFavouriteEventsLabel() {
        const totalCount = events_service.getAllFavouriteEvents().length

        switch (totalCount) {
            case 0: {
                return 'Вы ещё ничего не добавили в избранное'
            }
            case 1: {
                return '1 мероприятие'
            }
            case 2:
            case 3:
            case 4: {
                return `${totalCount} мероприятия`
            }
            default: {
                return `${totalCount} мероприятий`
            }
        }
    }

    Column {
        anchors {
            fill: parent
            margins: 10
        }
        spacing: 20

        Rectangle {
            id: collections_rect
            width: home_page_section.width - parent.anchors.margins * 2
            height: parent.height + 45
            color: Qt.rgba(255, 255, 255, Constants.activeTheme ? 0.1 : 0.5)
            radius: 10
            clip: true

            Column {
                anchors {
                    fill: parent
                    margins: 20
                }
                spacing: 10

                Item {
                    id: section_title_rect
                    width: parent.width
                    height: childrenRect.height

                    Label {
                        id: section_title
                        anchors {
                            left: parent.left
                            leftMargin: 5
                        }

                        text: 'Подборки событий'
                        font {
                            weight: 800
                            pointSize: 20
                        }
                        color: Constants.secondaryColor
                        wrapMode: Text.NoWrap
                        elide: Text.ElideRight
                    }
                }

                ListView {
                    id: collections
                    width: parent.width
                    height: 900

                    orientation: ListView.Horizontal
                    spacing: 20

                    model: getStaticEventCollections()
                    delegate: HomePageSectionItem {}
                }
            }
        }

        Item {
            width: parent.width
            height: childrenRect.height

            Label {
                id: sec_section_title
                anchors {
                    left: parent.left
                    leftMargin: 15
                }
                text: 'Ваши избранные мероприятия'
                color: Constants.secondaryColor
                font: section_title.font
                wrapMode: section_title.wrapMode
                elide: section_title.elide
            }
        }

        Item {
            id: favourite_events_card
            width: parent.width
            height: 200

            Button {
                id: favourite_events_button
                anchors {
                    fill: parent
                }
                flat: true

                background: Rectangle {
                    anchors.fill: parent
                    color: collections_rect.color
                    radius: 10
                    clip: true

                    Row {
                        anchors {
                            fill: parent
                            leftMargin: 10
                            rightMargin: 10
                        }

                        spacing: 10

                        Icon {
                            anchors.verticalCenter: parent.verticalCenter
                            height: parent.height - 30
                            width: height
                            iconUrl: Constants.getIcon('Favourite_Colored', false)
                        }
                        Column {
                            anchors.verticalCenter: parent.verticalCenter

                            Label {
                                id: favourite_label
                                text: 'Избранное'
                                font {
                                    bold: true
                                    pointSize: 18
                                }
                                color: Constants.secondaryColor
                            }
                            Label {
                                text: getFavouriteEventsLabel()
                                font {
                                    pointSize: 14
                                }
                                color: favourite_label.color
                            }
                        }
                    }
                }

                onClicked: {
                    pages_stack.push('../../pages/FavouriteEventsPage.qml')
                }
            }
        }
    }
}
