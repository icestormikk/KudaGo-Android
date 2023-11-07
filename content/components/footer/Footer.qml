import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import KudaGo
import '../../ui'

Rectangle {
    id: footer
    z: 0
    width: parent.width
    height: 180
    color: Constants.mainColor

    radius: 40

    Rectangle {
        z: -10
        y: parent.height / 2
        height: parent.height / 2
        width: parent.width
        color: Constants.mainColor
    }

    RowLayout {
        anchors.fill: parent

        FooterButton {
            Layout.alignment: Qt.AlignHCenter
            pageName: Constants.homePageName
            buttonUrl: '../../pages/HomePage.qml'
            iconTitle: 'Home'
            iconLocalizedTitle: 'Главная'
        }

        FooterButton {
            Layout.alignment: Qt.AlignHCenter
            pageName: Constants.searchPageName
            buttonUrl: '../../pages/SearchPage.qml'
            iconTitle: 'Search'
            iconLocalizedTitle: 'Поиск'
        }

        FooterButton {
            Layout.alignment: Qt.AlignHCenter
            pageName: Constants.favouriteEventsPageName
            buttonUrl: '../../pages/FavouriteEventsPage.qml'
            iconTitle: 'Favourite'
            iconLocalizedTitle: 'Избранное'
        }
    }
}
