import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

import org.kde.kirigami 2.7 as Kirigami

import Pico 1.0

Item {
    WelcomeModule {
        id: welcomeModule
    }

    Label {
        id: labelWelcome
        font.weight: Font.Light
        font.pointSize: 32
        text: "Welcome"
        anchors.centerIn: parent
        color: "#444"
    }

    RoundButton {
        width: 64
        height: 64

        anchors {
            horizontalCenter: labelWelcome.horizontalCenter
            top: labelWelcome.bottom
            topMargin: 48
        }
        flat: true
        onClicked: {
            moduleLoader.nextModule()
        }

        Material.background: Material.color(Material.Blue, Material.Shade500)
        Material.elevation: 0

        Kirigami.Icon {
            width: 24
            height: 24

            anchors.centerIn: parent
            source: "draw-arrow-forward" //welcomeModule.dir() + "/assets/next.svg"
            color: "#ffffffff"
        }
    }
}
