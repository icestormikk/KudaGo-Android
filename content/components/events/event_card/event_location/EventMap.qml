import QtQuick 2.15
import QtLocation
import QtPositioning

Item {
    width: parent.width
    height: parent.height

    required property var coordinates

    Plugin {
        id: mapPlugin
        name: "osm"
    }

    Map {
        id: map
        width: parent.width
        height: parent.height
        plugin: mapPlugin

        property geoCoordinate startCentroid

        center: QtPositioning.coordinate(
            coordinates['lat'], coordinates['lon']
        )
        zoomLevel: 16

        PinchHandler {
            id: pinch
            target: null
            onActiveChanged: if (active) {
                map.startCentroid = map.toCoordinate(pinch.centroid.position, false)
            }
            onScaleChanged: (delta) => {
                map.zoomLevel += Math.log2(delta)
                map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
            }
            onRotationChanged: (delta) => {
                map.bearing -= delta
                map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
            }
            grabPermissions: PointerHandler.TakeOverForbidden
        }
        WheelHandler {
            id: wheel
            acceptedDevices: Qt.platform.pluginName === "cocoa" || Qt.platform.pluginName === "wayland"
                ? PointerDevice.Mouse | PointerDevice.TouchPad
                : PointerDevice.Mouse
            rotationScale: 1/120
            property: "zoomLevel"
        }
        DragHandler {
            id: drag
            target: null
            onTranslationChanged: (delta) => map.pan(-delta.x, -delta.y)
        }
        Shortcut {
            enabled: map.zoomLevel < map.maximumZoomLevel
            sequence: StandardKey.ZoomIn
            onActivated: map.zoomLevel = Math.round(map.zoomLevel + 1)
        }
        Shortcut {
            enabled: map.zoomLevel > map.minimumZoomLevel
            sequence: StandardKey.ZoomOut
            onActivated: map.zoomLevel = Math.round(map.zoomLevel - 1)
        }

        MapCircle {
            center: QtPositioning.coordinate(
                coordinates['lat'], coordinates['lon']
            )
            radius: 20
            color: 'red'
            border {
                width: 2
                color: 'white'
            }
        }
    }
}
