import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15

import org.kde.kirigami 2.7 as Kirigami

import Pico 1.0

Item {
    property alias moduleName: labelModuleName.text

    RoundButton {
        width: 48
        height: 48

        anchors {
            right: labelModuleName.left
            rightMargin: 4
            verticalCenter: labelModuleName.verticalCenter
        }
        flat: true
        onClicked: {
            moduleLoader.previousModule()
            appStack.pop()
        }
        visible: moduleLoader.hasPrevious
        z: 100

        Kirigami.Icon {
            anchors.fill: parent
            anchors.centerIn: parent
            source: "draw-arrow-back" //Qt.resolvedUrl("../assets/back.svg")
            color: "#ffffffff"
            anchors.margins: 12
        }
    }

    Label {
        id: labelModuleName
        anchors {
            left: parent.left
            top: parent.top
            leftMargin: 56
            topMargin: 56
        }
        font.weight: Font.Light
        font.pointSize: 24
        color: "#fff5f5f5"
    }

    Pane {
        id: control
        anchors {
            fill: parent
            leftMargin: 56
            rightMargin: 56
            topMargin: 112
        }
        background: Rectangle {
            color: control.Material.backgroundColor
            radius: 4

            layer.enabled: true
            layer.effect: ElevationEffect {
                elevation: control.Material.elevation
            }
        }
        Material.elevation: 6
    }
}
