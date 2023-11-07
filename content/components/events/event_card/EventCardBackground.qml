import QtQuick 2.15
import QtQuick.Controls
import KudaGo
import '../../../services/events.js' as EventsTools

SwipeView {
    id: swiper
    width: Screen.width
    height: 800

    required property var eventImages

    currentIndex: 0

    Repeater {
        id: images
        model: eventImages
        delegate: Image {
            id: image
            asynchronous: true
            source: eventImages[index]['thumbnails']['640x384']
            fillMode: Image.PreserveAspectCrop
            autoTransform: true

            onStatusChanged: {
                if (image.status === Image.Ready && index === 0) {
                    if (Screen.height / 2.5 < image.paintedHeight) {
                        swiper.height = Screen.height / 2.5
                        image.fillMode = Image.PreserveAspectCrop
                    } else {
                        swiper.height = Math.max(800, image.paintedHeight)
                    }
                }
            }
        }
    }

    onCurrentItemChanged: {
        //console.log(currentItem.paintedHeight, Constants.height / 2)
        swiper.height = Math.max(100, currentItem.paintedHeight)
    }
}
