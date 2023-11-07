import QtQuick 2.15
import QtQuick.Controls

Item {
    id: news_images_swiper_container
    required property var newsImages

    SwipeView {
        id: news_images_swiper
        anchors.fill: parent

        Repeater {
            id: news_images
            anchors.fill: parent

            model: newsImages
            delegate: Image {
                id: image
                asynchronous: true
                width: news_images_swiper_container.width
                source: newsImages[index]['image']
                fillMode: Image.PreserveAspectCrop

                BusyIndicator {
                    running: image.status === Image.Loading
                    anchors {
                        fill: parent
                        margins: 20
                    }
                }
            }
        }
    }

    PageIndicator {
        id: indicator

        count: news_images.count
        currentIndex: news_images_swiper.currentIndex

        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
