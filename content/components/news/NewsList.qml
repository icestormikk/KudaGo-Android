import QtQuick 2.15
import QtQuick.Controls
import '../../services/news.js' as NewsTools
import '../../ui/buttons'

Item {
    id: news_container
    anchors.fill: parent

    required property var news
    readonly property bool isLoading: !Boolean(news)
    property string nextPageLink

    ScrollView {
        id: view
        anchors.fill: parent

        Column {
            width: view.width
            height: view.height
            spacing: 40

            Item {
                visible: isLoading
                width: parent.width
                height: parent.height

                BusyIndicator {
                    anchors.centerIn: parent
                    running: isLoading
                }
            }

            Repeater {
                id: events_list
                visible: !isLoading
                width: parent.width
                height: parent.height - load_more_button.height

                model: news
                delegate: NewsCard {}
            }

            Item {
                id: load_more_button
                width: parent.width
                height: 120

                LoadingButton {
                    id: load_button
                    visible: Boolean(nextPageLink)

                    onClicked: {
                        load_button.isLoading = true
                        NewsTools.appendNews(
                            String(nextPageLink),
                            (results, next) => {
                                newsData = [...newsData, ...results]
                                nextPageLink = next
                                load_button.isLoading = false
                            }
                        )
                    }
                }
            }
        }
    }
}
