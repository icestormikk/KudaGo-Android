import QtQuick 2.15
import QtQuick.Controls
import KudaGo
import '../../services/cities.js' as CitiesTools

ComboBox {
    id: cities_block

    property var categories: [{name: 'Любой город', slug: ''}]

    model: categories
    textRole: 'name'

    Material.foreground: Constants.secondaryColor
    font {
        pointSize: 20
    }
    popup.font: cities_block.font

    background: Rectangle {
        implicitWidth: 160
        implicitHeight: 100
        border {
            color: Constants.secondaryColor
            width: 1
        }

        radius: 2
        color: 'transparent'
    }

    Component.onCompleted: {
        CitiesTools.getCities(
            (response) => {
                cities_block.model = [...categories, ...response]
            }
        )
    }
}
