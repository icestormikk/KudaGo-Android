pragma Singleton
import QtQuick 6.2
import QtQuick.Studio.Application

QtObject {
    enum Theme {
        Light, Dark
    }
    property int activeTheme : Constants.Theme.Light

    readonly property string applicationTitle: 'KudaGo'

    readonly property color mainColor : activeTheme ? "#222222" : "#FFFFFF"
    readonly property color mainSelectionColor: activeTheme ? "#1aaad7" : "#1aaad7"
    readonly property color secondaryColor : activeTheme ? "#EFEFEF" : "#09102B"
    readonly property color applicationBackgroundColor: activeTheme ? '#141414' : '#B3DCFD'

    readonly property string homePageName: 'homePage'
    readonly property string searchPageName: 'searchPage'
    readonly property string favouriteEventsPageName: 'favouriteEventsPage'
    readonly property string eventPageName: 'eventPage'
    readonly property string todayEventsPageName: 'todayEventsPage'
    readonly property string newsPageName: 'newsPage'
    readonly property string compilationsPageName: 'compilationsPage'
    readonly property string compilationPageName: 'compilationPage'

    function getIcon(iconName, addSuffix = true) {
        return Qt.resolvedUrl(`/icons/${iconName}${activeTheme === Constants.Theme.Dark && addSuffix ? "_Dark.svg" : ".svg"}`)
    }

    function getImage(image) {
        return Qt.resolvedUrl(`../icons/${image}`)
    }
}
