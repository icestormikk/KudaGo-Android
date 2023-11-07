import QtQuick 2.15
import QtQuick.Controls
import '../../services/compilations.js' as CompilationsTools
import '../../ui/buttons'

Item {
    anchors.fill: parent

    required property var compilations
    readonly property bool isLoading: !Boolean(compilations)
    property string nextPageLink

    ScrollView {
        id: view
        anchors.fill: parent

        Column {
            width: view.width
            height: view.height
            spacing: 30

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

                model: compilations
                delegate: CompilationShortCard {}
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
                        CompilationsTools.appendCompilations(
                            String(nextPageLink),
                            (results, next) => {
                                compilations = [...compilations, ...results]
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
