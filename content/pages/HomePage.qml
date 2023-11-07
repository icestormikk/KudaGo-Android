import QtQuick 2.15
import QtQuick.Controls
import KudaGo
import '../components/home_page_section'
import '../ui'

Page {
    id: home_page
    objectName: Constants.homePageName

    background: Rectangle {
        anchors.fill: parent
        color: 'transparent'
    }
    header: Item {
        id: header
        width: parent.width
        height: 120

        Item {
            id: switch_theme_buttons
            height: parent.height
            width: height
            anchors {
                left: parent.left
                top: parent.top
                leftMargin: 4
                topMargin: 4
            }

            IconButton {
                id: light_theme_button
                height: parent.height
                width: height
                x: parent.width / 2

                url: Constants.getIcon('LightMode', false)
                onButtonClicked: () => {
                    Constants.activeTheme = Constants.Theme.Dark
                }

                Behavior on x {
                    NumberAnimation { duration: 200 }
                }
            }

            IconButton {
                id: dark_theme_button
                height: parent.height
                width: height
                x: parent.width / -2

                url: Constants.getIcon('DarkMode', false)
                onButtonClicked: () => {
                    Constants.activeTheme = Constants.Theme.Light
                }

                Behavior on x {
                    NumberAnimation { duration: 200 }
                }
            }

            states: [
                State {
                    name: "isLightMode"
                    when: Constants.activeTheme === Constants.Theme.Light
                    PropertyChanges {
                        target: light_theme_button
                        x: 0
                    }
                    PropertyChanges {
                        target: dark_theme_button
                        x: -switch_theme_buttons.width
                    }
                },
                State {
                    name: "isDarkMode"
                    when: Constants.activeTheme === Constants.Theme.Dark
                    PropertyChanges {
                        target: light_theme_button
                        x: -switch_theme_buttons.width
                    }
                    PropertyChanges {
                        target: dark_theme_button
                        x: 0
                    }
                }
            ]
        }

        IconButton {
            height: parent.height
            width: height
            anchors {
                right: parent.right
                top: parent.top
                rightMargin: switch_theme_buttons.anchors.leftMargin
                topMargin: switch_theme_buttons.anchors.topMargin
            }

            url: Constants.getIcon('About', false)
            onButtonClicked: () => {
               popup_window.modalTitle = 'О приложении'
               popup_window.content = '../components/credits/Credits.qml'
               popup_window.open()
            }
        }
    }

    Item {
        width: parent.width
        height: parent.height - header.height

        Column {
            anchors.fill: parent
            spacing: 40

            Column {
                width: parent.width

                Text {
                    id: title
                    text: 'KudaGo'
                    font {
                        bold: true
                        pointSize: 70
                    }
                    color: 'white'
                    anchors.horizontalCenter: parent.horizontalCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                Text {
                    id: slogan
                    text: 'Живи интересно!'
                    font {
                        italic: true
                        pointSize: title.font.pointSize * 0.4
                    }
                    color: 'white'
                    anchors.horizontalCenter: parent.horizontalCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            HomePageSection {}
        }
    }
}
