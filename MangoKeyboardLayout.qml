import QtQuick
import Quickshell
import Quickshell.Io

import qs.Common
import qs.Widgets
import qs.Modules.Plugins

PluginComponent {
    id: root

    property string layout: "us"

    Process {
        id: mangoProcess

        command: ["mmsg", "watch", "keyboardlayout"]

        running: true

        stdout: SplitParser {
            onRead: data => {
                const value = data.trim()

                if (value.length > 0) {
                    root.layout = value
                }
            }
        }

        onExited: {
            running = true
        }
    }

    function displayLayout(value) {
        const normalized = value.trim().toLowerCase()

        if (normalized.includes("ara"))
            return "AR"

        if (normalized.includes("us"))
            return "EN"

        return normalized.toUpperCase()
    }

    horizontalBarPill: Component {
        StyledRect {
            implicitWidth: layoutText.implicitWidth + Theme.spacingM * 2
            implicitHeight: parent.widgetThickness

            radius: Theme.cornerRadius

            color: Theme.surfaceContainerHigh

            StyledText {
                id: layoutText

                anchors.centerIn: parent

                text: root.displayLayout(root.layout)

                color: Theme.surfaceText

                font.pixelSize: Theme.fontSizeMedium
                font.weight: Font.Medium
            }
        }
    }
}
