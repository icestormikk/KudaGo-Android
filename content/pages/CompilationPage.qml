import QtQuick 2.15
import QtQuick.Controls
import KudaGo
import '../services/compilations.js' as CompilationsTools

Page {
    id: compilation_page
    objectName: Constants.compilationPageName

    property int compilationId

    background: Rectangle {
        anchors.fill: parent
        color: 'transparent'
    }

    Item {
        anchors.fill: parent

        Loader {
            id: compilation_loader
            anchors.fill: parent
        }
    }

    onCompilationIdChanged: {
        if (!compilationId) {
            return
        }

        CompilationsTools.getCompilationById(
            compilationId,
            (response) => {
                compilation_loader.setSource('../components/compilation/CompilationCard.qml', {compilationData: response})
            }
        )
    }
}
