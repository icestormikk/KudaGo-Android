import QtQuick 2.15
import QtQuick.Controls
import KudaGo
import '../services/news.js' as NewsTools
import '../ui'
import '../components/news'

Page {
    id: news_page
    objectName: Constants.newsPageName

    property var newsData
    property string nextPageUrl

    background: Rectangle {
        anchors.fill: parent
        color: 'transparent'
    }

    ScrollView {
        id: news_view
        anchors {
            fill: parent
            margins: 10
        }

        Column {
            anchors.fill: parent

            Row {
                id: news_block
                width: parent.width
                spacing: 10

                Rectangle {
                    id: news_icon_container
                    height: 240
                    width: height
                    radius: 4
                    clip: true
                    color: 'white'
                    border {
                        width: Constants.activeTheme ? 0 : 1
                        color: 'lightgray'
                    }

                    Icon {
                        height: parent.height
                        width: height
                        iconUrl: Constants.getIcon('News_Colored', false)
                        iconMargins: 10
                    }
                }

                Column {
                    width: parent.width - news_icon_container.width
                    height: parent.height
                    spacing: 2

                    Label {
                        id: today_events_title
                        text: 'Новости'
                        font {
                            bold: true
                            pointSize: 18
                        }
                        width: parent.width - 10
                        color: Constants.secondaryColor
                    }
                    Label {
                        id: today_events_description
                        text: 'Последние новости со всех уголков мира. Статьи из этого раздела подготовлены редакцией компании <b>KudaGo</b>.'
                        font {
                            pointSize: 14
                        }
                        opacity: 0.6
                        width: today_events_title.width
                        wrapMode: Text.WordWrap
                        elide: "ElideRight"
                        color: today_events_title.color
                    }
                }
            }

            Item {
                width: parent.width
                height: parent.height - news_block.height

                NewsList {
                    anchors {
                        topMargin: 40
                    }

                    news: newsData
                    nextPageLink: nextPageUrl
                }
            }
        }
    }

    Component.onCompleted: {
        NewsTools.getAllNews(
            (response) => {
                newsData = response.results
                nextPageUrl = response.next
            }
        )
    }
}
