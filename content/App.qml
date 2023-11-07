// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import KudaGo
import QtQuick.Controls
import './components/footer'
import './components/'
import './pages'
import './storage'

ApplicationWindow {
    id: app_window

    EventsDatabaseService {
        id: events_service
    }

    property alias isFooterVisible: footer.visible

    width: Screen.width
    height: Screen.height

    maximumHeight: height
    maximumWidth: width

    minimumHeight: height
    minimumWidth: width

    visible: true
    title: "ProjectSamples"
    color: Constants.applicationBackgroundColor

    StackView {
        id: pages_stack
        width: parent.width
        height: parent.height
        initialItem: HomePage {}

        onCurrentItemChanged: {
            isFooterVisible = ![Constants.eventPageName, Constants.compilationPageName].includes(currentItem.objectName)
        }
    }

    footer: Footer {
        id: footer
    }

    CustomPopup {
        id: popup_window
        visible: false
    }
}
