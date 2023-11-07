pragma Singleton
import QtQuick 6.2

QtObject {
    property var events: QtObject {
        property bool isLoading: false
        property int totalCount: 0
        property var items: []
        property var favouriteItems: []
        property var filterParameters
    }

    property string next
    property string previous
    property var selectedEvent
}
